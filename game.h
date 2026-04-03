#include "gba.h"
#include "mode0.h"
#include "sprites.h"

#define FIXED_POINT_SHIFT 4
#define TO_FIXED(x) ((x) << FIXED_POINT_SHIFT)
#define FROM_FIXED(x) ((x) >> FIXED_POINT_SHIFT)

#define PLAYER_SPEED 12

typedef enum {LEFT, RIGHT, DOWN, UP} DIRECTION;
typedef enum {IDLE, WALK, DODGE, ATTACK, HIT} ANIMATION_STATE;

static int idleFrames[] = {0};
static int walkFrames[] = {1, 2, 3, 4, 5, 6};
static int dodgeFrames[] = {7, 8, 9, 10, 11, 12};
static int attackFrames[] = {32, 33, 34, 35, 36};
static int swordFrames[] = {37, 38, 39, 40, 41};
static int swordOffsetSide[][2] = {{-6, -2}, {-7, -2}, {-7, 1}, {-6, 1}};
static int swordOffsetDown[][2] = {{0, -1}, {0, 5}, {3, 5}, {3, 5}};
static int swordOffsetUp[][2] = {{2, -5}, {2, -5}, {0, -5}, {0, -5}};

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

#define MAX_ENEMIES 1
#define ENEMY_SPEED 4

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
    int timeUntilNextFrame;
    DIRECTION direction;
    int currentFrame;
    int* frames;
    int numFrames;
    ANIMATION_STATE state;
    u8 oamIndex;
} Enemy;

u8 colorAt(int x, int y);
u8 mapCollide(int x, int y);

void initGame();
void initPlayer();
void initSword();
void initEnemies();

void updateGame();
void updateCamera();
void updatePlayer();
void attack();
void updateEnemies();
void updateEnemy(Enemy* enemy);
void checkEntityCollisions();

void drawGame();
void drawPlayer();
void drawEnemies();

extern Player player;
extern Sword sword;
extern Enemy enemies[MAX_ENEMIES];
extern int lives;