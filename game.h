#include "gba.h"
#include "mode0.h"
#include "sprites.h"

#define BLANK_TILE 0
#define HUD_SCREENBLOCK 16
#define HUD_PALROW 2
#define HUD_LIFE_TILE 1

#define PLAYER_SPEED 10
#define ATTACK_LUNGE_SPEED 8
#define MAX_LIVES 3
#define CHEAT_LIVES 12
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
static int playerHitFrames[] = {26, 0, 26};
static int swordFrames[] = {74, 76, 78, 80};
static int swordOffsetSide[][2] = {{-6, -2}, {-7, -2}, {-7, 1}, {-6, 1}};
static int swordOffsetDown[][2] = {{0, -1}, {0, 5}, {3, 5}, {3, 5}};
static int swordOffsetUp[][2] = {{2, -5}, {2, -5}, {0, -5}, {0, -5}};
static int enemyPatrolPoints[][4][2] = {{{200, 424}, {272, 424}, {272, 460}, {200, 460}}, {{368, 416}, {424, 416}, {424, 440}, {368, 440}}, 
                                        {{456, 352}, {392, 352}, {392, 384}, {456, 384}}, {{360, 320}, {424, 320}, {424, 272}, {360, 272}},
                                        {{296, 264}, {296, 304}, {360, 304}, {360, 264}}, {{192, 240}, {232, 240}, {232, 304}, {192, 304}}, 
                                        {{128, 224}, {128, 264}, {168, 264}, {168, 224}}, {{56, 200}, {136, 200}, {56, 200}, {136, 200}},
                                        {{72, 96}, {72, 128}, {128, 128}, {128, 96}}, {{168, 112}, {120, 112}, {120, 72}, {168, 72}},
                                        {{216, 40}, {216, 72}, {176, 72}, {176, 40}}};
static int enemyIdleFrames[] = {0};
static int enemyWalkFrames[] = {2, 4, 6, 8, 10};
static int enemyAttackFrames[] = {12, 14, 16, 18, 20, 22, 24};
static int korokFrames[] = {576, 578, 580, 582};

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

#define MAX_ENEMIES 11
#define ENEMY_SPEED 6
#define ENEMY_VIEWDISTANCE 40
#define ENEMY_ROW_OFFSET 12
#define ENEMY_ATTACK_FRAME 3
#define BULLET_LIFETIME 120

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

#define MAX_SLASHES 3
#define SLASH_SPEED 20
#define SLASH_LIFETIME 60
#define SLASH_TILE 26

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
} Slash;

typedef struct {
    int active;
    int x;
    int y;
    int promptVisible;
    int timeUntilNextFrame;
    int currentFrame;
    int* frames;
    int numFrames;
    u8 oamIndex;
} Korok;

#define BUSH_COLLISION_COLOR 4
#define CUT_BUSH_COLLISION_COLOR 0
#define BUSH_LAYER_SCREENBLOCK 24
#define CUT_BUSH_TILE_ID 129
#define MAX_BUSHES 64

typedef struct {
    int tileX;
    int tileY;
    int cut;
} Bush;

void initGame();
void initPlayer();
void initSword();
void initSlashes();
void initEnemies();
void initBullets();
void initKorok();
void initBushes();

void updateGame();
void updateEnvironment();
void updateCamera();
void setPlayerMovementFromInputs();
void moveAndCollidePlayer();
void updatePlayer();
void attack();
void updateSlashes();
void updateEnemies();
void updateEnemy(Enemy* enemy);
void updateBullets();
void spawnBullet(int x, int y, DIRECTION direction);
int checkBushCollision(int x, int y);
int checkHitboxCollision(int left, int top, int right, int bottom, u32 colorMask);
void checkEntityCollisions();
void updateKorok();

void drawGame();
void drawPlayer();
void drawSlashes();
void drawEnemies();
void drawBullets();
void drawKorok();
void drawHUD();

extern Player player;
extern Sword sword;
extern Enemy enemies[MAX_ENEMIES];
extern Bullet bullets[MAX_BULLETS];
extern Korok korok;
extern Slash slashes[MAX_SLASHES];
extern int lives;
extern int winFlag;
extern int cheatFlag;