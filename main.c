#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "print.h"
#include "game.h"
#include "mode4.h"
#include "utils.h"
#include "analogSound.h"
#include "digitalSound.h"
#include "sprites.h"

#include "UItileset.h"
#include "tileset.h"
#include "spritesheet.h"
#include "level1Map.h"
#include "startScreen.h"
#include "instructionsScreen.h"
#include "pauseMenu.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "bgMusic.h"

void initialize();

void setupInterrupts();
void interruptHandler();

void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void resumeGame();
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
int bg2hOff;
int bg3hOff;

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
    initSound();
    setupSounds();
    setupInterrupts();
    playSoundA(bgMusic_data, bgMusic_length, 1);

    DMANow(3, tilesetPal, BG_PALETTE, 32);
    DMANow(3, UItilesetPal, BG_PALETTE + 32, 16);
    DMANow(3, spritesheetPal, SPRITE_PAL, 256);

    DMANow(3, tilesetTiles, CHARBLOCK, sizeof(tilesetTiles) / 2);
    DMANow(3, spritesheetTiles, CHARBLOCK + 4, sizeof(spritesheetTiles) / 2);
    DMANow(3, UItilesetTiles, CHARBLOCK + 1, sizeof(UItilesetTiles) / 2);

    bg2hOff = 0;
    bg3hOff = 0;
    
    goToStart();
}

void setupInterrupts() {
    REG_IME = 0;
    REG_IE = IRQ_VBLANK;
    REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;
    REG_INTERRUPT = &interruptHandler;
	REG_IME = 1;
}

void interruptHandler() {
	REG_IME = 0;
	if (REG_IF & IRQ_VBLANK) {
        if (soundA.isPlaying) {
            soundA.vBlankCount++;
            if (soundA.vBlankCount >= soundA.durationInVBlanks) {
                playSoundA(bgMusic_data, bgMusic_length, 1);
            }
        }
	}

    REG_IF = REG_IF;
    REG_IME = 1;
}

void goToStart() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(2) | BG_ENABLE(3);
    hideSprites();
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(HUD_SCREENBLOCK) | BG_4BPP | 0;
    REG_BG2CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_4BPP | 3;
    REG_BG3CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | 3;

    DMANow(3, startScreenLayer2Map, &SCREENBLOCK[HUD_SCREENBLOCK], 1024);
    DMANow(3, startScreenLayer1Map, &SCREENBLOCK[24], startScreenMapLen / 2);
    DMANow(3, startScreenLayer0Map, &SCREENBLOCK[28], startScreenMapLen / 2);

    setScreenblockPalette(HUD_SCREENBLOCK, 2);
    setScreenblockPalette(28, 1);
    setScreenblockPalette(29, 1);

    BG_PALETTE[0] = 0x4AAA;

    resetOff();
    state = START;
}

void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
    }
    bg2hOff += 10;
    bg3hOff += 4;

    waitForVBlank();
    REG_BG2HOFF = FROM_FIXED(bg2hOff);
    REG_BG3HOFF = FROM_FIXED(bg3hOff);
}

void goToInstructions() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(3);
    hideSprites();
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(HUD_SCREENBLOCK) | BG_4BPP | 0;
    REG_BG3CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | 3;

    DMANow(3, instructionsScreenLayer1Map, &SCREENBLOCK[HUD_SCREENBLOCK], 1024);
    DMANow(3, instructionsScreenLayer0Map, &SCREENBLOCK[28], instructionsScreenMapLen / 2);

    setScreenblockPalette(HUD_SCREENBLOCK, 2);
    setScreenblockPalette(28, 1);

    resetOff();
    state = INSTRUCTIONS;
}

void instructions() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        winFlag = 0;
        cheatFlag = 0;
        lives = MAX_LIVES;
        goToGame();
    }

    waitForVBlank();
    REG_BG3HOFF = 0;
}

void goToGame() {
    mgba_printf("Entering game...");

    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | BG_ENABLE(2) | BG_ENABLE(3) | SPRITE_ENABLE;
    hideSprites();
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(HUD_SCREENBLOCK) | BG_4BPP | 0;
    REG_BG1CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_4BPP | 1;
    REG_BG2CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_4BPP | 3;
    REG_BG3CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | 3;

    DMANow(3, tilesetTiles, CHARBLOCK, sizeof(tilesetTiles) / 2);
    DMANow(3, UItilesetTiles, CHARBLOCK + 1, sizeof(UItilesetTiles) / 2);
    DMANow(3, spritesheetTiles, CHARBLOCK + 4, sizeof(spritesheetTiles) / 2);

    DMANow(3, 0, &SCREENBLOCK[HUD_SCREENBLOCK], 1024);
    DMANow(3, level1MapLayer2Map, &SCREENBLOCK[20], level1MapMapLen / 2);
    DMANow(3, level1MapLayer1Map, &SCREENBLOCK[24], level1MapMapLen / 2);
    DMANow(3, level1MapLayer0Map, &SCREENBLOCK[28], level1MapMapLen / 2);

    setScreenblockPalette(HUD_SCREENBLOCK, 2);

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

void resumeGame() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | BG_ENABLE(2) | BG_ENABLE(3) | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(HUD_SCREENBLOCK) | BG_4BPP | 0;
    REG_BG1CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_4BPP | 1;
    REG_BG2CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_4BPP | 3;
    REG_BG3CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | 3;

    DMANow(3, tilesetTiles, CHARBLOCK, sizeof(tilesetTiles) / 2);
    DMANow(3, spritesheetTiles, CHARBLOCK + 4, sizeof(spritesheetTiles) / 2);

    DMANow(3, 0, &SCREENBLOCK[HUD_SCREENBLOCK], 1024);
    DMANow(3, level1MapLayer2Map, &SCREENBLOCK[20], level1MapMapLen / 2);
    DMANow(3, level1MapLayer1Map, &SCREENBLOCK[24], level1MapMapLen / 2);
    DMANow(3, level1MapLayer0Map, &SCREENBLOCK[28], level1MapMapLen / 2);
    state = GAME;
}

void goToPause() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(3);
    hideSprites();
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(HUD_SCREENBLOCK) | BG_4BPP | 0;
    REG_BG3CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | 3;

    DMANow(3, pauseMenuLayer1Map, &SCREENBLOCK[HUD_SCREENBLOCK], 1024);
    DMANow(3, pauseMenuLayer0Map, &SCREENBLOCK[28], pauseMenuMapLen / 2);

    setScreenblockPalette(HUD_SCREENBLOCK, 2);
    setScreenblockPalette(28, 1);

    resetOff();
    state = PAUSE;
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        resumeGame();
    }
}

void goToWin() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(2) | BG_ENABLE(3) | SPRITE_ENABLE;
    hideSprites();
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(HUD_SCREENBLOCK) | BG_4BPP | 0;
    REG_BG2CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_4BPP | 3;
    REG_BG3CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | 3;

    DMANow(3, winScreenLayer2Map, &SCREENBLOCK[HUD_SCREENBLOCK], 1024);
    DMANow(3, winScreenLayer1Map, &SCREENBLOCK[24], winScreenMapLen / 2);
    DMANow(3, winScreenLayer0Map, &SCREENBLOCK[28], winScreenMapLen / 2);

    setScreenblockPalette(HUD_SCREENBLOCK, 2);
    setScreenblockPalette(28, 1);
    resetOff();
    state = WIN;
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }

    shadowOAM[0].attr0 = ROWMASK(15 * 8) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = COLMASK(13 * 8) | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 4) | ATTR2_PRIORITY(2);

    shadowOAM[1].attr0 = ROWMASK(15 * 8) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[1].attr1 = COLMASK(15 * 8) | ATTR1_SMALL;
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 20) | ATTR2_PRIORITY(2);
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
}

void goToLose() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(3);
    hideSprites();
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(HUD_SCREENBLOCK) | BG_4BPP | 0;
    REG_BG3CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | 3;

    DMANow(3, loseScreenLayer1Map, &SCREENBLOCK[HUD_SCREENBLOCK], 1024);
    DMANow(3, loseScreenLayer0Map, &SCREENBLOCK[28], loseScreenMapLen / 2);

    setScreenblockPalette(HUD_SCREENBLOCK, 2);
    setScreenblockPalette(28, 1);
    playAnalogSound(DEATH);
    resetOff();
    state = LOSE;
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}