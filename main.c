#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "spritesheet.h"
#include "game.h"
#include "tileset.h"
#include "testmap.h"

void initialize();
void goToStart();
void start();
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
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;

    DMANow(3, tilesetPal, BG_PALETTE, 256);
    DMANow(3, tilesetTiles, CHARBLOCK, sizeof(tilesetTiles) / 2);
    DMANow(3, spritesheetPal, SPRITE_PAL, 256);
    DMANow(3, spritesheetTiles, CHARBLOCK + 4, sizeof(spritesheetTiles) / 2);

    goToStart();
}

void goToStart() {
    hideSprites();
    state = START;
}

void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

void goToGame() {
    hideSprites();

    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | BG_ENABLE(2) | BG_ENABLE(3) | SPRITE_ENABLE;
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_4BPP;
    REG_BG2CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_4BPP;
    REG_BG3CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(29) | BG_4BPP;

    DMANow(3, testmapLayer0Map, &SCREENBLOCK[29], sizeof(testmapLayer0Map) / 2);
    DMANow(3, testmapLayer1Map, &SCREENBLOCK[30], sizeof(testmapLayer1Map) / 2);
    DMANow(3, testmapLayer2Map, &SCREENBLOCK[31], sizeof(testmapLayer2Map) / 2);

    state = GAME;
    initGame();
}

void game() {
    updateGame();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

void goToPause() {
    state = PAUSE;
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

void goToWin() {
    state = WIN;
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    state = LOSE;
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}