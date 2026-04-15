# 0 "main.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "main.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 44 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 63 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 97 "gba.h"
void DMANow(int channel, volatile void *src, volatile void *dest, unsigned int ctrl);
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "main.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "sprites.h"
void hideSprites();


typedef struct {
  int x;
  int y;
  int xVel;
  int yVel;
  int width;
  int height;
  int timeUntilNextFrame;
  int direction;
  int isAnimating;
  int currentFrame;
  int numFrames;
  u8 oamIndex;
} SPRITE;
# 4 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.2.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.2.0/include/stdint.h" 3 4
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 190 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 12 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/15.2.0/include/stdint.h" 2 3 4
#pragma GCC diagnostic pop
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 5 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 6 "main.c" 2
# 1 "game.h" 1
# 16 "game.h"
typedef enum {LEFT, RIGHT, DOWN, UP} DIRECTION;
typedef enum {IDLE, WALK, DODGE, ATTACK, HIT} ANIMATION_STATE;
typedef enum {PATROL, CHASE, RETURN} ENEMY_STATE;

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
# 73 "game.h"
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
extern Enemy enemies[4];
extern Bullet bullets[16];
extern int lives;
extern int winFlag;
# 7 "main.c" 2
# 1 "tileset.h" 1
# 21 "tileset.h"
extern const unsigned short tilesetTiles[16384];


extern const unsigned short tilesetPal[256];
# 8 "main.c" 2
# 1 "level1Map.h" 1







extern const unsigned short level1MapLayer0Map[4096];
extern const unsigned short level1MapLayer1Map[4096];
extern const unsigned short level1MapLayer2Map[4096];
extern const unsigned short level1MapLayer3Map[4096];
# 9 "main.c" 2
# 1 "mode4.h" 1
# 9 "mode4.h"
void flipPages();
void setPixel4(int x, int y, unsigned char colorIndex);
void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int x, int y, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 10 "main.c" 2
# 1 "startMenu.h" 1







extern const unsigned short startMenuLayer0Map[1024];
extern const unsigned short startMenuLayer1Map[1024];
extern const unsigned short startMenuLayer2Map[1024];
# 11 "main.c" 2
# 1 "pauseMenu.h" 1







extern const unsigned short pauseMenuLayer0Map[1024];
extern const unsigned short pauseMenuLayer1Map[1024];
extern const unsigned short pauseMenuLayer2Map[1024];
# 12 "main.c" 2
# 1 "winMenu.h" 1







extern const unsigned short winMenuLayer0Map[1024];
extern const unsigned short winMenuLayer1Map[1024];
extern const unsigned short winMenuLayer2Map[1024];
# 13 "main.c" 2
# 1 "loseMenu.h" 1







extern const unsigned short loseMenuLayer0Map[1024];
extern const unsigned short loseMenuLayer1Map[1024];
extern const unsigned short loseMenuLayer2Map[1024];
# 14 "main.c" 2
# 1 "utils.h" 1






int clipSpritesOffScreen(u8 oamIndex, int screenX, int screenY, int width, int height);
void clearBackground(int screenblock, u16 tileEntry);
u8 colorAt(int x, int y);
u8 mapCollide(int x, int y, u32 colorMask);
u8 hitboxCollide(int x1, int y1, int hbW1, int hbH1, int x2, int y2, int hbW2, int hbH2);
void resetOff();
# 15 "main.c" 2

void initialize();
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

u16 buttons;
u16 oldButtons;

enum State {
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE
};

int state;

int main() {
    initialize();
    mgba_printf("Starting game...");

    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        switch (state) {
            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }

    }

    return 0;
}

void initialize() {
    mgba_open();
    DMANow(3, tilesetPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, spritesheetPal, ((u16 *)0x5000200), 256);
    goToStart();
}

void goToStart() {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (1 % 4))) | (1 << (8 + (2 % 4))) | (1 << (8 + (3 % 4)));
    hideSprites();
    (*(volatile unsigned short*) 0x400000A) = (0 << 14) | ((0) << 2) | ((20) << 8) | (0 << 7) | 1;
    (*(volatile unsigned short*) 0x400000C) = (0 << 14) | ((0) << 2) | ((24) << 8) | (0 << 7) | 3;
    (*(volatile unsigned short*) 0x400000E) = (0 << 14) | ((0) << 2) | ((28) << 8) | (0 << 7) | 3;

    DMANow(3, tilesetTiles, ((CB*) 0x6000000), sizeof(tilesetTiles) / 2);
    DMANow(3, spritesheetTiles, ((CB*) 0x6000000) + 4, sizeof(spritesheetTiles) / 2);

    DMANow(3, startMenuLayer2Map, &((SB*) 0x6000000)[20], (2048) / 2);
    DMANow(3, startMenuLayer1Map, &((SB*) 0x6000000)[24], (2048) / 2);
    DMANow(3, startMenuLayer0Map, &((SB*) 0x6000000)[28], (2048) / 2);

    resetOff();
    state = START;
}

void start() {
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToInstructions();
    }
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        winFlag = 0;
        lives = 3;
        goToGame();
    }
}

void goToInstructions() {
    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4)));
    fillScreen4(4);
    state = INSTRUCTIONS;
}

void instructions() {
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToStart();
    }

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToGame();
    }
}

void goToGame() {
    mgba_printf("Entering game...");

    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4))) | (1 << (8 + (2 % 4))) | (1 << (8 + (3 % 4))) | (1 << 12);
    hideSprites();
    (*(volatile unsigned short*) 0x4000008) = (0 << 14) | ((0) << 2) | ((19) << 8) | (0 << 7) | 0;
    (*(volatile unsigned short*) 0x400000A) = (3 << 14) | ((0) << 2) | ((20) << 8) | (0 << 7) | 1;
    (*(volatile unsigned short*) 0x400000C) = (3 << 14) | ((0) << 2) | ((24) << 8) | (0 << 7) | 3;
    (*(volatile unsigned short*) 0x400000E) = (3 << 14) | ((0) << 2) | ((28) << 8) | (0 << 7) | 3;

    DMANow(3, tilesetTiles, ((CB*) 0x6000000), sizeof(tilesetTiles) / 2);
    DMANow(3, spritesheetTiles, ((CB*) 0x6000000) + 4, sizeof(spritesheetTiles) / 2);

    DMANow(3, level1MapLayer2Map, &((SB*) 0x6000000)[20], (8192) / 2);
    DMANow(3, level1MapLayer1Map, &((SB*) 0x6000000)[24], (8192) / 2);
    DMANow(3, level1MapLayer0Map, &((SB*) 0x6000000)[28], (8192) / 2);

    state = GAME;
    initGame();
}

void game() {
    updateGame();

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToPause();
        return;
    }

    if (winFlag) {
        goToWin();
        return;
    }

    if (lives <= 0) {
        goToLose();
        return;
    }

    drawGame();
}

void goToPause() {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (1 % 4))) | (1 << (8 + (2 % 4))) | (1 << (8 + (3 % 4)));
    hideSprites();
    (*(volatile unsigned short*) 0x400000A) = (0 << 14) | ((0) << 2) | ((20) << 8) | (0 << 7) | 1;
    (*(volatile unsigned short*) 0x400000C) = (0 << 14) | ((0) << 2) | ((24) << 8) | (0 << 7) | 3;
    (*(volatile unsigned short*) 0x400000E) = (0 << 14) | ((0) << 2) | ((28) << 8) | (0 << 7) | 3;

    DMANow(3, tilesetTiles, ((CB*) 0x6000000), sizeof(tilesetTiles) / 2);
    DMANow(3, spritesheetTiles, ((CB*) 0x6000000) + 4, sizeof(spritesheetTiles) / 2);

    DMANow(3, pauseMenuLayer2Map, &((SB*) 0x6000000)[20], (2048) / 2);
    DMANow(3, pauseMenuLayer1Map, &((SB*) 0x6000000)[24], (2048) / 2);
    DMANow(3, pauseMenuLayer0Map, &((SB*) 0x6000000)[28], (2048) / 2);

    resetOff();
    state = PAUSE;
}

void pause() {
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToStart();
    }
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToGame();
    }
}

void goToWin() {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (1 % 4))) | (1 << (8 + (2 % 4))) | (1 << (8 + (3 % 4)));
    hideSprites();
    (*(volatile unsigned short*) 0x400000A) = (0 << 14) | ((0) << 2) | ((20) << 8) | (0 << 7) | 1;
    (*(volatile unsigned short*) 0x400000C) = (0 << 14) | ((0) << 2) | ((24) << 8) | (0 << 7) | 3;
    (*(volatile unsigned short*) 0x400000E) = (0 << 14) | ((0) << 2) | ((28) << 8) | (0 << 7) | 3;

    DMANow(3, tilesetTiles, ((CB*) 0x6000000), sizeof(tilesetTiles) / 2);
    DMANow(3, spritesheetTiles, ((CB*) 0x6000000) + 4, sizeof(spritesheetTiles) / 2);

    DMANow(3, winMenuLayer2Map, &((SB*) 0x6000000)[20], (2048) / 2);
    DMANow(3, winMenuLayer1Map, &((SB*) 0x6000000)[24], (2048) / 2);
    DMANow(3, winMenuLayer0Map, &((SB*) 0x6000000)[28], (2048) / 2);

    resetOff();
    state = WIN;
}

void win() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}

void goToLose() {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (1 % 4))) | (1 << (8 + (2 % 4))) | (1 << (8 + (3 % 4)));
    hideSprites();
    (*(volatile unsigned short*) 0x400000A) = (0 << 14) | ((0) << 2) | ((20) << 8) | (0 << 7) | 1;
    (*(volatile unsigned short*) 0x400000C) = (0 << 14) | ((0) << 2) | ((24) << 8) | (0 << 7) | 3;
    (*(volatile unsigned short*) 0x400000E) = (0 << 14) | ((0) << 2) | ((28) << 8) | (0 << 7) | 3;

    DMANow(3, tilesetTiles, ((CB*) 0x6000000), sizeof(tilesetTiles) / 2);
    DMANow(3, spritesheetTiles, ((CB*) 0x6000000) + 4, sizeof(spritesheetTiles) / 2);

    DMANow(3, loseMenuLayer2Map, &((SB*) 0x6000000)[20], (2048) / 2);
    DMANow(3, loseMenuLayer1Map, &((SB*) 0x6000000)[24], (2048) / 2);
    DMANow(3, loseMenuLayer0Map, &((SB*) 0x6000000)[28], (2048) / 2);

    resetOff();
    state = LOSE;
}

void lose() {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}
