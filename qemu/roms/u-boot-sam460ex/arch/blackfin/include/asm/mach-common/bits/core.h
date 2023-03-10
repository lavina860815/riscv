/*
 * Misc Core Masks
 */

#ifndef __BFIN_PERIPHERAL_CORE__
#define __BFIN_PERIPHERAL_CORE__

/*
 * EVT registers (ILAT, IMASK, and IPEND).
 */

#define EVT_EMU_P		0	/* Emulator interrupt bit position */
#define EVT_RST_P		1	/* Reset interrupt bit position */
#define EVT_NMI_P		2	/* Non Maskable interrupt bit position */
#define EVT_EVX_P		3	/* Exception bit position */
#define EVT_IRPTEN_P		4	/* Global interrupt enable bit position */
#define EVT_IVHW_P		5	/* Hardware Error interrupt bit position */
#define EVT_IVTMR_P		6	/* Timer interrupt bit position */
#define EVT_IVG7_P		7	/* IVG7 interrupt bit position */
#define EVT_IVG8_P		8	/* IVG8 interrupt bit position */
#define EVT_IVG9_P		9	/* IVG9 interrupt bit position */
#define EVT_IVG10_P		10	/* IVG10 interrupt bit position */
#define EVT_IVG11_P		11	/* IVG11 interrupt bit position */
#define EVT_IVG12_P		12	/* IVG12 interrupt bit position */
#define EVT_IVG13_P		13	/* IVG13 interrupt bit position */
#define EVT_IVG14_P		14	/* IVG14 interrupt bit position */
#define EVT_IVG15_P		15	/* IVG15 interrupt bit position */

#define EVT_EMU			MK_BMSK_(EVT_EMU_P   )	/* Emulator interrupt mask */
#define EVT_RST			MK_BMSK_(EVT_RST_P   )	/* Reset interrupt mask */
#define EVT_NMI			MK_BMSK_(EVT_NMI_P   )	/* Non Maskable interrupt mask */
#define EVT_EVX			MK_BMSK_(EVT_EVX_P   )	/* Exception mask */
#define EVT_IRPTEN		MK_BMSK_(EVT_IRPTEN_P)	/* Global interrupt enable mask */
#define EVT_IVHW		MK_BMSK_(EVT_IVHW_P  )	/* Hardware Error interrupt mask */
#define EVT_IVTMR		MK_BMSK_(EVT_IVTMR_P )	/* Timer interrupt mask */
#define EVT_IVG7		MK_BMSK_(EVT_IVG7_P  )	/* IVG7 interrupt mask */
#define EVT_IVG8		MK_BMSK_(EVT_IVG8_P  )	/* IVG8 interrupt mask */
#define EVT_IVG9		MK_BMSK_(EVT_IVG9_P  )	/* IVG9 interrupt mask */
#define EVT_IVG10		MK_BMSK_(EVT_IVG10_P )	/* IVG10 interrupt mask */
#define EVT_IVG11		MK_BMSK_(EVT_IVG11_P )	/* IVG11 interrupt mask */
#define EVT_IVG12		MK_BMSK_(EVT_IVG12_P )	/* IVG12 interrupt mask */
#define EVT_IVG13		MK_BMSK_(EVT_IVG13_P )	/* IVG13 interrupt mask */
#define EVT_IVG14		MK_BMSK_(EVT_IVG14_P )	/* IVG14 interrupt mask */
#define EVT_IVG15		MK_BMSK_(EVT_IVG15_P )	/* IVG15 interrupt mask */

/*
 * SEQSTAT register
 */

#define EXCAUSE_P	0	/* Last exception cause bit positions */
#define EXCAUSE0_P	0	/* Last exception cause bit 0 */
#define EXCAUSE1_P	1	/* Last exception cause bit 1 */
#define EXCAUSE2_P	2	/* Last exception cause bit 2 */
#define EXCAUSE3_P	3	/* Last exception cause bit 3 */
#define EXCAUSE4_P	4	/* Last exception cause bit 4 */
#define EXCAUSE5_P	5	/* Last exception cause bit 5 */
#define IDLE_REQ_P	12	/* Pending idle mode request, set by IDLE instruction */
#define SFTRESET_P	13	/* Indicates whether the last reset was a software reset (=1) */
#define HWERRCAUSE_P	14	/* Last hw error cause bit positions */
#define HWERRCAUSE0_P	14	/* Last hw error cause bit 0 */
#define HWERRCAUSE1_P	15	/* Last hw error cause bit 1 */
#define HWERRCAUSE2_P	16	/* Last hw error cause bit 2 */
#define HWERRCAUSE3_P	17	/* Last hw error cause bit 3 */
#define HWERRCAUSE4_P	18	/* Last hw error cause bit 4 */
#define HWERRCAUSE5_P	19	/* Last hw error cause bit 5 */
#define HWERRCAUSE6_P	20	/* Last hw error cause bit 6 */
#define HWERRCAUSE7_P	21	/* Last hw error cause bit 7 */

#define EXCAUSE \
	( MK_BMSK_(EXCAUSE0_P) | \
	  MK_BMSK_(EXCAUSE1_P) | \
	  MK_BMSK_(EXCAUSE2_P) | \
	  MK_BMSK_(EXCAUSE3_P) | \
	  MK_BMSK_(EXCAUSE4_P) | \
	  MK_BMSK_(EXCAUSE5_P) )
#define SFTRESET \
	( MK_BMSK_(SFTRESET_P) )
#define HWERRCAUSE \
	( MK_BMSK_(HWERRCAUSE0_P) | \
	  MK_BMSK_(HWERRCAUSE1_P) | \
	  MK_BMSK_(HWERRCAUSE2_P) | \
	  MK_BMSK_(HWERRCAUSE3_P) | \
	  MK_BMSK_(HWERRCAUSE4_P) )

/* SWRST Masks */
#define SYSTEM_RESET		0x0007		/* Initiates A System Software Reset */
#ifdef __ADSPBF561__
# define DOUBLE_FAULT_A		0x0008
# define DOUBLE_FAULT_B		0x0010
# define DOUBLE_FAULT		0x0018		/* Core [A|B] Double Fault Causes Reset */
# define RESET_DOUBLE_A		0x0800
# define RESET_DOUBLE_B		0x1000
# define RESET_DOUBLE		0x1800		/* SW Reset Generated By Core [A|B] Double-Fault */
# define RESET_WDOG_B		0x2000
# define RESET_WDOG_A		0x4000
# define RESET_WDOG		0x6000		/* SW Reset Generated By Watchdog [A|B] Timer */
#else
# define DOUBLE_FAULT		0x0008		/* Core Double Fault Causes Reset */
# define RESET_DOUBLE		0x2000		/* SW Reset Generated By Core Double-Fault */
# define RESET_WDOG		0x4000		/* SW Reset Generated By Watchdog Timer */
#endif
#define RESET_SOFTWARE		0x8000		/* SW Reset Occurred Since Last Read Of SWRST */

/* SYSCFG Masks */
#define SSSTEP			0x00000001	/* Supervisor Single Step */
#define CCEN			0x00000002	/* Cycle Counter Enable */
#define SNEN			0x00000004	/* Self-Nesting Interrupt Enable */
#define SYSCFG_SSSTEP_P	0
#define SYSCFG_CCEN_P	1
#define SYSCFG_SCEN_P	2

#endif
