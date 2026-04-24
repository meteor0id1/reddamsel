#include "gba.h"
#include "mode0.h"
#include "sprites.h"

#define BLANK_TILE 0
#define HUD_SCREENBLOCK 16
#define HUD_PALROW 2
#define HUD_LIFE_TILE 1

#define PLAYER_SPEED 10
#define MAX_LIVES 3
#define FRAME_DURATION 6
#define PLAYER_COLLISION_MASK ((1 << 1) | (1 << 3))
#define BULLET_COLLISION_MASK (1 << 1)

typedef enum {LEFT, RIGHT, DOWN, UP} DIRECTION;
typedef enum {IDLE, WALK, DODGE, ATTACK, HIT} ANIMATION_STATE;
typedef enum {PATROL, CHASE, RETURN} ENEMY_STATE;

static int waterColorUpdate[] = {0x63FF, 0x63FF, 0x63FF, 0x5F51, 0x4AAA, 0x4AAA, 0x4AAA, 0x5F51};

static int playerIdleFrames[] = {0};
static int playerWalkFrames[] = {2, 4, 6, 8, 10, 12};
static int playerDodgeFrames[] = {14, 16, 18, 20, 22, 24};
static int playerAttackFrames[] = {64, 66, 68, 70};
static int swordFrames[] = {74, 76, 78, 80};
static int swordOffsetSide[][2] = {{-6, -2}, {-7, -2}, {-7, 1}, {-6, 1}};
static int swordOffsetDown[][2] = {{0, -1}, {0, 5}, {3, 5}, {3, 5}};
static int swordOffsetUp[][2] = {{2, -5}, {2, -5}, {0, -5}, {0, -5}};
static int enemyPatrolPoints[][4][2] = {{{176, 416}, {232, 416}, {232, 472}, {176, 472}}, {{348, 408}, {392, 408}, {392, 456}, {348, 456}}, 
                                        {{384, 368}, {472, 368}, {472, 400}, {384, 400}}, {{184, 232}, {232, 232}, {232, 288}, {184, 288}}};
static int enemyIdleFrames[] = {0};
static int enemyWalkFrames[] = {2, 4, 6, 8, 10};
static int enemyAttackFrames[] = {12, 14, 16, 18, 20, 22, 24};

typedef struct {
    int x;
    int y;
    int vX;
    int vY;
    int hitboxOffX;
    int hitboxOffY;
    int hitboxW;
    int hitboxH;
    int timeUntilNextFrame;
    DIRECTION direction;
    int currentFrame;
    int* frames;
    int numFrames;
    ANIMATION_STATE state;
    u8 oamIndex;
} Player;

typedef struct {
    int active;
    int offX;
    int offY;
    int hitboxOffX;
    int hitboxOffY;
    int hitboxW;
    int hitboxH;
    int timeUntilNextFrame;
    int* frames;
    int numFrames;
    u8 oamIndex;
} Sword;

#define MAX_ENEMIES 4
#define ENEMY_SPEED 6
#define ENEMY_VIEWDISTANCE 40
#define ENEMY_ROW_OFFSET 12
#define ENEMY_ATTACK_FRAME 3
#define BULLET_MAX_LIFETIME 180

typedef struct {
    int active;
    int x;
    int y;
    int vX;
    int vY;
    int hitboxOffX;
    int hitboxOffY;
    int hitboxW;
    int hitboxH;
    ENEMY_STATE state;
    int shotCooldown;
    int timeUntilNextFrame;
    DIRECTION direction;
    int currentFrame;
    int* frames;
    int numFrames;
    ANIMATION_STATE animState;
    int patrolTargetIndex;
    int firedShot;
    u8 oamIndex;
} Enemy;

#define MAX_BULLETS 16
#define BULLET_SPEED 8

typedef struct {
    int active;
    int x;
    int y;
    int vX;
    int vY;
    int hitboxOffX;
    int hitboxOffY;
    int hitboxW;
    int hitboxH;
    DIRECTION direction;
    int lifetime;
    u8 oamIndex;
} Bullet;

void initGame();
void initPlayer();
void initSword();
void initEnemies();
void initBullets();

void updateGame();
void updateEnvironment();
void updateCamera();
void updatePlayer();
void attack();
void updateEnemies();
void updateEnemy(Enemy* enemy);
void updateBullets();
void spawnBullet(int x, int y, DIRECTION direction);
void checkEntityCollisions();

void drawGame();
void drawPlayer();
void drawEnemies();
void drawBullets();
void drawHUD();

extern Player player;
extern Sword sword;
extern Enemy enemies[MAX_ENEMIES];
extern Bullet bullets[MAX_BULLETS];
extern int lives;
extern int winFlag;