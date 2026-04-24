#include "utils.h"
#include "level1Map.h"
#include "level1CM.h"
#include "sprites.h"

const unsigned short* currentCollisionMap = level1CMBitmap;
static int collisionMapWidth = 256;
static int collisionMapHeight = 256;

void setScreenblockPalette(int screenblock, int palRow) {
    for (int i = 0; i < 1024; i++) {
        SCREENBLOCK[screenblock].tilemap[i] = (SCREENBLOCK[screenblock].tilemap[i] & ~TILEMAP_ENTRY_PALROW(0)) | TILEMAP_ENTRY_PALROW(palRow);
    }
}

void clearBackground(int screenblock, u16 tileEntry) {
    for (int i = 0; i < 32 * 32; i++) {
        SCREENBLOCK[screenblock].tilemap[i] = tileEntry;
    }
}

int clipSpritesOffScreen(u8 oamIndex, int screenX, int screenY, int width, int height) {
    return (screenX <= -width || screenX >= SCREENWIDTH || screenY <= -height || screenY >= SCREENHEIGHT);
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
    return byteMap[OFFSET(x, y, LEVEL1MAP_WIDTH)];
}

u8 mapCollide(int x, int y, u32 colorMask) {
    if (x < 0 || x >= LEVEL1MAP_WIDTH || y < 0 || y >= LEVEL1MAP_HEIGHT) {
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
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;
    REG_BG2HOFF = 0;
    REG_BG2VOFF = 0;
    REG_BG3HOFF = 0;
    REG_BG3VOFF = 0;
}