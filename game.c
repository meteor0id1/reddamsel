#include "stdlib.h"
#include "gba.h"
#include "game.h"
#include "print.h"
#include "mode0.h"
#include "sprites.h"
#include "level1Map.h"
#include "utils.h"
#include "level1CM.h"
#include "analogSound.h"

Player player;
Sword sword;
Slash slashes[MAX_SLASHES];
Enemy enemies[MAX_ENEMIES];
Bullet bullets[MAX_BULLETS];
Korok korok;
Bush bushes[MAX_BUSHES];
int lives;
int winFlag;
int cheatFlag;
int hOff, vOff;
int waterColor;
int bushCount;


void initGame() {
    initPlayer();
    initSword();
    initSlashes();
    initEnemies();
    initBullets();
    initKorok();
    initBushes();

    waterColor = 0;
}

void initPlayer() {
    player.x = TO_FIXED(80);
    player.y = TO_FIXED(460);
    player.vX = 0;
    player.vY = 0;
    player.hitboxOffX = 4;
    player.hitboxOffY = 9;
    player.hitboxW = 8;
    player.hitboxH = 7;
    player.timeUntilNextFrame = FRAME_DURATION;
    player.direction = DOWN;
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

void initSlashes() {
    for (int i = 0; i < MAX_SLASHES; i++) {
        slashes[i].active = 0;
        slashes[i].x = 0;
        slashes[i].y = 0;
        slashes[i].vX = 0;
        slashes[i].vY = 0;
        slashes[i].hitboxOffX = 0;
        slashes[i].hitboxOffY = 0;
        slashes[i].hitboxW = 0;
        slashes[i].hitboxH = 0;
        slashes[i].direction = LEFT;
        slashes[i].lifetime = 0;
        slashes[i].oamIndex = MAX_ENEMIES + MAX_BULLETS + 2 + i;
    }
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

void initKorok() {
    korok.active = 1;
    korok.x = TO_FIXED(430);
    korok.y = TO_FIXED(80);
    korok.currentFrame = 0;
    korok.frames = korokFrames;
    korok.numFrames = 4;
    korok.oamIndex = MAX_ENEMIES + MAX_BULLETS + MAX_SLASHES+ 2;
}

void initBushes() {
    bushCount = 0;

    for (int y = 0; y < LEVEL1MAP_HEIGHT / 8; y++) {
        for (int x = 0; x < LEVEL1MAP_WIDTH / 8; x++) {
            if (colorAt(x * 8, y * 8) == BUSH_COLLISION_COLOR && bushCount < MAX_BUSHES) {
                bushes[bushCount].tileX = x;
                bushes[bushCount].tileY = y;
                bushes[bushCount].cut = 0;
                bushCount++;
            }
        }
    }
}

void updateGame() {
    updatePlayer();
    updateSlashes();
    updateEnemies();
    updateBullets();
    updateKorok();
    checkEntityCollisions();
    updateCamera();
    updateEnvironment();
}

void updateEnvironment() {
    BG_PALETTE[12] = waterColorUpdate[(waterColor / 16) % 8];
    waterColor++;
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

void setPlayerMovementFromInputs() {
    player.vX = 0;
    player.vY = 0;

    if (BUTTON_HELD(BUTTON_UP)) {player.vY -= PLAYER_SPEED; player.direction = UP;}
    if (BUTTON_HELD(BUTTON_DOWN)) {player.vY += PLAYER_SPEED; player.direction = DOWN;}
    if (BUTTON_HELD(BUTTON_LEFT)) {player.vX -= PLAYER_SPEED; player.direction = LEFT;}
    if (BUTTON_HELD(BUTTON_RIGHT)) {player.vX += PLAYER_SPEED; player.direction = RIGHT;}
}

void moveAndCollidePlayer() {
    int playerLeft = FROM_FIXED(player.x + player.vX) + player.hitboxOffX;
    int playerTop = FROM_FIXED(player.y) + player.hitboxOffY;
    int playerRight = playerLeft + player.hitboxW - 1;
    int playerBottom = playerTop + player.hitboxH - 1;

    if (checkHitboxCollision(playerLeft, playerTop, playerRight, playerBottom, PLAYER_COLLISION_MASK)) {
        player.vX = 0;
    }

    playerLeft = FROM_FIXED(player.x) + player.hitboxOffX;
    playerTop = FROM_FIXED(player.y + player.vY) + player.hitboxOffY;
    playerRight = playerLeft + player.hitboxW - 1;
    playerBottom = playerTop + player.hitboxH - 1;

    if (checkHitboxCollision(playerLeft, playerTop, playerRight, playerBottom, PLAYER_COLLISION_MASK)) {
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
}

void updatePlayer() {
    // update animations
    player.timeUntilNextFrame--;
    if (player.timeUntilNextFrame <= 0) {
        player.timeUntilNextFrame = FRAME_DURATION;
        player.currentFrame++;

        if (player.currentFrame >= player.numFrames) {
            if (player.state == ATTACK || player.state == DODGE || player.state == HIT) {
                player.state = IDLE;
                player.frames = playerIdleFrames;
                player.numFrames = 1;
                sword.active = 0;
            }
            player.currentFrame = 0;
        }
    }
    mgba_printf("Player state: %d, frame: %d", player.state, player.currentFrame);
    int playerLeft, playerTop, playerRight, playerBottom;
    switch (player.state) {
        case DODGE:
            setPlayerMovementFromInputs();
            player.vX = (player.vX * 3) / 2;
            player.vY = (player.vY * 3) / 2;
            moveAndCollidePlayer();
            break;
        case ATTACK:
            player.vX = 0;
            player.vY = 0;
            if (player.currentFrame < 2) {
                if (player.direction == LEFT) player.vX = -ATTACK_LUNGE_SPEED;
                if (player.direction == RIGHT) player.vX =  ATTACK_LUNGE_SPEED;
                if (player.direction == UP) player.vY = -ATTACK_LUNGE_SPEED;
                if (player.direction == DOWN) player.vY =  ATTACK_LUNGE_SPEED;
                moveAndCollidePlayer();
            }
            break;
        case HIT:
            // knockback in opposite direction of movement
            if (player.direction == LEFT) {
                player.vX = PLAYER_SPEED;
            } else if (player.direction == RIGHT) {
                player.vX = -PLAYER_SPEED;
            } else if (player.direction == UP) {
                player.vY = PLAYER_SPEED;
            } else {
                player.vY = -PLAYER_SPEED;
            }

            moveAndCollidePlayer();
            break;
        default:
            if (BUTTON_PRESSED(BUTTON_LSHOULDER)) {
                player.state = DODGE;
                player.frames = playerDodgeFrames;
                player.numFrames = 6;
                player.currentFrame = 0;
                player.timeUntilNextFrame = 6;
                playAnalogSound(DASH);
                break;
            }
            if (BUTTON_PRESSED(BUTTON_A)) {
                attack();
                break;
            }

            setPlayerMovementFromInputs();
            moveAndCollidePlayer();

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
            break;
    }

    // win check
    playerLeft = FROM_FIXED(player.x) + player.hitboxOffX;
    playerTop = FROM_FIXED(player.y) + player.hitboxOffY;
    playerRight = playerLeft + player.hitboxW - 1;
    playerBottom = playerTop + player.hitboxH - 1;

    if (colorAt(playerLeft, playerTop) == 2 || colorAt(playerRight, playerTop) == 2 ||
        colorAt(playerLeft, playerBottom) == 2 || colorAt(playerRight, playerBottom) == 2) {
        winFlag = 1;
        playAnalogSound(VICTORY);
        return;
    }
}

void attack() {
    if (player.state == ATTACK || player.state == DODGE) return;
    player.state = ATTACK;
    player.frames = playerAttackFrames;
    player.numFrames = 4;
    player.currentFrame = 0;
    playAnalogSound(SWING);
    player.timeUntilNextFrame = FRAME_DURATION;

    sword.active = 1;
    sword.frames = swordFrames;
    sword.numFrames = 4;
    sword.timeUntilNextFrame = FRAME_DURATION;

    if (cheatFlag) {
        for (int i = 0; i < MAX_SLASHES; i++) {
            if (!slashes[i].active) {
                slashes[i].active = 1;
                if (player.direction == LEFT) {
                    slashes[i].x = player.x - TO_FIXED(8);
                    slashes[i].y = player.y;
                    slashes[i].hitboxOffX = 6;
                    slashes[i].hitboxOffY = 2;
                    slashes[i].hitboxW = 6;
                    slashes[i].hitboxH = 12;
                    slashes[i].vX = -SLASH_SPEED;
                    slashes[i].vY = 0;
                } else if (player.direction == RIGHT) {
                    slashes[i].x = player.x + TO_FIXED(8);
                    slashes[i].y = player.y;
                    slashes[i].hitboxOffX = 5;
                    slashes[i].hitboxOffY = 2;
                    slashes[i].hitboxW = 6;
                    slashes[i].hitboxH = 12;
                    slashes[i].vX = SLASH_SPEED;
                    slashes[i].vY = 0;
                } else if (player.direction == UP) {
                    slashes[i].y = player.y - TO_FIXED(4);
                    slashes[i].x = player.x;
                    slashes[i].hitboxOffX = 2;
                    slashes[i].hitboxOffY = 6;
                    slashes[i].hitboxW = 12;
                    slashes[i].hitboxH = 6;
                    slashes[i].vX = 0;
                    slashes[i].vY = -SLASH_SPEED;
                } else {
                    slashes[i].y = player.y + TO_FIXED(4);
                    slashes[i].x = player.x;
                    slashes[i].hitboxOffX = 2;
                    slashes[i].hitboxOffY = 5;
                    slashes[i].hitboxW = 12;
                    slashes[i].hitboxH = 6;
                    slashes[i].vX = 0;
                    slashes[i].vY = SLASH_SPEED;
                }
                slashes[i].direction = player.direction;
                slashes[i].lifetime = SLASH_LIFETIME;
                return;
            }
        }
    }
}

void updateSlashes() {
    for (int i = 0; i < MAX_SLASHES; i++) {
        if (!slashes[i].active) continue;

        slashes[i].x += slashes[i].vX;
        slashes[i].y += slashes[i].vY;
        slashes[i].lifetime--;

        if (slashes[i].lifetime <= 0) {
            slashes[i].active = 0;
        }
    }
}

void updateEnemies() {
    for (int i = 0; i < MAX_ENEMIES; i++) {
        if (!enemies[i].active) continue;
        updateEnemy(&enemies[i]);
    }
}

void updateEnemy(Enemy* enemy) {
    int enemyIndex = enemy - enemies;
    int patrolCount = sizeof(enemyPatrolPoints[enemyIndex]) / sizeof(enemyPatrolPoints[enemyIndex][0]);
    int enemyX = FROM_FIXED(enemy->x);
    int enemyY = FROM_FIXED(enemy->y);

    enemy->vX = 0;
    enemy->vY = 0;

    if (enemy->animState != ATTACK) {
        int targetIndex = enemy->patrolTargetIndex;
        int targetX = enemyPatrolPoints[enemyIndex][targetIndex][0];
        int targetY = enemyPatrolPoints[enemyIndex][targetIndex][1];
        int dX = targetX - enemyX;
        int dY = targetY - enemyY;

        // patrol behavior
        if (abs(dX) <= 2 && abs(dY) <= 2) {
            // reached patrol point, switch to next one
            int nextIndex = (targetIndex + 1) % patrolCount;
            int nextX = enemyPatrolPoints[enemyIndex][nextIndex][0];
            int nextY = enemyPatrolPoints[enemyIndex][nextIndex][1];
            int turnDX = nextX - enemyX;
            int turnDY = nextY - enemyY;

            if (abs(turnDX) >= abs(turnDY)) {
                enemy->direction = (turnDX < 0) ? LEFT : RIGHT;
            } else {
                enemy->direction = (turnDY < 0) ? UP : DOWN;
            }

            enemy->patrolTargetIndex = nextIndex;
            enemy->animState = ATTACK;
            enemy->frames = enemyAttackFrames;
            enemy->numFrames = 7;
            enemy->currentFrame = 0;
            enemy->timeUntilNextFrame = 5;
            enemy->firedShot = 0;
        } else {
            // move towards patrol point
            if (abs(dX) >= abs(dY)) {
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

    if (enemy->animState == ATTACK && !enemy->firedShot && enemy->currentFrame >= ENEMY_ATTACK_FRAME) {
        spawnBullet(enemy->x, enemy->y, enemy->direction);
        enemy->firedShot = 1;
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
            bullets[i].lifetime = BULLET_LIFETIME;

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

int checkBushCollision(int x, int y) {
    int tileX = x >> 3;
    int tileY = y >> 3;

    for (int i = 0; i < bushCount; i++) {
        if (bushes[i].tileX == tileX && bushes[i].tileY == tileY) {
            return !bushes[i].cut;
        }
    }

    return 0;
}

int checkHitboxCollision(int left, int top, int right, int bottom, u32 colorMask) {
    if (mapCollide(left, top, colorMask) ||
        mapCollide(right, top, colorMask) ||
        mapCollide(left, bottom, colorMask) ||
        mapCollide(right, bottom, colorMask) ||
        checkBushCollision(left, top) ||
        checkBushCollision(right, top) ||
        checkBushCollision(left, bottom) ||
        checkBushCollision(right, bottom)) {
        return 1;
    }
    return 0;
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

    // sword collision with bushes
    if (sword.active) {
        int leftTile = swordHitboxX >> 3;
        int rightTile = (swordHitboxX + swordHitboxW - 1) >> 3;
        int topTile = swordHitboxY >> 3;
        int bottomTile = (swordHitboxY + swordHitboxH - 1) >> 3;

        for (int tileY = topTile; tileY <= bottomTile; tileY++) {
            for (int tileX = leftTile; tileX <= rightTile; tileX++) {
                if (colorAt(tileX * 8, tileY * 8) == BUSH_COLLISION_COLOR) {
                    for (int i = 0; i < bushCount; i++) {
                        if (bushes[i].tileX == tileX && bushes[i].tileY == tileY && !bushes[i].cut) {
                            bushes[i].cut = 1;
                            setMapTile(BUSH_LAYER_SCREENBLOCK, tileX, tileY, CUT_BUSH_TILE_ID);
                            playAnalogSound(BUSH);
                            continue;
                        }
                    }
                }
            }
        }
    }

    int pLeft   = playerX + player.hitboxOffX;
    int pTop    = playerY + player.hitboxOffY;
    int pRight  = pLeft + player.hitboxW;
    int pBottom = pTop + player.hitboxH;

    // player collision with bullet
    if (player.state != DODGE && player.state != HIT) {
        for (int i = 0; i < MAX_BULLETS; i++) {
            if (!bullets[i].active) continue;
            int bulletX = FROM_FIXED(bullets[i].x);
            int bulletY = FROM_FIXED(bullets[i].y);
            if (hitboxCollide(pLeft, pTop, player.hitboxW, player.hitboxH, bulletX + bullets[i].hitboxOffX, bulletY + bullets[i].hitboxOffY, bullets[i].hitboxW, bullets[i].hitboxH)) {
                bullets[i].active = 0;
                lives--;
                playAnalogSound(OUCH);
                player.state = HIT;
                player.frames = playerHitFrames;
                player.numFrames = sizeof(playerHitFrames) / sizeof(playerHitFrames[0]);
                player.currentFrame = 0;
                mgba_printf("Player hit by bullet!");
            }
        }
    }

    for (int i = 0; i < MAX_ENEMIES; i++) {
        if (!enemies[i].active) continue;
        int enemyX = FROM_FIXED(enemies[i].x);
        int enemyY = FROM_FIXED(enemies[i].y);
        // sword collision with enemy
        if (swordHitboxX < enemyX + enemies[i].hitboxOffX + enemies[i].hitboxW &&
            swordHitboxX + swordHitboxW > enemyX + enemies[i].hitboxOffX &&
            swordHitboxY < enemyY + enemies[i].hitboxOffY + enemies[i].hitboxH &&
            swordHitboxY + swordHitboxH > enemyY + enemies[i].hitboxOffY && sword.active) {
            mgba_printf("Enemy hit!");
            playAnalogSound(KILL);
            enemies[i].active = 0;
            return;
        }

        // slash collision with enemy
        for (int j = 0; j < MAX_SLASHES; j++) {
            if (!slashes[j].active) continue;
            int slashX = FROM_FIXED(slashes[j].x);
            int slashY = FROM_FIXED(slashes[j].y);
            if (hitboxCollide(slashX + slashes[j].hitboxOffX, slashY + slashes[j].hitboxOffY, slashes[j].hitboxW, slashes[j].hitboxH,
                enemyX + enemies[i].hitboxOffX, enemyY + enemies[i].hitboxOffY, enemies[i].hitboxW, enemies[i].hitboxH)) {
                slashes[j].active = 0;
                mgba_printf("Enemy hit by slash!");
                playAnalogSound(KILL);
                enemies[i].active = 0;
                return;
            }
        }

        // player collision with enemy
        if (player.state == DODGE || player.state == HIT) continue;
        if (pLeft < enemyX + enemies[i].hitboxOffX + enemies[i].hitboxW &&
            pRight > enemyX + enemies[i].hitboxOffX &&
            pTop < enemyY + enemies[i].hitboxOffY + enemies[i].hitboxH &&
            pBottom > enemyY + enemies[i].hitboxOffY) {
            mgba_printf("Player hit!");
            playAnalogSound(OUCH);
            player.state = HIT;
            player.frames = playerHitFrames;
            player.numFrames = sizeof(playerHitFrames) / sizeof(playerHitFrames[0]);
            player.currentFrame = 0;
            lives--;
        }
    }
}

void updateKorok() {
    korok.timeUntilNextFrame--;
    if (korok.timeUntilNextFrame <= 0) {
        korok.timeUntilNextFrame = 20;
        korok.currentFrame = (korok.currentFrame + 1) % korok.numFrames;
    }
    
    // if player is close to korok, show exclamation mark
    if (player.x > korok.x - TO_FIXED(16) && player.x < korok.x + TO_FIXED(16) &&
        player.y > korok.y - TO_FIXED(16) && player.y < korok.y + TO_FIXED(16) && !cheatFlag) {
        korok.promptVisible = 1;

        if (BUTTON_PRESSED(BUTTON_B)) {
            playAnalogSound(POWERUP);
            cheatFlag = 1;
            lives = 12;
        }
    } else {
        korok.promptVisible = 0;
    }
}

void drawGame() {
    drawHUD();
    drawPlayer();
    drawSlashes();
    drawEnemies();
    drawBullets();
    drawKorok();

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

void drawSlashes() {
    for (int i = 0; i < MAX_SLASHES; i++) {
        Slash* slash = &slashes[i];
        if (!slash->active || clipSpritesOffScreen(slash->oamIndex, FROM_FIXED(slash->x) - hOff, FROM_FIXED(slash->y) - vOff, 8, 8)) {
            shadowOAM[slash->oamIndex].attr0 = ATTR0_HIDE;
            continue;
        }

        shadowOAM[slash->oamIndex].attr0 = ROWMASK(FROM_FIXED(slash->y) - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[slash->oamIndex].attr1 = COLMASK(FROM_FIXED(slash->x) - hOff) | ATTR1_SMALL | (slash->direction == RIGHT ? ATTR1_HFLIP : 0);
        if (slash->direction == LEFT) {
            shadowOAM[slash->oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, 2) | ATTR2_PRIORITY(2);
        } else {
            shadowOAM[slash->oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, slash->direction * 4 - 2) | ATTR2_PRIORITY(2);
        }
    }
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

void drawKorok() {
    if (!korok.active || clipSpritesOffScreen(korok.oamIndex, FROM_FIXED(korok.x) - hOff, FROM_FIXED(korok.y) - vOff, 16, 16)) {
        shadowOAM[korok.oamIndex].attr0 = ATTR0_HIDE;
        return;
    }
    shadowOAM[korok.oamIndex].attr0 = ROWMASK(FROM_FIXED(korok.y) - vOff) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[korok.oamIndex].attr1 = COLMASK(FROM_FIXED(korok.x) - hOff) | ATTR1_SMALL;
    shadowOAM[korok.oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(korok.frames[korok.currentFrame], 0) | ATTR2_PRIORITY(2);

    if (korok.promptVisible) {
        shadowOAM[korok.oamIndex + 1].attr0 = ROWMASK(FROM_FIXED(korok.y) - vOff - 8) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[korok.oamIndex + 1].attr1 = COLMASK(FROM_FIXED(korok.x) - hOff + 8) | ATTR1_SMALL;
        shadowOAM[korok.oamIndex + 1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(704, 0) | ATTR2_PRIORITY(1);
    } else {
        shadowOAM[korok.oamIndex + 1].attr0 = ATTR0_HIDE;
    }
}

void drawHUD() {
    if (cheatFlag) {
        for (int i = 0; i < CHEAT_LIVES; i++) {
            int tile = (i < lives) ? HUD_LIFE_TILE : HUD_LIFE_TILE + 1;
            SCREENBLOCK[HUD_SCREENBLOCK].tilemap[1 * 32 + i + 1] = TILEMAP_ENTRY_TILEID(tile) | TILEMAP_ENTRY_PALROW(HUD_PALROW);
        }
        return;
    }
    for (int i = 0; i < MAX_LIVES; i++) {
        int tile = (i < lives) ? HUD_LIFE_TILE : HUD_LIFE_TILE + 1;
        SCREENBLOCK[HUD_SCREENBLOCK].tilemap[1 * 32 + i + 1] = TILEMAP_ENTRY_TILEID(tile) | TILEMAP_ENTRY_PALROW(HUD_PALROW);
    }
}