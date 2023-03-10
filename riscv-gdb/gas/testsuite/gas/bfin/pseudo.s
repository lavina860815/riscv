	.text
	.global debug

debug:
	DBG R0;
	DBG R1;
	DBG R2;
	DBG R3;
	DBG R4;
	DBG R5;
	DBG R6;
	DBG R7;

	DBG P0;
	DBG P1;
	DBG P2;
	DBG P3;
	DBG P4;
	DBG P5;
	DBG SP;
	DBG FP;

	DBG I0;
	DBG I1;
	DBG I2;
	DBG I3;
	DBG M0;
	DBG M1;
	DBG M2;
	DBG M3;

	DBG B0;
	DBG B1;
	DBG B2;
	DBG B3;
	DBG L0;
	DBG L1;
	DBG L2;
	DBG L3;

	DBG A0.x;
	DBG A0.w;
	DBG A1.x;
	DBG A1.w;
	DBG ASTAT;
	DBG RETS;

	DBG LC0;
	DBG LT0;
	DBG LB0;
	DBG LC1;
	DBG LT1;
	DBG LB1;
	DBG CYCLES;
	DBG CYCLES2;

	DBG USP;
	DBG SEQSTAT;
	DBG SYSCFG;
	DBG RETI;
	DBG RETX;
	DBG RETN;
	DBG RETE;
	DBG EMUDAT;

	.global debug_assert
debug_assert:

	DBGA(R0.L, 0x0000);
	DBGA(R0.H, 0x0010);
	DBGA(R0.L, 0x0200);
	DBGA(R0.H, 0x3000);

	DBGA(R1.L, 0x0001);
	DBGA(R1.H, 0x1001);
	DBGA(R1.L, 0x8008);
	DBGA(R1.H, 0xC000);

	DBGA(R2.L, 1024);
	DBGA(R2.H, 2048);
	DBGA(R2.L, 4096);
	DBGA(R2.H, 8192);

	DBGA(R3.L, 65535);
	DBGA(R3.H, 32767);
	DBGA(R3.L, 16383);
	DBGA(R3.H,  8191);

	DBGA(P3.L, -1);
	DBGA(P3.H, -100);
	DBGA(P3.L, -1000);
	DBGA(P3.H, -8191);

