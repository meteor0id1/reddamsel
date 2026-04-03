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
Sword sword;
Enemy enemies[MAX_ENEMIES];
int lives = 1;

int hOff, vOff;

void initGame() {
    initPlayer();
    initSword();
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
    player.timeUntilNextFrame = 5;
    player.direction = LEFT;
    player.currentFrame = 0;
    player.frames = idleFrames;
    player.numFrames = 1;
    player.state = IDLE;
    player.oamIndex = 1;
}

void initSword() {
    sword.active = 0;
    sword.offX = 0;
    sword.offY = 0;
    sword.hitboxOffX = 0;
    sword.hitboxOffY = 0;
    sword.hitboxW = 0;
    sword.hitboxH = 0;
    sword.timeUntilNextFrame = 5;
    sword.frames = swordFrames;
    sword.numFrames = 5;
    sword.oamIndex = 0;
}

void initEnemies() {
    for (int i = 0; i < MAX_ENEMIES; i++) {
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
        enemies[i].oamIndex = i + 2;
        enemies[i].active = 1;
    }
}

void updateGame() {
    updatePlayer();
    updateEnemies();
    updateCamera();
    checkEntityCollisions();
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
    player.timeUntilNextFrame--;
    if (player.timeUntilNextFrame <= 0) {
        player.timeUntilNextFrame = (player.state == ATTACK) ? 5 : 6;
        player.currentFrame++;

        if (player.currentFrame >= player.numFrames) {
            if (player.state == ATTACK || player.state == DODGE) {
                player.state = IDLE;
                player.frames = idleFrames;
                player.numFrames = 1;
                sword.active = 0;
            }
            player.currentFrame = 0;
        }
    }

    if (player.state == ATTACK) return;

    player.vX = 0;
    player.vY = 0;

    if (BUTTON_HELD(BUTTON_UP))    { player.vY -= PLAYER_SPEED; player.direction = UP; }
    if (BUTTON_HELD(BUTTON_DOWN))  { player.vY += PLAYER_SPEED; player.direction = DOWN; }
    if (BUTTON_HELD(BUTTON_LEFT))  { player.vX -= PLAYER_SPEED; player.direction = LEFT; }
    if (BUTTON_HELD(BUTTON_RIGHT)) { player.vX += PLAYER_SPEED; player.direction = RIGHT; }

    if (BUTTON_PRESSED(BUTTON_LSHOULDER) && player.state != DODGE) {
        player.state = DODGE;
        player.frames = dodgeFrames;
        player.numFrames = 6;
        player.currentFrame = 0;
        player.timeUntilNextFrame = 6;
    }

    if (BUTTON_PRESSED(BUTTON_A) && player.state != DODGE) {
        attack();
        return;
    }

    if (player.state == DODGE) {
        player.vX = (player.vX * 3) / 2;
        player.vY = (player.vY * 3) / 2;
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
        player.numFrames = 5;
    }
}

void attack() {
    if (player.state == ATTACK || player.state == DODGE) return;
    player.state = ATTACK;
    player.frames = attackFrames;
    player.numFrames = 5;
    player.currentFrame = 0;
    player.timeUntilNextFrame = 5;

    sword.active = 1;
    player.direction = player.direction;
    sword.frames = swordFrames;
    sword.numFrames = 5;
    sword.timeUntilNextFrame = 5;
}

void updateEnemies() {
    for (int i = 0; i < MAX_ENEMIES; i++) {
        if (!enemies[i].active) continue;
        updateEnemy(&enemies[i]);
    }
}

void updateEnemy(Enemy* enemy) {
    enemy->timeUntilNextFrame--;
    if (enemy->timeUntilNextFrame <= 0) {
        enemy->timeUntilNextFrame = 5;
        enemy->currentFrame++;

        if (enemy->currentFrame >= enemy->numFrames) {
            enemy->currentFrame = 0;
        }
    }

    enemy->vX = 0;
    enemy->vY = 0;

    int playerX = FROM_FIXED(player.x);
    int playerY = FROM_FIXED(player.y);
    int enemyX = FROM_FIXED(enemy->x);
    int enemyY = FROM_FIXED(enemy->y);
    if (playerX < enemyX - 4) {
        enemy->vX = -ENEMY_SPEED;
        enemy->direction = LEFT;
    } else if (playerX > enemyX + 4) {
        enemy->vX = ENEMY_SPEED;
        enemy->direction = RIGHT;
    }
    if (playerY < enemyY - 4) {
        enemy->vY = -ENEMY_SPEED;
        enemy->direction = UP;
    } else if (playerY > enemyY + 4) {
        enemy->vY = ENEMY_SPEED;
        enemy->direction = DOWN;
    }

    // Take magnitute of velocity for diagonal movement
    if (enemy->vX != 0 && enemy->vY != 0) {
        enemy->x += enemy->vX / 1.4;
        enemy->y += enemy->vY / 1.4;
    } else {
        enemy->x += enemy->vX;
        enemy->y += enemy->vY;
    }
}

void checkEntityCollisions() {
    int playerX = FROM_FIXED(player.x);
    int playerY = FROM_FIXED(player.y);

    int swordHitboxX, swordHitboxY, swordHitboxW, swordHitboxH;
    switch (player.direction) {
        case LEFT:
            swordHitboxX = playerX - 4;
            swordHitboxY = playerY;
            swordHitboxW = 8;
            swordHitboxH = 16;
            break;
        case RIGHT:
            swordHitboxX = playerX + 12;
            swordHitboxY = playerY;
            swordHitboxW = 8;
            swordHitboxH = 16;
            break;
        case DOWN:
            swordHitboxX = playerX;
            swordHitboxY = playerY + 12;
            swordHitboxW = 16;
            swordHitboxH = 8;
            break;
        case UP:
            swordHitboxX = playerX;
            swordHitboxY = playerY - 4;
            swordHitboxW = 16;
            swordHitboxH = 8;
            break;
    }

    int pLeft   = playerX + player.hitboxOffX;
    int pTop    = playerY + player.hitboxOffY;
    int pRight  = pLeft + player.hitboxW;
    int pBottom = pTop + player.hitboxH;

    for (int i = 0; i < MAX_ENEMIES; i++) {
        if (!enemies[i].active) continue;
        int enemyX = FROM_FIXED(enemies[i].x);
        int enemyY = FROM_FIXED(enemies[i].y);
        // Check sword collision with enemy
        if (swordHitboxX < enemyX + enemies[i].hitboxOffX + enemies[i].hitboxW &&
            swordHitboxX + swordHitboxW > enemyX + enemies[i].hitboxOffX &&
            swordHitboxY < enemyY + enemies[i].hitboxOffY + enemies[i].hitboxH &&
            swordHitboxY + swordHitboxH > enemyY + enemies[i].hitboxOffY && sword.active) {
            mgba_printf("Enemy hit!");
            enemies[i].active = 0;
            return;
        }

        // Check player collision with enemy
        if (pLeft < enemyX + enemies[i].hitboxOffX + enemies[i].hitboxW &&
            pRight > enemyX + enemies[i].hitboxOffX &&
            pTop < enemyY + enemies[i].hitboxOffY + enemies[i].hitboxH &&
            pBottom > enemyY + enemies[i].hitboxOffY) {
            mgba_printf("Player hit!");
            lives--;
        }
    }
}

void drawGame() {
    drawPlayer();
    drawEnemies();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
}

void drawPlayer() {        
    shadowOAM[player.oamIndex].attr0 = FROM_FIXED(player.y) - vOff | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[player.oamIndex].attr1 = FROM_FIXED(player.x) - hOff | ATTR1_SMALL | (player.direction == RIGHT ? ATTR1_HFLIP : 0);
    if (player.direction == LEFT) {
        shadowOAM[player.oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.frames[player.currentFrame] * 2, player.direction * 4);
    } else {
        shadowOAM[player.oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.frames[player.currentFrame] * 2, (player.direction - 1) * 4);
    }

    if (!sword.active) {
        shadowOAM[sword.oamIndex].attr0 = ATTR0_HIDE;
        return;
    }
    // draw sword
    int swordX, swordY, frameTile;
    switch (player.direction) {
        case LEFT:
            swordX = FROM_FIXED(player.x) + swordOffsetSide[player.currentFrame][0];
            swordY = FROM_FIXED(player.y) + swordOffsetSide[player.currentFrame][1];
            frameTile = ATTR2_TILEID(sword.frames[player.currentFrame] * 2, LEFT * 2);
            break;
        case RIGHT:
            swordX = FROM_FIXED(player.x) - swordOffsetSide[player.currentFrame][0];
            swordY = FROM_FIXED(player.y) + swordOffsetSide[player.currentFrame][1];
            frameTile = ATTR2_TILEID(sword.frames[player.currentFrame] * 2, LEFT * 2);
            break;
        case DOWN:
            swordX = FROM_FIXED(player.x) + swordOffsetDown[player.currentFrame][0];
            swordY = FROM_FIXED(player.y) + swordOffsetDown[player.currentFrame][1];
            frameTile = ATTR2_TILEID(sword.frames[player.currentFrame] * 2, DOWN * 2);
            break;
        case UP:
            swordX = FROM_FIXED(player.x) + swordOffsetUp[player.currentFrame][0];
            swordY = FROM_FIXED(player.y) + swordOffsetUp[player.currentFrame][1];
            frameTile = ATTR2_TILEID(sword.frames[player.currentFrame] * 2, UP * 2 + 2);
            break;
    }

    shadowOAM[sword.oamIndex].attr0 = swordY - vOff | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[sword.oamIndex].attr1 = swordX - hOff | ATTR1_SMALL | (player.direction == RIGHT ? ATTR1_HFLIP : 0);
    shadowOAM[sword.oamIndex].attr2 = ATTR2_PALROW(0) | frameTile;
}

void drawEnemies() {
    for (int i = 0; i < MAX_ENEMIES; i++) {
        if (!enemies[i].active) {
            shadowOAM[enemies[i].oamIndex].attr0 = ATTR0_HIDE;
            continue;
        }
        shadowOAM[enemies[i].oamIndex].attr0 = FROM_FIXED(enemies[i].y) - vOff | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[enemies[i].oamIndex].attr1 = FROM_FIXED(enemies[i].x) - hOff | ATTR1_SMALL | (enemies[i].direction == RIGHT ? ATTR1_HFLIP : 0);
        if (enemies[i].direction == LEFT) {
            shadowOAM[enemies[i].oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemies[i].frames[enemies[i].currentFrame] * 2, LEFT * 4);
        } else {
            shadowOAM[enemies[i].oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemies[i].frames[enemies[i].currentFrame] * 2, (enemies[i].direction - 1) * 4);
        }
    }
}