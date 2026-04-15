#include "stdlib.h"
#include "gba.h"
#include "game.h"
#include "print.h"
#include "mode0.h"
#include "sprites.h"
#include "level1Map.h"
#include "utils.h"
#include "level1CM.h"

Player player;
Sword sword;
Enemy enemies[MAX_ENEMIES];
Bullet bullets[MAX_BULLETS];
int lives;
int winFlag;
int hOff, vOff;

void initGame() {
    initPlayer();
    initSword();
    initEnemies();
    initBullets();
}

void initPlayer() {
    player.x = TO_FIXED(80);
    player.y = TO_FIXED(460);
    player.vX = 0;
    player.vY = 0;
    player.hitboxOffX = 4;
    player.hitboxOffY = 7;
    player.hitboxW = 8;
    player.hitboxH = 8;
    player.timeUntilNextFrame = 5;
    player.direction = LEFT;
    player.currentFrame = 0;
    player.frames = playerIdleFrames;
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
        enemies[i].x = TO_FIXED(enemyPatrolPoints[i][0][0]);
        enemies[i].y = TO_FIXED(enemyPatrolPoints[i][0][1]);
        enemies[i].vX = 0;
        enemies[i].vY = 0;
        enemies[i].hitboxOffX = 4;
        enemies[i].hitboxOffY = 4;
        enemies[i].hitboxW = 8;
        enemies[i].hitboxH = 8;
        enemies[i].timeUntilNextFrame = 10;
        enemies[i].state = PATROL;
        enemies[i].direction = LEFT;
        enemies[i].currentFrame = 0;
        enemies[i].frames = enemyIdleFrames;
        enemies[i].numFrames = 1;
        enemies[i].animState = IDLE;
        enemies[i].patrolTargetIndex = 1;
        enemies[i].firedShot = 0;
        enemies[i].oamIndex = i + 2;
        enemies[i].active = 1;
    }
}

void initBullets() {
    for (int i = 0; i < MAX_BULLETS; i++) {
        bullets[i].active = 0;
        bullets[i].x = 0;
        bullets[i].y = 0;
        bullets[i].vX = 0;
        bullets[i].vY = 0;
        bullets[i].hitboxOffX = 2;
        bullets[i].hitboxOffY = 0;
        bullets[i].hitboxW = 4;
        bullets[i].hitboxH = 4;
        bullets[i].direction = LEFT;
        bullets[i].oamIndex = MAX_ENEMIES + 2 + i;
    }
}

void updateGame() {
    updatePlayer();
    updateEnemies();
    updateBullets();
    updateCamera();
    checkEntityCollisions();
}

void updateCamera() {
    int targetX = FROM_FIXED(player.x) - (SCREENWIDTH / 2);
    int targetY = FROM_FIXED(player.y) - (SCREENHEIGHT / 2);
    
    int maxOffX = LEVEL1MAP_WIDTH - SCREENWIDTH;
    int maxOffY = LEVEL1MAP_HEIGHT - SCREENHEIGHT;
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
        player.timeUntilNextFrame = (player.state == ATTACK) ? FRAME_DURATION : FRAME_DURATION + 1;
        player.currentFrame++;

        if (player.currentFrame >= player.numFrames) {
            if (player.state == ATTACK || player.state == DODGE) {
                player.state = IDLE;
                player.frames = playerIdleFrames;
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
        player.frames = playerDodgeFrames;
        player.numFrames = 5;
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

    int playerLeft = FROM_FIXED(player.x + player.vX) + player.hitboxOffX;
    int playerTop = FROM_FIXED(player.y) + player.hitboxOffY;
    int playerRight = playerLeft + player.hitboxW - 1;
    int playerBottom = playerTop + player.hitboxH - 1;

    if (mapCollide(playerLeft, playerTop, PLAYER_COLLISION_MASK) ||
        mapCollide(playerRight, playerTop, PLAYER_COLLISION_MASK) ||
        mapCollide(playerLeft, playerBottom, PLAYER_COLLISION_MASK) ||
        mapCollide(playerRight, playerBottom, PLAYER_COLLISION_MASK)) {
        player.vX = 0;
    }

    playerLeft = FROM_FIXED(player.x) + player.hitboxOffX;
    playerTop = FROM_FIXED(player.y + player.vY) + player.hitboxOffY;
    playerRight = playerLeft + player.hitboxW - 1;
    playerBottom = playerTop + player.hitboxH - 1;

    if (mapCollide(playerLeft, playerTop, PLAYER_COLLISION_MASK) ||
        mapCollide(playerRight, playerTop, PLAYER_COLLISION_MASK) ||
        mapCollide(playerLeft, playerBottom, PLAYER_COLLISION_MASK) ||
        mapCollide(playerRight, playerBottom, PLAYER_COLLISION_MASK)) {
        player.vY = 0;
    }

    playerLeft = FROM_FIXED(player.x) + player.hitboxOffX;
    playerTop = FROM_FIXED(player.y) + player.hitboxOffY;
    playerRight = playerLeft + player.hitboxW - 1;
    playerBottom = playerTop + player.hitboxH - 1;

    if (colorAt(playerLeft, playerTop) == 2 || colorAt(playerRight, playerTop) == 2 ||
        colorAt(playerLeft, playerBottom) == 2 || colorAt(playerRight, playerBottom) == 2) {
        winFlag = 1;
        return;
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
        player.frames = playerIdleFrames;
        player.numFrames = 1;
        player.currentFrame = 0;
    } else {
        player.state = WALK;
        player.frames = playerWalkFrames;
        player.numFrames = 5;
    }
}

void attack() {
    if (player.state == ATTACK || player.state == DODGE) return;
    player.state = ATTACK;
    player.frames = playerAttackFrames;
    player.numFrames = 4;
    player.currentFrame = 0;
    player.timeUntilNextFrame = FRAME_DURATION;

    sword.active = 1;
    player.direction = player.direction;
    sword.frames = swordFrames;
    sword.numFrames = 5;
    sword.timeUntilNextFrame = FRAME_DURATION;
}

void updateEnemies() {
    for (int i = 0; i < MAX_ENEMIES; i++) {
        if (!enemies[i].active) continue;
        updateEnemy(&enemies[i]);
    }
}

void updateEnemy(Enemy* enemy) {
    int enemyIndex = enemy - enemies;
    enemy->vX = 0;
    enemy->vY = 0;

    if (enemy->animState == ATTACK) {
        enemy->frames = enemyAttackFrames;
        enemy->numFrames = 7;
        if (!enemy->firedShot && enemy->currentFrame >= ENEMY_ATTACK_FRAME) {
            spawnBullet(enemy->x, enemy->y, enemy->direction);
            enemy->firedShot = 1;
        }
    } else {
        int targetX = enemyPatrolPoints[enemyIndex][enemy->patrolTargetIndex][0];
        int targetY = enemyPatrolPoints[enemyIndex][enemy->patrolTargetIndex][1];
        int enemyX = FROM_FIXED(enemy->x);
        int enemyY = FROM_FIXED(enemy->y);
        int dX = targetX - enemyX;
        int dY = targetY - enemyY;

        if (abs(dX) <= 2 && abs(dY) <= 2) {
            enemy->animState = ATTACK;
            enemy->frames = enemyAttackFrames;
            enemy->numFrames = 7;
            enemy->currentFrame = 0;
            enemy->timeUntilNextFrame = 5;
            enemy->firedShot = 0;
            enemy->patrolTargetIndex = (enemy->patrolTargetIndex + 1) % (sizeof(enemyPatrolPoints[enemyIndex]) / sizeof(enemyPatrolPoints[enemyIndex][0]));
            dX = 0;
            dY = 0;
        } else {
            if (abs(dX)) {
                enemy->vX = (dX < 0) ? -ENEMY_SPEED : ENEMY_SPEED;
                enemy->direction = (dX < 0) ? LEFT : RIGHT;
            } else {
                enemy->vY = (dY < 0) ? -ENEMY_SPEED : ENEMY_SPEED;
                enemy->direction = (dY < 0) ? UP : DOWN;
            }
            enemy->animState = WALK;
            enemy->frames = enemyWalkFrames;
            enemy->numFrames = 5;
        }
    }

    enemy->timeUntilNextFrame--;
    if (enemy->timeUntilNextFrame <= 0) {
        enemy->timeUntilNextFrame = FRAME_DURATION;
        enemy->currentFrame++;

        if (enemy->currentFrame >= enemy->numFrames) {
            if (enemy->animState == ATTACK) {
                enemy->animState = IDLE;
                enemy->frames = enemyIdleFrames;
                enemy->numFrames = 1;
                enemy->firedShot = 0;
            }
            enemy->currentFrame = 0;
        }
    }

    enemy->x += enemy->vX;
    enemy->y += enemy->vY;
}

void spawnBullet(int x, int y, DIRECTION direction) {
    for (int i = 0; i < MAX_BULLETS; i++) {
        if (!bullets[i].active) {
            bullets[i].active = 1;
            bullets[i].x = x + TO_FIXED(6);
            bullets[i].y = y + TO_FIXED(6);
            bullets[i].vX = 0;
            bullets[i].vY = 0;
            bullets[i].direction = direction;
            bullets[i].lifetime = BULLET_MAX_LIFETIME;

            if (direction == LEFT) {
                bullets[i].vX = -BULLET_SPEED;
            } else if (direction == RIGHT) {
                bullets[i].vX = BULLET_SPEED;
            } else if (direction == UP) {
                bullets[i].vY = -BULLET_SPEED;
            } else {
                bullets[i].vY = BULLET_SPEED;
            }
            return;
        }
    }
}

void updateBullets() {
    for (int i = 0; i < MAX_BULLETS; i++) {
        if (!bullets[i].active) continue;

        bullets[i].x += bullets[i].vX;
        bullets[i].y += bullets[i].vY;
        bullets[i].lifetime--;

        int bulletLeft = FROM_FIXED(bullets[i].x) + bullets[i].hitboxOffX;
        int bulletTop = FROM_FIXED(bullets[i].y) + bullets[i].hitboxOffY;
        int bulletRight = bulletLeft + bullets[i].hitboxW - 1;
        int bulletBottom = bulletTop + bullets[i].hitboxH - 1;

        if (bullets[i].lifetime <= 0 || bulletLeft < 0 || bulletRight >= LEVEL1MAP_WIDTH || bulletTop < 0 || bulletBottom >= LEVEL1MAP_HEIGHT) {
            bullets[i].active = 0;
            continue;
        }

        if (mapCollide(bulletLeft, bulletTop, BULLET_COLLISION_MASK) ||
            mapCollide(bulletRight, bulletTop, BULLET_COLLISION_MASK) ||
            mapCollide(bulletLeft, bulletBottom, BULLET_COLLISION_MASK) ||
            mapCollide(bulletRight, bulletBottom, BULLET_COLLISION_MASK)) {
            bullets[i].active = 0;
        }
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

    if (player.state != DODGE && player.state != HIT) {
        for (int i = 0; i < MAX_BULLETS; i++) {
            if (!bullets[i].active) continue;
            int bulletX = FROM_FIXED(bullets[i].x);
            int bulletY = FROM_FIXED(bullets[i].y);
            if (hitboxCollide(pLeft, pTop, player.hitboxW, player.hitboxH, bulletX + bullets[i].hitboxOffX, bulletY + bullets[i].hitboxOffY, bullets[i].hitboxW, bullets[i].hitboxH)) {
                bullets[i].active = 0;
                lives--;
                mgba_printf("Player hit by bullet!");
            }
        }
    }

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
        if (player.state == DODGE || player.state == HIT) continue;
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
    drawHUD();
    drawPlayer();
    drawEnemies();
    drawBullets();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
}

void drawPlayer() {        
    shadowOAM[player.oamIndex].attr0 = ROWMASK(FROM_FIXED(player.y) - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[player.oamIndex].attr1 = COLMASK(FROM_FIXED(player.x) - hOff) | ATTR1_SMALL | (player.direction == RIGHT ? ATTR1_HFLIP : 0);
    if (player.direction == LEFT) {
        shadowOAM[player.oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.frames[player.currentFrame], player.direction * 4) | ATTR2_PRIORITY(2);
    } else {
        shadowOAM[player.oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.frames[player.currentFrame], (player.direction - 1) * 4) | ATTR2_PRIORITY(2);
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
            frameTile = ATTR2_TILEID(sword.frames[player.currentFrame], LEFT * 2);
            break;
        case RIGHT:
            swordX = FROM_FIXED(player.x) - swordOffsetSide[player.currentFrame][0];
            swordY = FROM_FIXED(player.y) + swordOffsetSide[player.currentFrame][1];
            frameTile = ATTR2_TILEID(sword.frames[player.currentFrame], LEFT * 2);
            break;
        case DOWN:
            swordX = FROM_FIXED(player.x) + swordOffsetDown[player.currentFrame][0];
            swordY = FROM_FIXED(player.y) + swordOffsetDown[player.currentFrame][1];
            frameTile = ATTR2_TILEID(sword.frames[player.currentFrame], DOWN * 2);
            break;
        case UP:
            swordX = FROM_FIXED(player.x) + swordOffsetUp[player.currentFrame][0];
            swordY = FROM_FIXED(player.y) + swordOffsetUp[player.currentFrame][1];
            frameTile = ATTR2_TILEID(sword.frames[player.currentFrame], UP * 2 + 2);
            break;
    }

    shadowOAM[sword.oamIndex].attr0 = ROWMASK(swordY - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[sword.oamIndex].attr1 = COLMASK(swordX - hOff) | ATTR1_SMALL | (player.direction == RIGHT ? ATTR1_HFLIP : 0);
    shadowOAM[sword.oamIndex].attr2 = ATTR2_PALROW(0) | frameTile | ATTR2_PRIORITY(2);
}

void drawEnemies() {
    for (int i = 0; i < MAX_ENEMIES; i++) {
        Enemy* enemy = &enemies[i];
        if (!enemy->active || clipSpritesOffScreen(enemy->oamIndex, FROM_FIXED(enemy->x) - hOff, FROM_FIXED(enemy->y) - vOff, 16, 16)) {
            shadowOAM[enemy->oamIndex].attr0 = ATTR0_HIDE;
            continue;
        }
        shadowOAM[enemy->oamIndex].attr0 = ROWMASK(FROM_FIXED(enemy->y) - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[enemy->oamIndex].attr1 = COLMASK(FROM_FIXED(enemy->x) - hOff) | ATTR1_SMALL | (enemy->direction == RIGHT ? ATTR1_HFLIP : 0);
        if (enemy->direction == LEFT) {
            shadowOAM[enemy->oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy->frames[enemy->currentFrame], ENEMY_ROW_OFFSET) | ATTR2_PRIORITY(2);
        } else {
            shadowOAM[enemy->oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy->frames[enemy->currentFrame], ENEMY_ROW_OFFSET + (enemy->direction - 1) * 2) | ATTR2_PRIORITY(2);
        }
    }
}

void drawBullets() {
    for (int i = 0; i < MAX_BULLETS; i++) {
        Bullet* bullet = &bullets[i];
        if (!bullet->active || clipSpritesOffScreen(bullet->oamIndex, FROM_FIXED(bullet->x) - hOff, FROM_FIXED(bullet->y) - vOff, 8, 8)) {
            shadowOAM[bullet->oamIndex].attr0 = ATTR0_HIDE;
            continue;
        }

        shadowOAM[bullet->oamIndex].attr0 = ROWMASK(FROM_FIXED(bullet->y) - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[bullet->oamIndex].attr1 = COLMASK(FROM_FIXED(bullet->x) - hOff) | ATTR1_TINY | (bullet->direction == RIGHT ? ATTR1_HFLIP : 0);
        if (bullet->direction == LEFT) {
            shadowOAM[bullet->oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, ENEMY_ROW_OFFSET + (2 * bullet->direction)) | ATTR2_PRIORITY(2);
        } else {
            shadowOAM[bullet->oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, ENEMY_ROW_OFFSET + (2 * (bullet->direction - 1))) | ATTR2_PRIORITY(2);
        }
    }
}

void drawHUD() {
    for (int i = 0; i < MAX_LIVES; i++) {
        int tile = (i < lives) ? HUD_LIFE_TILE : HUD_LIFE_TILE + 1;
        SCREENBLOCK[HUD_SCREENBLOCK].tilemap[1 * 32 + i + 1] =
            TILEMAP_ENTRY_TILEID(tile) | TILEMAP_ENTRY_PALROW(HUD_PALROW);
    }
}