#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "spritesheet.h"
#include "game.h"
#include "tileset.h"
#include "level1Map.h"
#include "mode4.h"
#include "startMenu.h"
#include "pauseMenu.h"
#include "winMenu.h"
#include "loseMenu.h"
#include "utils.h"

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
        buttons = REG_BUTTONS;

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
    DMANow(3, tilesetPal, BG_PALETTE, 256);
    DMANow(3, spritesheetPal, SPRITE_PAL, 256);
    goToStart();
}

void goToStart() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | BG_ENABLE(2) | BG_ENABLE(3);
    hideSprites();
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_4BPP | 1;
    REG_BG2CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_4BPP | 3;
    REG_BG3CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | 3;

    DMANow(3, tilesetTiles, CHARBLOCK, sizeof(tilesetTiles) / 2);
    DMANow(3, spritesheetTiles, CHARBLOCK + 4, sizeof(spritesheetTiles) / 2);

    DMANow(3, startMenuLayer2Map, &SCREENBLOCK[20], startMenuMapLen / 2);
    DMANow(3, startMenuLayer1Map, &SCREENBLOCK[24], startMenuMapLen / 2);
    DMANow(3, startMenuLayer0Map, &SCREENBLOCK[28], startMenuMapLen / 2);

    resetOff();
    state = START;
}

void start() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        winFlag = 0;
        lives = MAX_LIVES;
        goToGame();
    }
}

void goToInstructions() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    fillScreen4(4);
    state = INSTRUCTIONS;
}

void instructions() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

void goToGame() {
    mgba_printf("Entering game...");

    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | BG_ENABLE(2) | BG_ENABLE(3) | SPRITE_ENABLE;
    hideSprites();
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(19) | BG_4BPP | 0;
    REG_BG1CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_4BPP | 1;
    REG_BG2CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_4BPP | 3;
    REG_BG3CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | 3;

    DMANow(3, tilesetTiles, CHARBLOCK, sizeof(tilesetTiles) / 2);
    DMANow(3, spritesheetTiles, CHARBLOCK + 4, sizeof(spritesheetTiles) / 2);

    DMANow(3, level1MapLayer2Map, &SCREENBLOCK[20], level1MapMapLen / 2);
    DMANow(3, level1MapLayer1Map, &SCREENBLOCK[24], level1MapMapLen / 2);
    DMANow(3, level1MapLayer0Map, &SCREENBLOCK[28], level1MapMapLen / 2);

    state = GAME;
    initGame();
}

void game() {
    updateGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
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
    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | BG_ENABLE(2) | BG_ENABLE(3);
    hideSprites();
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_4BPP | 1;
    REG_BG2CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_4BPP | 3;
    REG_BG3CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | 3;

    DMANow(3, tilesetTiles, CHARBLOCK, sizeof(tilesetTiles) / 2);
    DMANow(3, spritesheetTiles, CHARBLOCK + 4, sizeof(spritesheetTiles) / 2);

    DMANow(3, pauseMenuLayer2Map, &SCREENBLOCK[20], pauseMenuMapLen / 2);
    DMANow(3, pauseMenuLayer1Map, &SCREENBLOCK[24], pauseMenuMapLen / 2);
    DMANow(3, pauseMenuLayer0Map, &SCREENBLOCK[28], pauseMenuMapLen / 2);

    resetOff();
    state = PAUSE;
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

void goToWin() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | BG_ENABLE(2) | BG_ENABLE(3);
    hideSprites();
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_4BPP | 1;
    REG_BG2CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_4BPP | 3;
    REG_BG3CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | 3;

    DMANow(3, tilesetTiles, CHARBLOCK, sizeof(tilesetTiles) / 2);
    DMANow(3, spritesheetTiles, CHARBLOCK + 4, sizeof(spritesheetTiles) / 2);

    DMANow(3, winMenuLayer2Map, &SCREENBLOCK[20], winMenuMapLen / 2);
    DMANow(3, winMenuLayer1Map, &SCREENBLOCK[24], winMenuMapLen / 2);
    DMANow(3, winMenuLayer0Map, &SCREENBLOCK[28], winMenuMapLen / 2);

    resetOff();
    state = WIN;
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | BG_ENABLE(2) | BG_ENABLE(3);
    hideSprites();
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_4BPP | 1;
    REG_BG2CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_4BPP | 3;
    REG_BG3CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | 3;

    DMANow(3, tilesetTiles, CHARBLOCK, sizeof(tilesetTiles) / 2);
    DMANow(3, spritesheetTiles, CHARBLOCK + 4, sizeof(spritesheetTiles) / 2);

    DMANow(3, loseMenuLayer2Map, &SCREENBLOCK[20], loseMenuMapLen / 2);
    DMANow(3, loseMenuLayer1Map, &SCREENBLOCK[24], loseMenuMapLen / 2);
    DMANow(3, loseMenuLayer0Map, &SCREENBLOCK[28], loseMenuMapLen / 2);

    resetOff();
    state = LOSE;
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}