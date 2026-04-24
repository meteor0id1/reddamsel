#include "gba.h"
#include "mode0.h"
#define FIX_SHIFT 4
#define TO_FIXED(n) ((n) << FIX_SHIFT)
#define FROM_FIXED(n) ((n) >> FIX_SHIFT)            

void setScreenblockPalette(int screenblock, int palRow);
int clipSpritesOffScreen(u8 oamIndex, int screenX, int screenY, int width, int height);
void clearBackground(int screenblock, u16 tileEntry);
u8 colorAt(int x, int y);
u8 mapCollide(int x, int y, u32 colorMask);
u8 hitboxCollide(int x1, int y1, int hbW1, int hbH1, int x2, int y2, int hbW2, int hbH2);
void resetOff();