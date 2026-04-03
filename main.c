#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "spritesheet.h"
#include "game.h"
#include "tileset.h"
#include "testmap.h"
#include "mode4.h"

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
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    fillScreen4(5);
    state = START;
}

void start() {
    mgba_printf("In start screen...");
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
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

    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | BG_ENABLE(2) | BG_ENABLE(3) | SPRITE_ENABLE;
    hideSprites();
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_4BPP;
    REG_BG2CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_4BPP;
    REG_BG3CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(29) | BG_4BPP;

    DMANow(3, tilesetTiles, CHARBLOCK, sizeof(tilesetTiles) / 2);
    DMANow(3, spritesheetTiles, CHARBLOCK + 4, sizeof(spritesheetTiles) / 2);

    DMANow(3, testmapLayer0Map, &SCREENBLOCK[29], sizeof(testmapLayer0Map) / 2);
    DMANow(3, testmapLayer1Map, &SCREENBLOCK[30], sizeof(testmapLayer1Map) / 2);
    DMANow(3, testmapLayer2Map, &SCREENBLOCK[31], sizeof(testmapLayer2Map) / 2);

    lives = 1;
    state = GAME;
    initGame();
}

void game() {
    updateGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    if (lives <= 0) {
        goToLose();
    }
    for (int i = 0; i < MAX_ENEMIES; i++) {
        if (enemies[i].active) break;
        goToWin();
    }

    drawGame();
}

void goToPause() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    fillScreen4(1);
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
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    fillScreen4(2);
    state = WIN;
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    fillScreen4(3);
    state = LOSE;
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}