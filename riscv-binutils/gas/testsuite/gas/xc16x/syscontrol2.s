.text
xc16x_syscontrol2:
        extr #0x4
        extr #0x3
        extr #0x2
        extr #0x1

        atomic #0x4
        atomic #0x3
        atomic #0x2
        atomic #0x1

        extp r5,#0x4
        extp #0x3ff,#0x4
        extpr r5,#0x4
        extpr #0x3ff,#0x4

        exts r5,#0x4
        exts #0x1,#0x4

        extsr r5,#0x4
        extsr #0x1,#0x4




