#include "utils.h"
#include "level1Map.h"
#include "level1CM.h"
#include "sprites.h"

static u8 collisionMapRuntime[LEVEL1MAP_WIDTH * LEVEL1MAP_HEIGHT];

const unsigned short* currentCollisionMap = (const unsigned short*)collisionMapRuntime;
static int collisionMapWidth = LEVEL1MAP_WIDTH;
static int collisionMapHeight = LEVEL1MAP_HEIGHT;

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

void setMapTile(int baseScreenblock, int tileX, int tileY, u16 tileId) {
    if (tileX < 0 || tileX >= (LEVEL1MAP_WIDTH / 8) || tileY < 0 || tileY >= (LEVEL1MAP_HEIGHT / 8)) {
        return;
    }
    int screenblock = baseScreenblock + (tileY / 32) * 2 + (tileX / 32);
    int localX = tileX % 32;
    int localY = tileY % 32;

    u16 *entry = &SCREENBLOCK[screenblock].tilemap[OFFSET(localX, localY, 32)];
    *entry = (*entry & ~0x03FF) | TILEMAP_ENTRY_TILEID(tileId);
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