/*
 * Copyright 2016 Freescale Semiconductor, Inc.
 * Copyright 2017 NXP
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#ifndef __DT_BINDINGS_CLOCK_IMX8MQ_H
#define __DT_BINDINGS_CLOCK_IMX8MQ_H

#define IMX8MQ_CLK_DUMMY		0
#define IMX8MQ_CLK_32K			1
#define IMX8MQ_CLK_25M			2
#define IMX8MQ_CLK_27M			3
#define IMX8MQ_CLK_EXT1			4
#define IMX8MQ_CLK_EXT2			5
#define IMX8MQ_CLK_EXT3			6
#define IMX8MQ_CLK_EXT4			7

/* ANAMIX PLL clocks */
/* FRAC PLLs */
/* ARM PLL */
#define IMX8MQ_ARM_PLL_REF_SEL		8
#define IMX8MQ_ARM_PLL_REF_DIV		9
#define IMX8MQ_ARM_PLL			10
#define IMX8MQ_ARM_PLL_BYPASS		11
#define IMX8MQ_ARM_PLL_OUT		12

/* GPU PLL */
#define IMX8MQ_GPU_PLL_REF_SEL		13
#define IMX8MQ_GPU_PLL_REF_DIV		14
#define IMX8MQ_GPU_PLL			15
#define IMX8MQ_GPU_PLL_BYPASS		16
#define IMX8MQ_GPU_PLL_OUT		17

/* VPU PLL */
#define IMX8MQ_VPU_PLL_REF_SEL		18
#define IMX8MQ_VPU_PLL_REF_DIV		19
#define IMX8MQ_VPU_PLL			20
#define IMX8MQ_VPU_PLL_BYPASS		21
#define IMX8MQ_VPU_PLL_OUT		22

/* AUDIO PLL1 */
#define IMX8MQ_AUDIO_PLL1_REF_SEL	23
#define IMX8MQ_AUDIO_PLL1_REF_DIV	24
#define IMX8MQ_AUDIO_PLL1		25
#define IMX8MQ_AUDIO_PLL1_BYPASS	26
#define IMX8MQ_AUDIO_PLL1_OUT		27

/* AUDIO PLL2 */
#define IMX8MQ_AUDIO_PLL2_REF_SEL	28
#define IMX8MQ_AUDIO_PLL2_REF_DIV	29
#define IMX8MQ_AUDIO_PLL2		30
#define IMX8MQ_AUDIO_PLL2_BYPASS	31
#define IMX8MQ_AUDIO_PLL2_OUT		32

/* VIDEO PLL1 */
#define IMX8MQ_VIDEO_PLL1_REF_SEL	33
#define IMX8MQ_VIDEO_PLL1_REF_DIV	34
#define IMX8MQ_VIDEO_PLL1		35
#define IMX8MQ_VIDEO_PLL1_BYPASS	36
#define IMX8MQ_VIDEO_PLL1_OUT		37

/* SYS1 PLL */
#define IMX8MQ_SYS1_PLL1_REF_SEL	38
#define IMX8MQ_SYS1_PLL1_REF_DIV	39
#define IMX8MQ_SYS1_PLL1		40
#define IMX8MQ_SYS1_PLL1_OUT		41
#define IMX8MQ_SYS1_PLL1_OUT_DIV	42
#define IMX8MQ_SYS1_PLL2		43
#define IMX8MQ_SYS1_PLL2_DIV		44
#define IMX8MQ_SYS1_PLL2_OUT		45

/* SYS2 PLL */
#define IMX8MQ_SYS2_PLL1_REF_SEL	46
#define IMX8MQ_SYS2_PLL1_REF_DIV	47
#define IMX8MQ_SYS2_PLL1		48
#define IMX8MQ_SYS2_PLL1_OUT		49
#define IMX8MQ_SYS2_PLL1_OUT_DIV	50
#define IMX8MQ_SYS2_PLL2		51
#define IMX8MQ_SYS2_PLL2_DIV		52
#define IMX8MQ_SYS2_PLL2_OUT		53

/* SYS3 PLL */
#define IMX8MQ_SYS3_PLL1_REF_SEL	54
#define IMX8MQ_SYS3_PLL1_REF_DIV	55
#define IMX8MQ_SYS3_PLL1		56
#define IMX8MQ_SYS3_PLL1_OUT		57
#define IMX8MQ_SYS3_PLL1_OUT_DIV	58
#define IMX8MQ_SYS3_PLL2		59
#define IMX8MQ_SYS3_PLL2_DIV		60
#define IMX8MQ_SYS3_PLL2_OUT		61

/* DRAM PLL */
#define IMX8MQ_DRAM_PLL1_REF_SEL	62
#define IMX8MQ_DRAM_PLL1_REF_DIV	63
#define IMX8MQ_DRAM_PLL1		64
#define IMX8MQ_DRAM_PLL1_OUT		65
#define IMX8MQ_DRAM_PLL1_OUT_DIV	66
#define IMX8MQ_DRAM_PLL2		67
#define IMX8MQ_DRAM_PLL2_DIV		68
#define IMX8MQ_DRAM_PLL2_OUT		69

/* SYS PLL DIV */
#define IMX8MQ_SYS1_PLL_40M		70
#define IMX8MQ_SYS1_PLL_80M		71
#define IMX8MQ_SYS1_PLL_100M		72
#define IMX8MQ_SYS1_PLL_133M		73
#define IMX8MQ_SYS1_PLL_160M		74
#define IMX8MQ_SYS1_PLL_200M		75
#define IMX8MQ_SYS1_PLL_266M		76
#define IMX8MQ_SYS1_PLL_400M		77
#define IMX8MQ_SYS1_PLL_800M		78

#define IMX8MQ_SYS2_PLL_50M		79
#define IMX8MQ_SYS2_PLL_100M		80
#define IMX8MQ_SYS2_PLL_125M		81
#define IMX8MQ_SYS2_PLL_166M		82
#define IMX8MQ_SYS2_PLL_200M		83
#define IMX8MQ_SYS2_PLL_250M		84
#define IMX8MQ_SYS2_PLL_333M		85
#define IMX8MQ_SYS2_PLL_500M		86
#define IMX8MQ_SYS2_PLL_1000M		87

/* CCM ROOT clocks */
/* A53 */
#define IMX8MQ_CLK_A53_SRC		88
#define IMX8MQ_CLK_A53_CG		89
#define IMX8MQ_CLK_A53_DIV		90
/* M4 */
#define IMX8MQ_CLK_M4_SRC		91
#define IMX8MQ_CLK_M4_CG		92
#define IMX8MQ_CLK_M4_DIV		93
/* VPU */
#define IMX8MQ_CLK_VPU_SRC		94
#define IMX8MQ_CLK_VPU_CG		95
#define IMX8MQ_CLK_VPU_DIV		96
/* GPU CORE */
#define IMX8MQ_CLK_GPU_CORE_SRC		97
#define IMX8MQ_CLK_GPU_CORE_CG		98
#define IMX8MQ_CLK_GPU_CORE_DIV		99
/* GPU SHADER */
#define IMX8MQ_CLK_GPU_SHADER_SRC	100
#define IMX8MQ_CLK_GPU_SHADER_CG	101
#define IMX8MQ_CLK_GPU_SHADER_DIV	102

/* BUS TYPE */
/* MAIN AXI */
#define IMX8MQ_CLK_MAIN_AXI_SRC		103
#define IMX8MQ_CLK_MAIN_AXI_CG		104
#define IMX8MQ_CLK_MAIN_AXI_PRE_DIV	105
#define IMX8MQ_CLK_MAIN_AXI_DIV		106
/* ENET AXI */
#define IMX8MQ_CLK_ENET_AXI_SRC		107
#define IMX8MQ_CLK_ENET_AXI_CG		108
#define IMX8MQ_CLK_ENET_AXI_PRE_DIV	109
#define IMX8MQ_CLK_ENET_AXI_DIV		110
/* NAND_USDHC_BUS */
#define IMX8MQ_CLK_NAND_USDHC_BUS_SRC		111
#define IMX8MQ_CLK_NAND_USDHC_BUS_CG		112
#define IMX8MQ_CLK_NAND_USDHC_BUS_PRE_DIV	113
#define IMX8MQ_CLK_NAND_USDHC_BUS_DIV		114
/* VPU BUS */
#define IMX8MQ_CLK_VPU_BUS_SRC			115
#define IMX8MQ_CLK_VPU_BUS_CG			116
#define IMX8MQ_CLK_VPU_BUS_PRE_DIV		117
#define IMX8MQ_CLK_VPU_BUS_DIV			118
/* DISP_AXI */
#define IMX8MQ_CLK_DISP_AXI_SRC			119
#define IMX8MQ_CLK_DISP_AXI_CG			120
#define IMX8MQ_CLK_DISP_AXI_PRE_DIV		121
#define IMX8MQ_CLK_DISP_AXI_DIV			122
/* DISP APB */
#define IMX8MQ_CLK_DISP_APB_SRC			123
#define IMX8MQ_CLK_DISP_APB_CG			124
#define IMX8MQ_CLK_DISP_APB_PRE_DIV		125
#define IMX8MQ_CLK_DISP_APB_DIV			126
/* DISP RTRM */
#define IMX8MQ_CLK_DISP_RTRM_SRC		127
#define IMX8MQ_CLK_DISP_RTRM_CG			128
#define IMX8MQ_CLK_DISP_RTRM_PRE_DIV		129
#define IMX8MQ_CLK_DISP_RTRM_DIV		130
/* USB_BUS */
#define IMX8MQ_CLK_USB_BUS_SRC			131
#define IMX8MQ_CLK_USB_BUS_CG			132
#define IMX8MQ_CLK_USB_BUS_PRE_DIV		133
#define IMX8MQ_CLK_USB_BUS_DIV			134
/* GPU_AXI */
#define IMX8MQ_CLK_GPU_AXI_SRC			135
#define IMX8MQ_CLK_GPU_AXI_CG			136
#define IMX8MQ_CLK_GPU_AXI_PRE_DIV		137
#define IMX8MQ_CLK_GPU_AXI_DIV			138
/* GPU_AHB */
#define IMX8MQ_CLK_GPU_AHB_SRC			139
#define IMX8MQ_CLK_GPU_AHB_CG			140
#define IMX8MQ_CLK_GPU_AHB_PRE_DIV		141
#define IMX8MQ_CLK_GPU_AHB_DIV			142
/* NOC */
#define IMX8MQ_CLK_NOC_SRC			143
#define IMX8MQ_CLK_NOC_CG			144
#define IMX8MQ_CLK_NOC_PRE_DIV			145
#define IMX8MQ_CLK_NOC_DIV			146
/* NOC_APB */
#define IMX8MQ_CLK_NOC_APB_SRC			147
#define IMX8MQ_CLK_NOC_APB_CG			148
#define IMX8MQ_CLK_NOC_APB_PRE_DIV		149
#define IMX8MQ_CLK_NOC_APB_DIV			150

/* AHB */
#define IMX8MQ_CLK_AHB_SRC			151
#define IMX8MQ_CLK_AHB_CG			152
#define IMX8MQ_CLK_AHB_PRE_DIV			153
#define IMX8MQ_CLK_AHB_DIV			154
/* AUDIO AHB */
#define IMX8MQ_CLK_AUDIO_AHB_SRC		155
#define IMX8MQ_CLK_AUDIO_AHB_CG			156
#define IMX8MQ_CLK_AUDIO_AHB_PRE_DIV		157
#define IMX8MQ_CLK_AUDIO_AHB_DIV		158

/* DRAM_ALT */
#define IMX8MQ_CLK_DRAM_ALT_SRC			159
#define IMX8MQ_CLK_DRAM_ALT_CG			160
#define IMX8MQ_CLK_DRAM_ALT_PRE_DIV		161
#define IMX8MQ_CLK_DRAM_ALT_DIV			162
/* DRAM APB */
#define IMX8MQ_CLK_DRAM_APB_SRC			163
#define IMX8MQ_CLK_DRAM_APB_CG			164
#define IMX8MQ_CLK_DRAM_APB_PRE_DIV		165
#define IMX8MQ_CLK_DRAM_APB_DIV			166
/* VPU_G1 */
#define IMX8MQ_CLK_VPU_G1_SRC			167
#define IMX8MQ_CLK_VPU_G1_CG			168
#define IMX8MQ_CLK_VPU_G1_PRE_DIV		169
#define IMX8MQ_CLK_VPU_G1_DIV			170
/* VPU_G2 */
#define IMX8MQ_CLK_VPU_G2_SRC			171
#define IMX8MQ_CLK_VPU_G2_CG			172
#define IMX8MQ_CLK_VPU_G2_PRE_DIV		173
#define IMX8MQ_CLK_VPU_G2_DIV			174
/* DISP_DTRC */
#define IMX8MQ_CLK_DISP_DTRC_SRC		175
#define IMX8MQ_CLK_DISP_DTRC_CG			176
#define IMX8MQ_CLK_DISP_DTRC_PRE_DIV		177
#define IMX8MQ_CLK_DISP_DTRC_DIV		178
/* DISP_DC8000 */
#define IMX8MQ_CLK_DISP_DC8000_SRC		179
#define IMX8MQ_CLK_DISP_DC8000_CG		180
#define IMX8MQ_CLK_DISP_DC8000_PRE_DIV		181
#define IMX8MQ_CLK_DISP_DC8000_DIV		182
/* PCIE_CTRL */
#define IMX8MQ_CLK_PCIE1_CTRL_SRC		183
#define IMX8MQ_CLK_PCIE1_CTRL_CG		184
#define IMX8MQ_CLK_PCIE1_CTRL_PRE_DIV		185
#define IMX8MQ_CLK_PCIE1_CTRL_DIV		186
/* PCIE_PHY */
#define IMX8MQ_CLK_PCIE1_PHY_SRC		187
#define IMX8MQ_CLK_PCIE1_PHY_CG			188
#define IMX8MQ_CLK_PCIE1_PHY_PRE_DIV		189
#define IMX8MQ_CLK_PCIE1_PHY_DIV		190
/* PCIE_AUX */
#define IMX8MQ_CLK_PCIE1_AUX_SRC		191
#define IMX8MQ_CLK_PCIE1_AUX_CG			192
#define IMX8MQ_CLK_PCIE1_AUX_PRE_DIV		193
#define IMX8MQ_CLK_PCIE1_AUX_DIV		194
/* DC_PIXEL */
#define IMX8MQ_CLK_DC_PIXEL_SRC			195
#define IMX8MQ_CLK_DC_PIXEL_CG			196
#define IMX8MQ_CLK_DC_PIXEL_PRE_DIV		197
#define IMX8MQ_CLK_DC_PIXEL_DIV			198
/* LCDIF_PIXEL */
#define IMX8MQ_CLK_LCDIF_PIXEL_SRC		199
#define IMX8MQ_CLK_LCDIF_PIXEL_CG		200
#define IMX8MQ_CLK_LCDIF_PIXEL_PRE_DIV		201
#define IMX8MQ_CLK_LCDIF_PIXEL_DIV		202
/* SAI1~6 */
#define IMX8MQ_CLK_SAI1_SRC			203
#define IMX8MQ_CLK_SAI1_CG			204
#define IMX8MQ_CLK_SAI1_PRE_DIV			205
#define IMX8MQ_CLK_SAI1_DIV			206

#define IMX8MQ_CLK_SAI2_SRC			207
#define IMX8MQ_CLK_SAI2_CG			208
#define IMX8MQ_CLK_SAI2_PRE_DIV			209
#define IMX8MQ_CLK_SAI2_DIV			210

#define IMX8MQ_CLK_SAI3_SRC			211
#define IMX8MQ_CLK_SAI3_CG			212
#define IMX8MQ_CLK_SAI3_PRE_DIV			213
#define IMX8MQ_CLK_SAI3_DIV			214

#define IMX8MQ_CLK_SAI4_SRC			215
#define IMX8MQ_CLK_SAI4_CG			216
#define IMX8MQ_CLK_SAI4_PRE_DIV			217
#define IMX8MQ_CLK_SAI4_DIV			218

#define IMX8MQ_CLK_SAI5_SRC			219
#define IMX8MQ_CLK_SAI5_CG			220
#define IMX8MQ_CLK_SAI5_PRE_DIV			221
#define IMX8MQ_CLK_SAI5_DIV			222

#define IMX8MQ_CLK_SAI6_SRC			223
#define IMX8MQ_CLK_SAI6_CG			224
#define IMX8MQ_CLK_SAI6_PRE_DIV			225
#define IMX8MQ_CLK_SAI6_DIV			226
/* SPDIF1 */
#define IMX8MQ_CLK_SPDIF1_SRC			227
#define IMX8MQ_CLK_SPDIF1_CG			228
#define IMX8MQ_CLK_SPDIF1_PRE_DIV		229
#define IMX8MQ_CLK_SPDIF1_DIV			230
/* SPDIF2 */
#define IMX8MQ_CLK_SPDIF2_SRC			231
#define IMX8MQ_CLK_SPDIF2_CG			232
#define IMX8MQ_CLK_SPDIF2_PRE_DIV		233
#define IMX8MQ_CLK_SPDIF2_DIV			234
/* ENET_REF */
#define IMX8MQ_CLK_ENET_REF_SRC			235
#define IMX8MQ_CLK_ENET_REF_CG			236
#define IMX8MQ_CLK_ENET_REF_PRE_DIV		237
#define IMX8MQ_CLK_ENET_REF_DIV			238
/* ENET_TIMER */
#define IMX8MQ_CLK_ENET_TIMER_SRC		239
#define IMX8MQ_CLK_ENET_TIMER_CG		240
#define IMX8MQ_CLK_ENET_TIMER_PRE_DIV		241
#define IMX8MQ_CLK_ENET_TIMER_DIV		242
/* ENET_PHY */
#define IMX8MQ_CLK_ENET_PHY_REF_SRC		243
#define IMX8MQ_CLK_ENET_PHY_REF_CG		244
#define IMX8MQ_CLK_ENET_PHY_REF_PRE_DIV		245
#define IMX8MQ_CLK_ENET_PHY_REF_DIV		246
/* NAND */
#define IMX8MQ_CLK_NAND_SRC			247
#define IMX8MQ_CLK_NAND_CG			248
#define IMX8MQ_CLK_NAND_PRE_DIV			249
#define IMX8MQ_CLK_NAND_DIV			250
/* QSPI */
#define IMX8MQ_CLK_QSPI_SRC			251
#define IMX8MQ_CLK_QSPI_CG			252
#define IMX8MQ_CLK_QSPI_PRE_DIV			253
#define IMX8MQ_CLK_QSPI_DIV			254
/* USDHC1 */
#define IMX8MQ_CLK_USDHC1_SRC			255
#define IMX8MQ_CLK_USDHC1_CG			256
#define IMX8MQ_CLK_USDHC1_PRE_DIV		257
#define IMX8MQ_CLK_USDHC1_DIV			258
/* USDHC2 */
#define IMX8MQ_CLK_USDHC2_SRC			259
#define IMX8MQ_CLK_USDHC2_CG			260
#define IMX8MQ_CLK_USDHC2_PRE_DIV		261
#define IMX8MQ_CLK_USDHC2_DIV			262
/* I2C1 */
#define IMX8MQ_CLK_I2C1_SRC			263
#define IMX8MQ_CLK_I2C1_CG			264
#define IMX8MQ_CLK_I2C1_PRE_DIV			265
#define IMX8MQ_CLK_I2C1_DIV			266
/* I2C2 */
#define IMX8MQ_CLK_I2C2_SRC			267
#define IMX8MQ_CLK_I2C2_CG			268
#define IMX8MQ_CLK_I2C2_PRE_DIV			269
#define IMX8MQ_CLK_I2C2_DIV			270
/* I2C3 */
#define IMX8MQ_CLK_I2C3_SRC			271
#define IMX8MQ_CLK_I2C3_CG			272
#define IMX8MQ_CLK_I2C3_PRE_DIV			273
#define IMX8MQ_CLK_I2C3_DIV			274
/* I2C4 */
#define IMX8MQ_CLK_I2C4_SRC			275
#define IMX8MQ_CLK_I2C4_CG			276
#define IMX8MQ_CLK_I2C4_PRE_DIV			277
#define IMX8MQ_CLK_I2C4_DIV			278
/* UART1 */
#define IMX8MQ_CLK_UART1_SRC			279
#define IMX8MQ_CLK_UART1_CG			280
#define IMX8MQ_CLK_UART1_PRE_DIV		281
#define IMX8MQ_CLK_UART1_DIV			282
/* UART2 */
#define IMX8MQ_CLK_UART2_SRC			283
#define IMX8MQ_CLK_UART2_CG			284
#define IMX8MQ_CLK_UART2_PRE_DIV		285
#define IMX8MQ_CLK_UART2_DIV			286
/* UART3 */
#define IMX8MQ_CLK_UART3_SRC			287
#define IMX8MQ_CLK_UART3_CG			288
#define IMX8MQ_CLK_UART3_PRE_DIV		289
#define IMX8MQ_CLK_UART3_DIV			290
/* UART4 */
#define IMX8MQ_CLK_UART4_SRC			291
#define IMX8MQ_CLK_UART4_CG			292
#define IMX8MQ_CLK_UART4_PRE_DIV		293
#define IMX8MQ_CLK_UART4_DIV			294
/* USB_CORE_REF */
#define IMX8MQ_CLK_USB_CORE_REF_SRC		295
#define IMX8MQ_CLK_USB_CORE_REF_CG		296
#define IMX8MQ_CLK_USB_CORE_REF_PRE_DIV		297
#define IMX8MQ_CLK_USB_CORE_REF_DIV		298
/* USB_PHY_REF */
#define IMX8MQ_CLK_USB_PHY_REF_SRC		299
#define IMX8MQ_CLK_USB_PHY_REF_CG		300
#define IMX8MQ_CLK_USB_PHY_REF_PRE_DIV		301
#define IMX8MQ_CLK_USB_PHY_REF_DIV		302
/* ECSPI1 */
#define IMX8MQ_CLK_ECSPI1_SRC			303
#define IMX8MQ_CLK_ECSPI1_CG			304
#define IMX8MQ_CLK_ECSPI1_PRE_DIV		305
#define IMX8MQ_CLK_ECSPI1_DIV			306
/* ECSPI2 */
#define IMX8MQ_CLK_ECSPI2_SRC			307
#define IMX8MQ_CLK_ECSPI2_CG			308
#define IMX8MQ_CLK_ECSPI2_PRE_DIV		309
#define IMX8MQ_CLK_ECSPI2_DIV			310
/* PWM1 */
#define IMX8MQ_CLK_PWM1_SRC			311
#define IMX8MQ_CLK_PWM1_CG			312
#define IMX8MQ_CLK_PWM1_PRE_DIV			313
#define IMX8MQ_CLK_PWM1_DIV			314
/* PWM2 */
#define IMX8MQ_CLK_PWM2_SRC			315
#define IMX8MQ_CLK_PWM2_CG			316
#define IMX8MQ_CLK_PWM2_PRE_DIV			317
#define IMX8MQ_CLK_PWM2_DIV			318
/* PWM3 */
#define IMX8MQ_CLK_PWM3_SRC			319
#define IMX8MQ_CLK_PWM3_CG			320
#define IMX8MQ_CLK_PWM3_PRE_DIV			321
#define IMX8MQ_CLK_PWM3_DIV			322
/* PWM4 */
#define IMX8MQ_CLK_PWM4_SRC			323
#define IMX8MQ_CLK_PWM4_CG			324
#define IMX8MQ_CLK_PWM4_PRE_DIV			325
#define IMX8MQ_CLK_PWM4_DIV			326
/* GPT1 */
#define IMX8MQ_CLK_GPT1_SRC			327
#define IMX8MQ_CLK_GPT1_CG			328
#define IMX8MQ_CLK_GPT1_PRE_DIV			329
#define IMX8MQ_CLK_GPT1_DIV			330
/* WDOG */
#define IMX8MQ_CLK_WDOG_SRC			331
#define IMX8MQ_CLK_WDOG_CG			332
#define IMX8MQ_CLK_WDOG_PRE_DIV			333
#define IMX8MQ_CLK_WDOG_DIV			334
/* WRCLK */
#define IMX8MQ_CLK_WRCLK_SRC			335
#define IMX8MQ_CLK_WRCLK_CG			336
#define IMX8MQ_CLK_WRCLK_PRE_DIV		337
#define IMX8MQ_CLK_WRCLK_DIV			338
/* DSI_CORE */
#define IMX8MQ_CLK_DSI_CORE_SRC			339
#define IMX8MQ_CLK_DSI_CORE_CG			340
#define IMX8MQ_CLK_DSI_CORE_PRE_DIV		341
#define IMX8MQ_CLK_DSI_CORE_DIV			342
/* DSI_PHY */
#define IMX8MQ_CLK_DSI_PHY_REF_SRC		343
#define IMX8MQ_CLK_DSI_PHY_REF_CG		344
#define IMX8MQ_CLK_DSI_PHY_REF_PRE_DIV		345
#define IMX8MQ_CLK_DSI_PHY_REF_DIV		346
/* DSI_DBI */
#define IMX8MQ_CLK_DSI_DBI_SRC			347
#define IMX8MQ_CLK_DSI_DBI_CG			348
#define IMX8MQ_CLK_DSI_DBI_PRE_DIV		349
#define IMX8MQ_CLK_DSI_DBI_DIV			350
/*DSI_ESC */
#define IMX8MQ_CLK_DSI_ESC_SRC			351
#define IMX8MQ_CLK_DSI_ESC_CG			352
#define IMX8MQ_CLK_DSI_ESC_PRE_DIV		353
#define IMX8MQ_CLK_DSI_ESC_DIV			354
/* CSI1_CORE */
#define IMX8MQ_CLK_CSI1_CORE_SRC		355
#define IMX8MQ_CLK_CSI1_CORE_CG			356
#define  IMX8MQ_CLK_CSI1_CORE_PRE_DIV		357
#define IMX8MQ_CLK_CSI1_CORE_DIV		358
/* CSI1_PHY */
#define IMX8MQ_CLK_CSI1_PHY_REF_SRC		359
#define IMX8MQ_CLK_CSI1_PHY_REF_CG		360
#define IMX8MQ_CLK_CSI1_PHY_REF_PRE_DIV		361
#define IMX8MQ_CLK_CSI1_PHY_REF_DIV		362
/* CSI_ESC */
#define IMX8MQ_CLK_CSI1_ESC_SRC			363
#define IMX8MQ_CLK_CSI1_ESC_CG			364
#define IMX8MQ_CLK_CSI1_ESC_PRE_DIV		365
#define IMX8MQ_CLK_CSI1_ESC_DIV			366
/* CSI2_CORE */
#define IMX8MQ_CLK_CSI2_CORE_SRC		367
#define IMX8MQ_CLK_CSI2_CORE_CG			368
#define IMX8MQ_CLK_CSI2_CORE_PRE_DIV		369
#define IMX8MQ_CLK_CSI2_CORE_DIV		370
/* CSI2_PHY */
#define IMX8MQ_CLK_CSI2_PHY_REF_SRC		371
#define IMX8MQ_CLK_CSI2_PHY_REF_CG		372
#define IMX8MQ_CLK_CSI2_PHY_REF_PRE_DIV		373
#define IMX8MQ_CLK_CSI2_PHY_REF_DIV		374
/* CSI2_ESC */
#define IMX8MQ_CLK_CSI2_ESC_SRC			375
#define IMX8MQ_CLK_CSI2_ESC_CG			376
#define IMX8MQ_CLK_CSI2_ESC_PRE_DIV		377
#define IMX8MQ_CLK_CSI2_ESC_DIV			378
/* PCIE2_CTRL */
#define IMX8MQ_CLK_PCIE2_CTRL_SRC		379
#define IMX8MQ_CLK_PCIE2_CTRL_CG		380
#define IMX8MQ_CLK_PCIE2_CTRL_PRE_DIV		381
#define IMX8MQ_CLK_PCIE2_CTRL_DIV		382
/* PCIE2_PHY */
#define IMX8MQ_CLK_PCIE2_PHY_SRC		383
#define IMX8MQ_CLK_PCIE2_PHY_CG			384
#define IMX8MQ_CLK_PCIE2_PHY_PRE_DIV		385
#define IMX8MQ_CLK_PCIE2_PHY_DIV		386
/* PCIE2_AUX */
#define IMX8MQ_CLK_PCIE2_AUX_SRC		387
#define IMX8MQ_CLK_PCIE2_AUX_CG			388
#define IMX8MQ_CLK_PCIE2_AUX_PRE_DIV		389
#define IMX8MQ_CLK_PCIE2_AUX_DIV		390
/* ECSPI3 */
#define IMX8MQ_CLK_ECSPI3_SRC			391
#define IMX8MQ_CLK_ECSPI3_CG			392
#define IMX8MQ_CLK_ECSPI3_PRE_DIV		393
#define IMX8MQ_CLK_ECSPI3_DIV			394

/* CCGR clocks */
#define IMX8MQ_CLK_A53_ROOT			395
#define IMX8MQ_CLK_DRAM_ROOT			396
#define IMX8MQ_CLK_ECSPI1_ROOT			397
#define IMX8MQ_CLK_ECSPI2_ROOT			398
#define IMX8MQ_CLK_ECSPI3_ROOT			399
#define IMX8MQ_CLK_ENET1_ROOT			400
#define IMX8MQ_CLK_GPT1_ROOT			401
#define IMX8MQ_CLK_I2C1_ROOT			402
#define IMX8MQ_CLK_I2C2_ROOT			403
#define IMX8MQ_CLK_I2C3_ROOT			404
#define IMX8MQ_CLK_I2C4_ROOT			405
#define IMX8MQ_CLK_M4_ROOT			406
#define IMX8MQ_CLK_PCIE1_ROOT			407
#define IMX8MQ_CLK_PCIE2_ROOT			408
#define IMX8MQ_CLK_PWM1_ROOT			409
#define IMX8MQ_CLK_PWM2_ROOT			410
#define IMX8MQ_CLK_PWM3_ROOT			411
#define IMX8MQ_CLK_PWM4_ROOT			412
#define IMX8MQ_CLK_QSPI_ROOT			413
#define IMX8MQ_CLK_SAI1_ROOT			414
#define IMX8MQ_CLK_SAI2_ROOT			415
#define IMX8MQ_CLK_SAI3_ROOT			416
#define IMX8MQ_CLK_SAI4_ROOT			417
#define IMX8MQ_CLK_SAI5_ROOT			418
#define IMX8MQ_CLK_SAI6_ROOT			419
#define IMX8MQ_CLK_UART1_ROOT			420
#define IMX8MQ_CLK_UART2_ROOT			421
#define IMX8MQ_CLK_UART3_ROOT			422
#define IMX8MQ_CLK_UART4_ROOT			423
#define IMX8MQ_CLK_USB1_CTRL_ROOT		424
#define IMX8MQ_CLK_USB2_CTRL_ROOT		425
#define IMX8MQ_CLK_USB1_PHY_ROOT		426
#define IMX8MQ_CLK_USB2_PHY_ROOT		427
#define IMX8MQ_CLK_USDHC1_ROOT			428
#define IMX8MQ_CLK_USDHC2_ROOT			429
#define IMX8MQ_CLK_WDOG1_ROOT			430
#define IMX8MQ_CLK_WDOG2_ROOT			431
#define IMX8MQ_CLK_WDOG3_ROOT			432
#define IMX8MQ_CLK_GPU_ROOT			433
#define IMX8MQ_CLK_HEVC_ROOT			434
#define IMX8MQ_CLK_AVC_ROOT			435
#define IMX8MQ_CLK_VP9_ROOT			436
#define IMX8MQ_CLK_HEVC_INTER_ROOT		437
#define IMX8MQ_CLK_DISP_ROOT			438
#define IMX8MQ_CLK_HDMI_ROOT			439
#define IMX8MQ_CLK_HDMI_PHY_ROOT		440
#define IMX8MQ_CLK_VPU_DEC_ROOT			441
#define IMX8MQ_CLK_CSI1_ROOT			442
#define IMX8MQ_CLK_CSI2_ROOT			443
#define IMX8MQ_CLK_RAWNAND_ROOT			444
#define IMX8MQ_CLK_SDMA1_ROOT			445
#define IMX8MQ_CLK_SDMA2_ROOT			446
#define IMX8MQ_CLK_VPU_G1_ROOT			447
#define IMX8MQ_CLK_VPU_G2_ROOT			448

/* SCCG PLL GATE */
#define IMX8MQ_SYS1_PLL_OUT			449
#define IMX8MQ_SYS2_PLL_OUT			450
#define IMX8MQ_SYS3_PLL_OUT			451
#define IMX8MQ_DRAM_PLL_OUT			452

#define IMX8MQ_GPT_3M_CLK			453

#define IMX8MQ_CLK_IPG_ROOT			454
#define IMX8MQ_CLK_IPG_AUDIO_ROOT		455
#define IMX8MQ_CLK_SAI1_IPG			456
#define IMX8MQ_CLK_SAI2_IPG			457
#define IMX8MQ_CLK_SAI3_IPG			458
#define IMX8MQ_CLK_SAI4_IPG			459
#define IMX8MQ_CLK_SAI5_IPG			460
#define IMX8MQ_CLK_SAI6_IPG			461

/* DSI AHB/IPG clocks */
/* rxesc clock */
#define IMX8MQ_CLK_DSI_AHB_SRC                  462
#define IMX8MQ_CLK_DSI_AHB_CG                   463
#define IMX8MQ_CLK_DSI_AHB_PRE_DIV              464
#define IMX8MQ_CLK_DSI_AHB_DIV                  465
/* txesc clock */
#define IMX8MQ_CLK_DSI_IPG_DIV                  466

/* VIDEO2 PLL */
#define IMX8MQ_VIDEO2_PLL1_REF_SEL		467
#define IMX8MQ_VIDEO2_PLL1_REF_DIV		468
#define IMX8MQ_VIDEO2_PLL1			469
#define IMX8MQ_VIDEO2_PLL1_OUT			470
#define IMX8MQ_VIDEO2_PLL1_OUT_DIV		471
#define IMX8MQ_VIDEO2_PLL2			472
#define IMX8MQ_VIDEO2_PLL2_DIV			473
#define IMX8MQ_VIDEO2_PLL2_OUT			474
#define IMX8MQ_CLK_TMU_ROOT			475

#define IMX8MQ_CLK_END				476
#endif /* __DT_BINDINGS_CLOCK_IMX8MQ_H */
