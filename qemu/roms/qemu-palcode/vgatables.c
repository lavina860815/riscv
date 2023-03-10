// Tables used by VGA bios
//
// Copyright (C) 2009  Kevin O'Connor <kevin@koconnor.net>
// Copyright (C) 2001-2008 the LGPL VGABios developers Team
//
// This file may be distributed under the terms of the GNU LGPLv3 license.

#include "protos.h"
#include "vgatables.h" // struct VideoParamTableEntry_s

#define ARRAY_SIZE(var)	(sizeof(var) / sizeof(var[0]))
#define GET_GLOBAL(var) (var)
#define VAR16

/****************************************************************
 * Video parameter table
 ****************************************************************/

struct VideoParam_s video_param_table[] VAR16 = {
    // index=0x00 no mode defined
    {},
    // index=0x01 no mode defined
    {},
    // index=0x02 no mode defined
    {},
    // index=0x03 no mode defined
    {},
    // index=0x04 vga mode 0x04
    { 40, 24, 8, 0x0800,      /* tw, th-1, ch, slength */
      { 0x09, 0x03, 0x00, 0x02 },    /* sequ_regs */
      0x63,                      /* miscreg */
      { 0x2d, 0x27, 0x28, 0x90, 0x2b, 0x80, 0xbf, 0x1f,
        0x00, 0xc1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x9c, 0x8e, 0x8f, 0x14, 0x00, 0x96, 0xb9, 0xa2,
        0xff },                      /* crtc_regs */
      { 0x00, 0x13, 0x15, 0x17, 0x02, 0x04, 0x06, 0x07,
        0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
        0x01, 0x00, 0x03, 0x00 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x0f, 0x0f, 0xff }, /* grdc_regs */
    },
    /* index=0x05 vga mode 0x05 */
    { 40, 24, 8, 0x0800,     /* tw, th-1, ch, slength */
      { 0x09, 0x03, 0x00, 0x02 },    /* sequ_regs */
      0x63,                      /* miscreg */
      { 0x2d, 0x27, 0x28, 0x90, 0x2b, 0x80, 0xbf, 0x1f,
        0x00, 0xc1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x9c, 0x8e, 0x8f, 0x14, 0x00, 0x96, 0xb9, 0xa2,
        0xff },                      /* crtc_regs */
      { 0x00, 0x13, 0x15, 0x17, 0x02, 0x04, 0x06, 0x07,
        0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
        0x01, 0x00, 0x03, 0x00 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x0f, 0x0f, 0xff }, /* grdc_regs */
    },
    /* index=0x06 vga mode 0x06 */
    { 80, 24, 8, 0x1000,     /* tw, th-1, ch, slength */
      { 0x01, 0x01, 0x00, 0x06 },    /* sequ_regs */
      0x63,                      /* miscreg */
      { 0x5f, 0x4f, 0x50, 0x82, 0x54, 0x80, 0xbf, 0x1f,
        0x00, 0xc1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x9c, 0x8e, 0x8f, 0x28, 0x00, 0x96, 0xb9, 0xc2,
        0xff },                      /* crtc_regs */
      { 0x00, 0x17, 0x17, 0x17, 0x17, 0x17, 0x17, 0x17,
        0x17, 0x17, 0x17, 0x17, 0x17, 0x17, 0x17, 0x17,
        0x01, 0x00, 0x01, 0x00 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0d, 0x0f, 0xff }, /* grdc_regs */
     },
    /* index=0x07 vga mode 0x07 */
    { 80, 24, 16, 0x1000,    /* tw, th-1, ch, slength */
      { 0x00, 0x03, 0x00, 0x02 },    /* sequ_regs */
      0x66,                      /* miscreg */
      { 0x5f, 0x4f, 0x50, 0x82, 0x55, 0x81, 0xbf, 0x1f,
        0x00, 0x4f, 0x0d, 0x0e, 0x00, 0x00, 0x00, 0x00,
        0x9c, 0x8e, 0x8f, 0x28, 0x0f, 0x96, 0xb9, 0xa3,
        0xff },                      /* crtc_regs */
      { 0x00, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
        0x10, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
        0x0e, 0x00, 0x0f, 0x08 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x0a, 0x0f, 0xff }, /* grdc_regs */
     },
    /* index=0x08 no mode defined */
    {},
    /* index=0x09 no mode defined */
    {},
    /* index=0x0a no mode defined */
    {},
    /* index=0x0b no mode defined */
    {},
    /* index=0x0c no mode defined */
    {},
    /* index=0x0d vga mode 0x0d */
    { 40, 24, 8, 0x2000,     /* tw, th-1, ch, slength */
      { 0x09, 0x0f, 0x00, 0x06 },    /* sequ_regs */
      0x63,                      /* miscreg */
      { 0x2d, 0x27, 0x28, 0x90, 0x2b, 0x80, 0xbf, 0x1f,
        0x00, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x9c, 0x8e, 0x8f, 0x14, 0x00, 0x96, 0xb9, 0xe3,
        0xff },                      /* crtc_regs */
      { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
        0x01, 0x00, 0x0f, 0x00 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x0f, 0xff }, /* grdc_regs */
     },
    /* index=0x0e vga mode 0x0e */
    { 80, 24, 8, 0x4000,     /* tw, th-1, ch, slength */
      { 0x01, 0x0f, 0x00, 0x06 },    /* sequ_regs */
      0x63,                      /* miscreg */
      { 0x5f, 0x4f, 0x50, 0x82, 0x54, 0x80, 0xbf, 0x1f,
        0x00, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x9c, 0x8e, 0x8f, 0x28, 0x00, 0x96, 0xb9, 0xe3,
        0xff },                      /* crtc_regs */
      { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
        0x01, 0x00, 0x0f, 0x00 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x0f, 0xff }, /* grdc_regs */
     },
    /* index=0x0f no mode defined */
    {},
    /* index=0x10 no mode defined */
    {},
    /* index=0x11 vga mode 0x0f */
    { 80, 24, 14, 0x8000,    /* tw, th-1, ch, slength */
      { 0x01, 0x0f, 0x00, 0x06 },    /* sequ_regs */
      0xa3,                      /* miscreg */
      { 0x5f, 0x4f, 0x50, 0x82, 0x54, 0x80, 0xbf, 0x1f,
        0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x83, 0x85, 0x5d, 0x28, 0x0f, 0x63, 0xba, 0xe3,
        0xff },                      /* crtc_regs */
      { 0x00, 0x08, 0x00, 0x00, 0x18, 0x18, 0x00, 0x00,
        0x00, 0x08, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00,
        0x01, 0x00, 0x01, 0x00 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x0f, 0xff }, /* grdc_regs */
     },
    /* index=0x12 vga mode 0x10 */
    { 80, 24, 14, 0x8000,    /* tw, th-1, ch, slength */
      { 0x01, 0x0f, 0x00, 0x06 },    /* sequ_regs */
      0xa3,                      /* miscreg */
      { 0x5f, 0x4f, 0x50, 0x82, 0x54, 0x80, 0xbf, 0x1f,
        0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x83, 0x85, 0x5d, 0x28, 0x0f, 0x63, 0xba, 0xe3,
        0xff },                      /* crtc_regs */
      { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x14, 0x07,
        0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f,
        0x01, 0x00, 0x0f, 0x00 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x0f, 0xff }, /* grdc_regs */
     },
    /* index=0x13 no mode defined */
    {},
    /* index=0x14 no mode defined */
    {},
    /* index=0x15 no mode defined */
    {},
    /* index=0x16 no mode defined */
    {},
    /* index=0x17 vga mode 0x01 */
    { 40, 24, 16, 0x0800,    /* tw, th-1, ch, slength */
      { 0x08, 0x03, 0x00, 0x02 },    /* sequ_regs */
      0x67,                      /* miscreg */
      { 0x2d, 0x27, 0x28, 0x90, 0x2b, 0xa0, 0xbf, 0x1f,
        0x00, 0x4f, 0x0d, 0x0e, 0x00, 0x00, 0x00, 0x00,
        0x9c, 0x8e, 0x8f, 0x14, 0x1f, 0x96, 0xb9, 0xa3,
        0xff },                      /* crtc_regs */
      { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x14, 0x07,
        0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f,
        0x0c, 0x00, 0x0f, 0x08 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x0e, 0x0f, 0xff }, /* grdc_regs */
    },
    /* index=0x18 vga mode 0x03 */
    { 80, 24, 16, 0x1000,    /* tw, th-1, ch, slength */
      { 0x00, 0x03, 0x00, 0x02 },    /* sequ_regs */
      0x67,                      /* miscreg */
      { 0x5f, 0x4f, 0x50, 0x82, 0x55, 0x81, 0xbf, 0x1f,
        0x00, 0x4f, 0x0d, 0x0e, 0x00, 0x00, 0x00, 0x00,
        0x9c, 0x8e, 0x8f, 0x28, 0x1f, 0x96, 0xb9, 0xa3,
        0xff },                      /* crtc_regs */
      { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x14, 0x07,
        0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f,
        0x0c, 0x00, 0x0f, 0x08 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x0e, 0x0f, 0xff }, /* grdc_regs */
     },
    /* index=0x19 vga mode 0x07 */
    { 80, 24, 16, 0x1000,    /* tw, th-1, ch, slength */
      { 0x00, 0x03, 0x00, 0x02 },    /* sequ_regs */
      0x66,                      /* miscreg */
      { 0x5f, 0x4f, 0x50, 0x82, 0x55, 0x81, 0xbf, 0x1f,
        0x00, 0x4f, 0x0d, 0x0e, 0x00, 0x00, 0x00, 0x00,
        0x9c, 0x8e, 0x8f, 0x28, 0x0f, 0x96, 0xb9, 0xa3,
        0xff },                      /* crtc_regs */
      { 0x00, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
        0x10, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
        0x0e, 0x00, 0x0f, 0x08 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x0a, 0x0f, 0xff }, /* grdc_regs */
    },
    /* index=0x1a vga mode 0x11 */
    { 80, 29, 16, 0x0000,    /* tw, th-1, ch, slength */
      { 0x01, 0x0f, 0x00, 0x06 },    /* sequ_regs */
      0xe3,                      /* miscreg */
      { 0x5f, 0x4f, 0x50, 0x82, 0x54, 0x80, 0x0b, 0x3e,
        0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0xea, 0x8c, 0xdf, 0x28, 0x00, 0xe7, 0x04, 0xe3,
        0xff },                      /* crtc_regs */
      { 0x00, 0x3f, 0x00, 0x3f, 0x00, 0x3f, 0x00, 0x3f,
        0x00, 0x3f, 0x00, 0x3f, 0x00, 0x3f, 0x00, 0x3f,
        0x01, 0x00, 0x0f, 0x00 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x0f, 0xff }, /* grdc_regs */
    },
    /* index=0x1b vga mode 0x12 */
    { 80, 29, 16, 0x0000,    /* tw, th-1, ch, slength */
      { 0x01, 0x0f, 0x00, 0x06 },    /* sequ_regs */
      0xe3,                      /* miscreg */
      { 0x5f, 0x4f, 0x50, 0x82, 0x54, 0x80, 0x0b, 0x3e,
        0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0xea, 0x8c, 0xdf, 0x28, 0x00, 0xe7, 0x04, 0xe3,
        0xff },                      /* crtc_regs */
      { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x14, 0x07,
        0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f,
        0x01, 0x00, 0x0f, 0x00 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x0f, 0xff }, /* grdc_regs */
     },
    /* index=0x1c vga mode 0x13 */
    { 40, 24, 8, 0x0000,     /* tw, th-1, ch, slength */
      { 0x01, 0x0f, 0x00, 0x0e },    /* sequ_regs */
      0x63,                      /* miscreg */
      { 0x5f, 0x4f, 0x50, 0x82, 0x54, 0x80, 0xbf, 0x1f,
        0x00, 0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x9c, 0x8e, 0x8f, 0x28, 0x40, 0x96, 0xb9, 0xa3,
        0xff },                      /* crtc_regs */
      { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
        0x41, 0x00, 0x0f, 0x00 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x05, 0x0f, 0xff }, /* grdc_regs */
     },
    /* index=0x1d vga mode 0x6a */
    { 100, 36, 16, 0x0000,   /* tw, th-1, ch, slength */
      { 0x01, 0x0f, 0x00, 0x06 },    /* sequ_regs */
      0xe3,                      /* miscreg */
      { 0x7f, 0x63, 0x63, 0x83, 0x6b, 0x1b, 0x72, 0xf0,
        0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x59, 0x8d, 0x57, 0x32, 0x00, 0x57, 0x73, 0xe3,
        0xff },                      /* crtc_regs */
      { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x14, 0x07,
        0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f,
        0x01, 0x00, 0x0f, 0x00 },    /* actl_regs */
      { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x0f, 0xff }, /* grdc_regs */
     },
};


/****************************************************************
 * Palette definitions
 ****************************************************************/

/* Mono */
static u8 palette0[] VAR16 = {
  0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00,
  0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00,
  0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a,
  0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a,
  0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a,
  0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a,
  0x3f,0x3f,0x3f, 0x3f,0x3f,0x3f, 0x3f,0x3f,0x3f, 0x3f,0x3f,0x3f,
  0x3f,0x3f,0x3f, 0x3f,0x3f,0x3f, 0x3f,0x3f,0x3f, 0x3f,0x3f,0x3f,
  0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00,
  0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00,
  0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a,
  0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a,
  0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a,
  0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a, 0x2a,0x2a,0x2a,
  0x3f,0x3f,0x3f, 0x3f,0x3f,0x3f, 0x3f,0x3f,0x3f, 0x3f,0x3f,0x3f,
  0x3f,0x3f,0x3f, 0x3f,0x3f,0x3f, 0x3f,0x3f,0x3f, 0x3f,0x3f,0x3f
};

static u8 palette1[] VAR16 = {
  0x00,0x00,0x00, 0x00,0x00,0x2a, 0x00,0x2a,0x00, 0x00,0x2a,0x2a,
  0x2a,0x00,0x00, 0x2a,0x00,0x2a, 0x2a,0x15,0x00, 0x2a,0x2a,0x2a,
  0x00,0x00,0x00, 0x00,0x00,0x2a, 0x00,0x2a,0x00, 0x00,0x2a,0x2a,
  0x2a,0x00,0x00, 0x2a,0x00,0x2a, 0x2a,0x15,0x00, 0x2a,0x2a,0x2a,
  0x15,0x15,0x15, 0x15,0x15,0x3f, 0x15,0x3f,0x15, 0x15,0x3f,0x3f,
  0x3f,0x15,0x15, 0x3f,0x15,0x3f, 0x3f,0x3f,0x15, 0x3f,0x3f,0x3f,
  0x15,0x15,0x15, 0x15,0x15,0x3f, 0x15,0x3f,0x15, 0x15,0x3f,0x3f,
  0x3f,0x15,0x15, 0x3f,0x15,0x3f, 0x3f,0x3f,0x15, 0x3f,0x3f,0x3f,
  0x00,0x00,0x00, 0x00,0x00,0x2a, 0x00,0x2a,0x00, 0x00,0x2a,0x2a,
  0x2a,0x00,0x00, 0x2a,0x00,0x2a, 0x2a,0x15,0x00, 0x2a,0x2a,0x2a,
  0x00,0x00,0x00, 0x00,0x00,0x2a, 0x00,0x2a,0x00, 0x00,0x2a,0x2a,
  0x2a,0x00,0x00, 0x2a,0x00,0x2a, 0x2a,0x15,0x00, 0x2a,0x2a,0x2a,
  0x15,0x15,0x15, 0x15,0x15,0x3f, 0x15,0x3f,0x15, 0x15,0x3f,0x3f,
  0x3f,0x15,0x15, 0x3f,0x15,0x3f, 0x3f,0x3f,0x15, 0x3f,0x3f,0x3f,
  0x15,0x15,0x15, 0x15,0x15,0x3f, 0x15,0x3f,0x15, 0x15,0x3f,0x3f,
  0x3f,0x15,0x15, 0x3f,0x15,0x3f, 0x3f,0x3f,0x15, 0x3f,0x3f,0x3f
};

static u8 palette2[] VAR16 = {
  0x00,0x00,0x00, 0x00,0x00,0x2a, 0x00,0x2a,0x00, 0x00,0x2a,0x2a,
  0x2a,0x00,0x00, 0x2a,0x00,0x2a, 0x2a,0x2a,0x00, 0x2a,0x2a,0x2a,
  0x00,0x00,0x15, 0x00,0x00,0x3f, 0x00,0x2a,0x15, 0x00,0x2a,0x3f,
  0x2a,0x00,0x15, 0x2a,0x00,0x3f, 0x2a,0x2a,0x15, 0x2a,0x2a,0x3f,
  0x00,0x15,0x00, 0x00,0x15,0x2a, 0x00,0x3f,0x00, 0x00,0x3f,0x2a,
  0x2a,0x15,0x00, 0x2a,0x15,0x2a, 0x2a,0x3f,0x00, 0x2a,0x3f,0x2a,
  0x00,0x15,0x15, 0x00,0x15,0x3f, 0x00,0x3f,0x15, 0x00,0x3f,0x3f,
  0x2a,0x15,0x15, 0x2a,0x15,0x3f, 0x2a,0x3f,0x15, 0x2a,0x3f,0x3f,
  0x15,0x00,0x00, 0x15,0x00,0x2a, 0x15,0x2a,0x00, 0x15,0x2a,0x2a,
  0x3f,0x00,0x00, 0x3f,0x00,0x2a, 0x3f,0x2a,0x00, 0x3f,0x2a,0x2a,
  0x15,0x00,0x15, 0x15,0x00,0x3f, 0x15,0x2a,0x15, 0x15,0x2a,0x3f,
  0x3f,0x00,0x15, 0x3f,0x00,0x3f, 0x3f,0x2a,0x15, 0x3f,0x2a,0x3f,
  0x15,0x15,0x00, 0x15,0x15,0x2a, 0x15,0x3f,0x00, 0x15,0x3f,0x2a,
  0x3f,0x15,0x00, 0x3f,0x15,0x2a, 0x3f,0x3f,0x00, 0x3f,0x3f,0x2a,
  0x15,0x15,0x15, 0x15,0x15,0x3f, 0x15,0x3f,0x15, 0x15,0x3f,0x3f,
  0x3f,0x15,0x15, 0x3f,0x15,0x3f, 0x3f,0x3f,0x15, 0x3f,0x3f,0x3f
};

static u8 palette3[] VAR16 = {
  0x00,0x00,0x00, 0x00,0x00,0x2a, 0x00,0x2a,0x00, 0x00,0x2a,0x2a,
  0x2a,0x00,0x00, 0x2a,0x00,0x2a, 0x2a,0x15,0x00, 0x2a,0x2a,0x2a,
  0x15,0x15,0x15, 0x15,0x15,0x3f, 0x15,0x3f,0x15, 0x15,0x3f,0x3f,
  0x3f,0x15,0x15, 0x3f,0x15,0x3f, 0x3f,0x3f,0x15, 0x3f,0x3f,0x3f,
  0x00,0x00,0x00, 0x05,0x05,0x05, 0x08,0x08,0x08, 0x0b,0x0b,0x0b,
  0x0e,0x0e,0x0e, 0x11,0x11,0x11, 0x14,0x14,0x14, 0x18,0x18,0x18,
  0x1c,0x1c,0x1c, 0x20,0x20,0x20, 0x24,0x24,0x24, 0x28,0x28,0x28,
  0x2d,0x2d,0x2d, 0x32,0x32,0x32, 0x38,0x38,0x38, 0x3f,0x3f,0x3f,
  0x00,0x00,0x3f, 0x10,0x00,0x3f, 0x1f,0x00,0x3f, 0x2f,0x00,0x3f,
  0x3f,0x00,0x3f, 0x3f,0x00,0x2f, 0x3f,0x00,0x1f, 0x3f,0x00,0x10,
  0x3f,0x00,0x00, 0x3f,0x10,0x00, 0x3f,0x1f,0x00, 0x3f,0x2f,0x00,
  0x3f,0x3f,0x00, 0x2f,0x3f,0x00, 0x1f,0x3f,0x00, 0x10,0x3f,0x00,
  0x00,0x3f,0x00, 0x00,0x3f,0x10, 0x00,0x3f,0x1f, 0x00,0x3f,0x2f,
  0x00,0x3f,0x3f, 0x00,0x2f,0x3f, 0x00,0x1f,0x3f, 0x00,0x10,0x3f,
  0x1f,0x1f,0x3f, 0x27,0x1f,0x3f, 0x2f,0x1f,0x3f, 0x37,0x1f,0x3f,
  0x3f,0x1f,0x3f, 0x3f,0x1f,0x37, 0x3f,0x1f,0x2f, 0x3f,0x1f,0x27,

  0x3f,0x1f,0x1f, 0x3f,0x27,0x1f, 0x3f,0x2f,0x1f, 0x3f,0x37,0x1f,
  0x3f,0x3f,0x1f, 0x37,0x3f,0x1f, 0x2f,0x3f,0x1f, 0x27,0x3f,0x1f,
  0x1f,0x3f,0x1f, 0x1f,0x3f,0x27, 0x1f,0x3f,0x2f, 0x1f,0x3f,0x37,
  0x1f,0x3f,0x3f, 0x1f,0x37,0x3f, 0x1f,0x2f,0x3f, 0x1f,0x27,0x3f,
  0x2d,0x2d,0x3f, 0x31,0x2d,0x3f, 0x36,0x2d,0x3f, 0x3a,0x2d,0x3f,
  0x3f,0x2d,0x3f, 0x3f,0x2d,0x3a, 0x3f,0x2d,0x36, 0x3f,0x2d,0x31,
  0x3f,0x2d,0x2d, 0x3f,0x31,0x2d, 0x3f,0x36,0x2d, 0x3f,0x3a,0x2d,
  0x3f,0x3f,0x2d, 0x3a,0x3f,0x2d, 0x36,0x3f,0x2d, 0x31,0x3f,0x2d,
  0x2d,0x3f,0x2d, 0x2d,0x3f,0x31, 0x2d,0x3f,0x36, 0x2d,0x3f,0x3a,
  0x2d,0x3f,0x3f, 0x2d,0x3a,0x3f, 0x2d,0x36,0x3f, 0x2d,0x31,0x3f,
  0x00,0x00,0x1c, 0x07,0x00,0x1c, 0x0e,0x00,0x1c, 0x15,0x00,0x1c,
  0x1c,0x00,0x1c, 0x1c,0x00,0x15, 0x1c,0x00,0x0e, 0x1c,0x00,0x07,
  0x1c,0x00,0x00, 0x1c,0x07,0x00, 0x1c,0x0e,0x00, 0x1c,0x15,0x00,
  0x1c,0x1c,0x00, 0x15,0x1c,0x00, 0x0e,0x1c,0x00, 0x07,0x1c,0x00,
  0x00,0x1c,0x00, 0x00,0x1c,0x07, 0x00,0x1c,0x0e, 0x00,0x1c,0x15,
  0x00,0x1c,0x1c, 0x00,0x15,0x1c, 0x00,0x0e,0x1c, 0x00,0x07,0x1c,

  0x0e,0x0e,0x1c, 0x11,0x0e,0x1c, 0x15,0x0e,0x1c, 0x18,0x0e,0x1c,
  0x1c,0x0e,0x1c, 0x1c,0x0e,0x18, 0x1c,0x0e,0x15, 0x1c,0x0e,0x11,
  0x1c,0x0e,0x0e, 0x1c,0x11,0x0e, 0x1c,0x15,0x0e, 0x1c,0x18,0x0e,
  0x1c,0x1c,0x0e, 0x18,0x1c,0x0e, 0x15,0x1c,0x0e, 0x11,0x1c,0x0e,
  0x0e,0x1c,0x0e, 0x0e,0x1c,0x11, 0x0e,0x1c,0x15, 0x0e,0x1c,0x18,
  0x0e,0x1c,0x1c, 0x0e,0x18,0x1c, 0x0e,0x15,0x1c, 0x0e,0x11,0x1c,
  0x14,0x14,0x1c, 0x16,0x14,0x1c, 0x18,0x14,0x1c, 0x1a,0x14,0x1c,
  0x1c,0x14,0x1c, 0x1c,0x14,0x1a, 0x1c,0x14,0x18, 0x1c,0x14,0x16,
  0x1c,0x14,0x14, 0x1c,0x16,0x14, 0x1c,0x18,0x14, 0x1c,0x1a,0x14,
  0x1c,0x1c,0x14, 0x1a,0x1c,0x14, 0x18,0x1c,0x14, 0x16,0x1c,0x14,
  0x14,0x1c,0x14, 0x14,0x1c,0x16, 0x14,0x1c,0x18, 0x14,0x1c,0x1a,
  0x14,0x1c,0x1c, 0x14,0x1a,0x1c, 0x14,0x18,0x1c, 0x14,0x16,0x1c,
  0x00,0x00,0x10, 0x04,0x00,0x10, 0x08,0x00,0x10, 0x0c,0x00,0x10,
  0x10,0x00,0x10, 0x10,0x00,0x0c, 0x10,0x00,0x08, 0x10,0x00,0x04,
  0x10,0x00,0x00, 0x10,0x04,0x00, 0x10,0x08,0x00, 0x10,0x0c,0x00,
  0x10,0x10,0x00, 0x0c,0x10,0x00, 0x08,0x10,0x00, 0x04,0x10,0x00,

  0x00,0x10,0x00, 0x00,0x10,0x04, 0x00,0x10,0x08, 0x00,0x10,0x0c,
  0x00,0x10,0x10, 0x00,0x0c,0x10, 0x00,0x08,0x10, 0x00,0x04,0x10,
  0x08,0x08,0x10, 0x0a,0x08,0x10, 0x0c,0x08,0x10, 0x0e,0x08,0x10,
  0x10,0x08,0x10, 0x10,0x08,0x0e, 0x10,0x08,0x0c, 0x10,0x08,0x0a,
  0x10,0x08,0x08, 0x10,0x0a,0x08, 0x10,0x0c,0x08, 0x10,0x0e,0x08,
  0x10,0x10,0x08, 0x0e,0x10,0x08, 0x0c,0x10,0x08, 0x0a,0x10,0x08,
  0x08,0x10,0x08, 0x08,0x10,0x0a, 0x08,0x10,0x0c, 0x08,0x10,0x0e,
  0x08,0x10,0x10, 0x08,0x0e,0x10, 0x08,0x0c,0x10, 0x08,0x0a,0x10,
  0x0b,0x0b,0x10, 0x0c,0x0b,0x10, 0x0d,0x0b,0x10, 0x0f,0x0b,0x10,
  0x10,0x0b,0x10, 0x10,0x0b,0x0f, 0x10,0x0b,0x0d, 0x10,0x0b,0x0c,
  0x10,0x0b,0x0b, 0x10,0x0c,0x0b, 0x10,0x0d,0x0b, 0x10,0x0f,0x0b,
  0x10,0x10,0x0b, 0x0f,0x10,0x0b, 0x0d,0x10,0x0b, 0x0c,0x10,0x0b,
  0x0b,0x10,0x0b, 0x0b,0x10,0x0c, 0x0b,0x10,0x0d, 0x0b,0x10,0x0f,
  0x0b,0x10,0x10, 0x0b,0x0f,0x10, 0x0b,0x0d,0x10, 0x0b,0x0c,0x10,
  0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00,
  0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00, 0x00,0x00,0x00
};


/****************************************************************
 * Video mode list
 ****************************************************************/

#define PAL(x) x, sizeof(x)
#define VPARAM(x) &video_param_table[x]

static struct vgamode_s vga_modes[] VAR16 = {
    //mode vparam        model bits  sstart     pelm  dac
    {0x00, VPARAM(0x17), CTEXT,   4, SEG_CTEXT, 0xFF, PAL(palette2)},
    {0x01, VPARAM(0x17), CTEXT,   4, SEG_CTEXT, 0xFF, PAL(palette2)},
    {0x02, VPARAM(0x18), CTEXT,   4, SEG_CTEXT, 0xFF, PAL(palette2)},
    {0x03, VPARAM(0x18), CTEXT,   4, SEG_CTEXT, 0xFF, PAL(palette2)},
    {0x04, VPARAM(0x04), CGA,     2, SEG_CTEXT, 0xFF, PAL(palette1)},
    {0x05, VPARAM(0x05), CGA,     2, SEG_CTEXT, 0xFF, PAL(palette1)},
    {0x06, VPARAM(0x06), CGA,     1, SEG_CTEXT, 0xFF, PAL(palette1)},
    {0x07, VPARAM(0x07), MTEXT,   4, SEG_MTEXT, 0xFF, PAL(palette0)},
    {0x0D, VPARAM(0x0d), PLANAR4, 4, SEG_GRAPH, 0xFF, PAL(palette1)},
    {0x0E, VPARAM(0x0e), PLANAR4, 4, SEG_GRAPH, 0xFF, PAL(palette1)},
    {0x0F, VPARAM(0x11), PLANAR1, 1, SEG_GRAPH, 0xFF, PAL(palette0)},
    {0x10, VPARAM(0x12), PLANAR4, 4, SEG_GRAPH, 0xFF, PAL(palette2)},
    {0x11, VPARAM(0x1a), PLANAR1, 1, SEG_GRAPH, 0xFF, PAL(palette2)},
    {0x12, VPARAM(0x1b), PLANAR4, 4, SEG_GRAPH, 0xFF, PAL(palette2)},
    {0x13, VPARAM(0x1c), LINEAR8, 8, SEG_GRAPH, 0xFF, PAL(palette3)},
    {0x6A, VPARAM(0x1d), PLANAR4, 4, SEG_GRAPH, 0xFF, PAL(palette2)},
};

struct vgamode_s *
find_vga_entry(u8 mode)
{
    int i;
    for (i = 0; i < ARRAY_SIZE(vga_modes); i++) {
        struct vgamode_s *vmode_g = &vga_modes[i];
        if (GET_GLOBAL(vmode_g->svgamode) == mode)
            return vmode_g;
    }
    return NULL;
}

// u16 video_save_pointer_table[14] VAR16;


/****************************************************************
 * Static functionality table
 ****************************************************************/

u8 static_functionality[0x10] VAR16 = {
 /* 0 */ 0xff,  // All modes supported #1
 /* 1 */ 0xe0,  // All modes supported #2
 /* 2 */ 0x0f,  // All modes supported #3
 /* 3 */ 0x00, 0x00, 0x00, 0x00,  // reserved
 /* 7 */ 0x07,  // 200, 350, 400 scan lines
 /* 8 */ 0x02,  // mamimum number of visible charsets in text mode
 /* 9 */ 0x08,  // total number of charset blocks in text mode
 /* a */ 0xe7,  // Change to add new functions
 /* b */ 0x0c,  // Change to add new functions
 /* c */ 0x00,  // reserved
 /* d */ 0x00,  // reserved
 /* e */ 0x00,  // Change to add new functions
 /* f */ 0x00   // reserved
};
