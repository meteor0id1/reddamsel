# 0 "utils.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "utils.c"
# 1 "utils.h" 1
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
# 2 "utils.h" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "utils.h" 2




void setScreenblockPalette(int screenblock, int palRow);
int clipSpritesOffScreen(u8 oamIndex, int screenX, int screenY, int width, int height);
void clearBackground(int screenblock, u16 tileEntry);
u8 colorAt(int x, int y);
u8 mapCollide(int x, int y, u32 colorMask);
u8 hitboxCollide(int x1, int y1, int hbW1, int hbH1, int x2, int y2, int hbW2, int hbH2);
void resetOff();
# 2 "utils.c" 2
# 1 "level1Map.h" 1







extern const unsigned short level1MapLayer0Map[4096];
extern const unsigned short level1MapLayer1Map[4096];
extern const unsigned short level1MapLayer2Map[4096];
extern const unsigned short level1MapLayer3Map[4096];
# 3 "utils.c" 2
# 1 "level1CM.h" 1
# 21 "level1CM.h"
extern const unsigned short level1CMBitmap[131072];


extern const unsigned short level1CMPal[256];
# 4 "utils.c" 2
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
# 5 "utils.c" 2

const unsigned short* currentCollisionMap = level1CMBitmap;
static int collisionMapWidth = 256;
static int collisionMapHeight = 256;

void setScreenblockPalette(int screenblock, int palRow) {
    for (int i = 0; i < 1024; i++) {
        ((SB*) 0x6000000)[screenblock].tilemap[i] = (((SB*) 0x6000000)[screenblock].tilemap[i] & ~((0 & 15) << 12)) | ((palRow & 15) << 12);
    }
}

void clearBackground(int screenblock, u16 tileEntry) {
    for (int i = 0; i < 32 * 32; i++) {
        ((SB*) 0x6000000)[screenblock].tilemap[i] = tileEntry;
    }
}

int clipSpritesOffScreen(u8 oamIndex, int screenX, int screenY, int width, int height) {
    return (screenX <= -width || screenX >= 240 || screenY <= -height || screenY >= 160);
}

void setCollisionMap(const unsigned short* bitmap, int width, int height) {
    if (width <= 0 || height <= 0) {
        return;
    }

    currentCollisionMap = bitmap;
    collisionMapWidth = width;
    collisionMapHeight = height;
}

u8 colorAt(int x, int y) {
    if (!level1CMBitmap) {
        return 0;
    }

    const u8* byteMap = (const u8*)level1CMBitmap;
    return byteMap[((y) * ((512)) + (x))];
}

u8 mapCollide(int x, int y, u32 colorMask) {
    if (x < 0 || x >= (512) || y < 0 || y >= (512)) {
        return 1;
    }

    u8 color = colorAt(x, y);
    if (color >= 32) {
        return 0;
    }

    return (colorMask & (1u << color)) != 0;
}

u8 hitboxCollide(int x1, int y1, int w1, int h1, int x2, int y2, int w2, int h2) {
    return (x1 < x2 + w2) && (x1 + w1 > x2) &&
           (y1 < y2 + h2) && (y1 + h1 > y2);
}

void resetOff() {
    (*(volatile unsigned short*) 0x04000010) = 0;
    (*(volatile unsigned short*) 0x04000012) = 0;
    (*(volatile unsigned short*) 0x04000014) = 0;
    (*(volatile unsigned short*) 0x04000016) = 0;
    (*(volatile unsigned short*) 0x04000018) = 0;
    (*(volatile unsigned short*) 0x0400001A) = 0;
    (*(volatile unsigned short*) 0x0400001C) = 0;
    (*(volatile unsigned short*) 0x0400001E) = 0;
}
