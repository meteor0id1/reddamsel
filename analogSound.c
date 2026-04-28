#include "analogSound.h"

// For TA sanity, please do not mess with the volume settings here.
void initSound()
{
  // Enable sound (Master control)
  REG_SOUNDCNT_X = SND_ENABLED;

  // Master sound controls for DMG (GameBoy) Sound Generators
  REG_SOUNDCNT_L = DMG_VOL_LEFT(5) |
                   DMG_VOL_RIGHT(5) |
                   DMG_SND1_LEFT |
                   DMG_SND1_RIGHT |
                   DMG_SND2_LEFT |
                   DMG_SND2_RIGHT |
                   DMG_SND3_LEFT |
                   DMG_SND3_RIGHT |
                   DMG_SND4_LEFT |
                   DMG_SND4_RIGHT;

  REG_SOUNDCNT_H = DMG_MASTER_VOL(2);
}

void playNoteWithDuration(NoteWithDuration *n, unsigned char duty)
{
  if (n->note != REST)
  {
    REG_SND2CNT = DMG_ENV_VOL(15) | DMG_DUTY(duty) | (64 - n->duration * 256 / 1000); // duration is in ms, so back-calculate
    REG_SND2FREQ = n->note | SND_RESET | DMG_FREQ_TIMED;
  }
  else
  {
    REG_SND2CNT = 0;
    REG_SND2FREQ = 0;
  }
}

void playChannel1(unsigned short note, unsigned char length, unsigned char sweepShift, unsigned char sweepTime, unsigned char sweepDir, unsigned char envStepTime, unsigned char envDir, unsigned char duty)
{
  REG_SND1CNT = DMG_ENV_VOL(15) | (envDir ? DMG_DIRECTION_INCR : DMG_DIRECTION_DECR) | DMG_STEP_TIME(envStepTime) | DMG_DUTY(duty) | DMG_SND_LENGTH(length);
  REG_SND1FREQ = note | SND_RESET | DMG_FREQ_TIMED;
  REG_SND1SWEEP = DMG_SWEEP_NUM(sweepShift) | DMG_SWEEP_STEPTIME(sweepTime) | (sweepDir ? DMG_SWEEP_DOWN : 0);
}

void playDrumSound(unsigned char r, unsigned char s, unsigned char b, unsigned char length, unsigned char steptime)
{
  REG_SND4CNT = DMG_ENV_VOL(15) | DMG_STEP_TIME(steptime) | DMG_SND_LENGTH(length);
  REG_SND4FREQ = SND_RESET | DMG_FREQ_TIMED | DMG_SND4_S(s) | DMG_SND4_BIT(b) | DMG_SND4_R(r);
}

void playAnalogSound(SOUND_FX sound) {
  switch (sound) {
    case DASH:
      playDrumSound(0, 0, 0, 5, 2);
      break;
    case SWING:
      playChannel1(NOTE_B4, 22, 4, 1, 1, 2, 0, 2);
      break;
    case OUCH:
      playDrumSound(0, 9, 1, 8, 1);
      break;
    case KILL:
      playDrumSound(0, 9, 1, 8, 1);
      break;
    case BUSH:
      playDrumSound(0, 7, 0, 26, 3);
      break;
    case POWERUP:
      playChannel1(NOTE_G4, 24, 2, 1, 0, 0, 0, 2);
      break;
    case VICTORY:
      playChannel1(NOTE_C5, 28, 1, 0, 0, 0, 0, 2);
      break;
    case DEATH:
      playChannel1(NOTE_C5, 24, 3, 1, 1, 0, 0, 2);
      break;
  }
}
