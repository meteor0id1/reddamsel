#include "gba.h"
#include "mode0.h"
#include "sprites.h"

u8 colorAt(int x, int y);
u8 mapCollide(int x, int y);

void initGame();
void initPlayer();
void initEnemies();

void updateGame();
void updateCamera();
void updatePlayer();
void updateEnemies();

void drawGame();
void drawPlayer();
void drawEnemies();

#define FIXED_POINT_SHIFT 4
#define TO_FIXED(x) ((x) << FIXED_POINT_SHIFT)
#define FROM_FIXED(x) ((x) >> FIXED_POINT_SHIFT)

#define PLAYER_SPEED 12

typedef enum {LEFT, RIGHT, DOWN, UP} DIRECTION;
typedef enum {IDLE, WALK, DODGE, HIT} ANIMATION_STATE;

static int idleFrames[] = {0};
static int walkFrames[] = {1, 2, 3, 4, 5, 6};
static int dodgeFrames[] = {7, 8, 9, 10, 11, 12};

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