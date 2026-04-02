#include "stdlib.h"
#include "gba.h"
#include "game.h"
#include "print.h"
#include "mode0.h"
#include "sprites.h"
#include "testmap.h"

u8 colorAt(int x, int y) {
    if (!testmapcmBitmap) {
        return 0;
    }

    const u8* byteMap = (const u8*)testmapcmBitmap;
    return byteMap[OFFSET(x, y, TESTMAP_WIDTH)];
}

u8 mapCollide(int x, int y) {
    if (x < 0 || x >= TESTMAP_WIDTH || y < 0 || y >= TESTMAP_HEIGHT) return 1;
    return colorAt(x, y) != 0;
}

Player player;
Enemy enemies[3];

int hOff, vOff;

void initGame() {
    initPlayer();
    initEnemies();
}

void initPlayer() {
    player.x = TO_FIXED(120);
    player.y = TO_FIXED(80);
    player.vX = 0;
    player.vY = 0;
    player.hitboxOffX = 4;
    player.hitboxOffY = 7;
    player.hitboxW = 8;
    player.hitboxH = 8;
    player.timeUntilNextFrame = 10;
    player.direction = LEFT;
    player.currentFrame = 0;
    player.frames = idleFrames;
    player.numFrames = 1;
    player.state = IDLE;
    player.oamIndex = 0;
}

void initEnemies() {
    for (int i = 0; i < 3; i++) {
        enemies[i].x = TO_FIXED(80 + i * 40);
        enemies[i].y = TO_FIXED(60);
        enemies[i].vX = 0;
        enemies[i].vY = 0;
        enemies[i].hitboxOffX = 4;
        enemies[i].hitboxOffY = 4;
        enemies[i].hitboxW = 8;
        enemies[i].hitboxH = 8;
        enemies[i].timeUntilNextFrame = 10;
        enemies[i].direction = LEFT;
        enemies[i].currentFrame = 0;
        enemies[i].frames = idleFrames;
        enemies[i].numFrames = 1;
        enemies[i].state = IDLE;
        enemies[i].oamIndex = i + 1;
    }
}

void updateGame() {
    updatePlayer();

    updateCamera();
}

void updateCamera() {
    int targetX = FROM_FIXED(player.x) - (SCREENWIDTH / 2);
    int targetY = FROM_FIXED(player.y) - (SCREENHEIGHT / 2);
    
    int maxOffX = TESTMAP_WIDTH - SCREENWIDTH;
    int maxOffY = TESTMAP_HEIGHT - SCREENHEIGHT;
    if (maxOffX < 0) {
        maxOffX = 0;
    }
    if (maxOffY < 0) {
        maxOffY = 0;
    }
    
    if (targetX < 0) {
        hOff = 0;
    } else if (targetX > maxOffX) {
        hOff = maxOffX;
    } else {
        hOff = targetX;
    }
    if (targetY < 0) {
        vOff = 0;
    } else if (targetY > maxOffY) {
        vOff = maxOffY;
    } else {
        vOff = targetY;
    }
    
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
    REG_BG2HOFF = hOff;
    REG_BG2VOFF = vOff;
    REG_BG3HOFF = hOff;
    REG_BG3VOFF = vOff;
}

void updatePlayer() {
    player.vX = 0;
    player.vY = 0;
    if (BUTTON_HELD(BUTTON_UP)) {
        player.vY -= PLAYER_SPEED;
        player.direction = UP;
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player.vY += PLAYER_SPEED;
        player.direction = DOWN;
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.vX -= PLAYER_SPEED;
        player.direction = LEFT;
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.vX += PLAYER_SPEED;
        player.direction = RIGHT;
    }

    if (BUTTON_PRESSED(BUTTON_LSHOULDER)) {
        if (player.state == DODGE) return;
        player.state = DODGE;
        player.frames = dodgeFrames;
        player.numFrames = 6;
        player.currentFrame = 0;
        player.timeUntilNextFrame = 6;
    }

    if (player.state == DODGE) {
        player.timeUntilNextFrame--;
        if (player.timeUntilNextFrame <= 0) {
            player.timeUntilNextFrame = 6;
            player.currentFrame++;
        }
        if (player.currentFrame >= player.numFrames) {
            player.state = IDLE;
            player.frames = idleFrames;
            player.numFrames = 1;
            player.currentFrame = 0;
        }
        player.vX *= 1.5;
        player.vY *= 1.5;
    }

    if (mapCollide(FROM_FIXED(player.x + player.vX) + player.hitboxOffX, FROM_FIXED(player.y) + player.hitboxOffY) ||
        mapCollide(FROM_FIXED(player.x + player.vX) + player.hitboxOffX + player.hitboxW - 1, FROM_FIXED(player.y) + player.hitboxOffY) ||
        mapCollide(FROM_FIXED(player.x + player.vX) + player.hitboxOffX, FROM_FIXED(player.y) + player.hitboxOffY + player.hitboxH - 1) ||
        mapCollide(FROM_FIXED(player.x + player.vX) + player.hitboxOffX + player.hitboxW - 1, FROM_FIXED(player.y) + player.hitboxOffY + player.hitboxH - 1)) {
        player.vX = 0;
    }
    if (mapCollide(FROM_FIXED(player.x) + player.hitboxOffX, FROM_FIXED(player.y + player.vY) + player.hitboxOffY) ||
        mapCollide(FROM_FIXED(player.x) + player.hitboxOffX + player.hitboxW - 1, FROM_FIXED(player.y + player.vY) + player.hitboxOffY) ||  
        mapCollide(FROM_FIXED(player.x) + player.hitboxOffX, FROM_FIXED(player.y + player.vY) + player.hitboxOffY + player.hitboxH - 1) ||
        mapCollide(FROM_FIXED(player.x) + player.hitboxOffX + player.hitboxW - 1, FROM_FIXED(player.y + player.vY) + player.hitboxOffY + player.hitboxH - 1)) {
        player.vY = 0;
    }
    // print position, velocity, state, and frame for debugging
    mgba_printf("Player position: (%d, %d), velocity: (%d, %d), state: %d, frame: %d\n", FROM_FIXED(player.x), FROM_FIXED(player.y), player.vX, player.vY, player.state, player.currentFrame);

    // Take magnitute of velocity for diagonal movement
    if (player.vX != 0 && player.vY != 0) {
        player.x += player.vX / 1.4;
        player.y += player.vY / 1.4;
    } else {
        player.x += player.vX;
        player.y += player.vY;
    }

    if (player.state == DODGE) return;

    if (player.vX == 0 && player.vY == 0) {
        player.state = IDLE;
        player.frames = idleFrames;
        player.numFrames = 1;
        player.currentFrame = 0;
    } else {
        player.state = WALK;
        player.frames = walkFrames;
        player.numFrames = 6;
    }

    player.timeUntilNextFrame--;
    if (player.timeUntilNextFrame <= 0) {
        player.timeUntilNextFrame = 6;
        player.currentFrame = (player.currentFrame + 1) % player.numFrames;
    }
}

void drawGame() {
    drawPlayer();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
}

void drawPlayer() {        
    shadowOAM[player.oamIndex].attr0 = FROM_FIXED(player.y) - vOff | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[player.oamIndex].attr1 = FROM_FIXED(player.x) - hOff | ATTR1_SMALL | (player.direction == RIGHT ? ATTR1_HFLIP : 0);
    if (player.direction == LEFT) {
        shadowOAM[player.oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.frames[player.currentFrame] * 2, player.direction * 2);
    } else {
        shadowOAM[player.oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.frames[player.currentFrame] * 2, (player.direction - 1) * 2);
    }
}