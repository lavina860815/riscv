/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright (c) 2016 Toradex, Inc.
 */

#ifndef _TDX_CFG_BLOCK_H
#define _TDX_CFG_BLOCK_H

#include "tdx-common.h"

struct toradex_hw {
	u16 ver_major;
	u16 ver_minor;
	u16 ver_assembly;
	u16 prodid;
};

struct toradex_eth_addr {
	u32 oui:24;
	u32 nic:24;
} __attribute__((__packed__));

enum {
	COLIBRI_PXA270_V1_312MHZ = 1,
	COLIBRI_PXA270_V1_520MHZ,
	COLIBRI_PXA320,
	COLIBRI_PXA300,
	COLIBRI_PXA310,
	COLIBRI_PXA320_IT,
	COLIBRI_PXA300_XT,
	COLIBRI_PXA270_312MHZ,
	COLIBRI_PXA270_520MHZ,
	COLIBRI_VF50, /* not currently on sale */
	COLIBRI_VF61,
	COLIBRI_VF61_IT,
	COLIBRI_VF50_IT,
	COLIBRI_IMX6S,
	COLIBRI_IMX6DL,
	COLIBRI_IMX6S_IT,
	COLIBRI_IMX6DL_IT,
	COLIBRI_T20_256MB = 20,
	COLIBRI_T20_512MB,
	COLIBRI_T20_512MB_IT,
	COLIBRI_T30,
	COLIBRI_T20_256MB_IT,
	APALIS_T30_2GB,
	APALIS_T30_1GB,
	APALIS_IMX6Q,
	APALIS_IMX6Q_IT,
	APALIS_IMX6D,
	COLIBRI_T30_IT,
	APALIS_T30_IT,
	COLIBRI_IMX7S,
	COLIBRI_IMX7D,
	APALIS_TK1_2GB,
	APALIS_IMX6D_IT,
	COLIBRI_IMX6ULL,
	APALIS_IMX8QM, /* 37 */
	COLIBRI_IMX8X,
	COLIBRI_IMX7D_EMMC,
	COLIBRI_IMX6ULL_WIFI_BT_IT, /* 40 */
	COLIBRI_IMX7D_EPDC,
	APALIS_TK1_4GB,
};

extern const char * const toradex_modules[];
extern bool valid_cfgblock;
extern struct toradex_hw tdx_hw_tag;
extern struct toradex_eth_addr tdx_eth_addr;
extern u32 tdx_serial;

int read_tdx_cfg_block(void);

#endif /* _TDX_CFG_BLOCK_H */
