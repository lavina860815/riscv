/* Copyright 2013-2015 IBM Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef __NPU_REGS_H
#define __NPU_REGS_H

/* Size of a single link */
#define NPU_LINK_SIZE			0x40

/* Link registers */
#define NX_PB_ERR_RPT_0			0x00
#define NX_PB_ERR_RPT_1			0x01
#define NX_MMIO_BAR_0			0x02
#define NX_MMIO_BAR_1			0x03
#define   NX_MMIO_BAR_BASE		PPC_BITMASK(14,51)
#define   NX_MMIO_BAR_ENABLE		PPC_BIT(52)
#define   NX_MMIO_BAR_SIZE		PPC_BITMASK(53,55)
#define NX_NODAL_BAR0			0x04
#define NX_NODAL_BAR1			0x05
#define   NX_NODAL_BAR_ENABLE		PPC_BIT(0)
#define   NX_NODAL_BAR_MASK		PPC_BITMASK(1,14)
#define   NX_NODAL_BAR_BASE		PPC_BITMASK(15,32)
#define NX_GROUP_BAR0			0x06
#define NX_GROUP_BAR1			0x07
#define   NX_GROUP_BAR_ENABLE		PPC_BIT(0)
#define   NX_GROUP_BAR_MASK		PPC_BITMASK(1,14)
#define   NX_GROUP_BAR_BASE		PPC_BITMASK(15,32)
#define NX_EPSILON_COUN			0x08
#define   NX_EPSILON_COUN_DISABLE	PPC_BIT(6)
#define NX_MISC_CONTROL			0x09
#define NX_PB_DEBUG			0x0a
#define NX_PB_ECC			0x0b
#define NX_DEBUG_SNAPSHOT_0		0x0c
#define NX_DEBUG_SNAPSHOT_1		0x0d
#define NX_CS_CTL			0x0e
#define NX_CONFIG_CQ			0x0f
#define NX_MRBO0			0x10
#define NX_MRBO1			0x11
#define NX_AS_CMD_CFG			0x12
#define NX_NP_BUID			0x13
#define   NP_BUID_ENABLE		PPC_BIT(0)
#define   NP_BUID_BASE			PPC_BITMASK(1,15)
#define   NP_IRQ_LEVELS			PPC_BITMASK(16,23)
#define   NP_BUID_MASK			PPC_BITMASK(24,32)
#define NX_TL_CMD_CR			0x20
#define NX_TL_CMD_D_CR			0x21
#define NX_TL_RSP_CR			0x22
#define NX_TL_RSP_D_CR			0x23
#define NX_DL_REG_ADDR			0x24
#define NX_DL_REG_DATA			0x25
#define NX_NTL_CONTROL			0x26
#define NX_NTL_PMU_CONTROL		0x27
#define NX_NTL_PMU_COUNT		0x28
#define NX_NTL_ER_HOLD			0x29
#define NX_NTL_FST_ERR			0x2a
#define NX_NTL_ECC			0x2b
#define NX_NTL_FST_MSK			0x2c

/* NP AT register */
#define NX_FIR				0x00
#define NX_FIR_CLEAR			0x01
#define NX_FIR_SET			0x02
#define NX_FIR_MASK			0x03
#define NX_FIR_MASK_CLR			0x04
#define NX_FIR_MASK_SET			0x05
#define NX_FIR_ACTION0			0x06
#define NX_FIR_ACTION1			0x07
#define NX_FIR_WOF			0x08
#define NX_AT_PMU_CTRL			0x26
#define NX_AT_PMU_CNT			0x27
#define NX_AT_ERR_HOLD			0x28
#define   NX_AT_ERR_HOLD_RESET		PPC_BIT(63)
#define NX_AT_DEBUG			0x29
#define NX_AT_ECC			0x2a
#define NX_BAR				0x2b

/* AT MMIO registers */
#define NPU_LSI_SOURCE_ID		0x00100
#define   NPU_LSI_SRC_ID_BASE		PPC_BITMASK(5,11)
#define NPU_DMA_CHAN_STATUS		0x00110
#define NPU_INTREP_TIMER		0x001f8
#define NPU_DMARD_SYNC			0x00200
#define   NPU_DMARD_SYNC_START_RD	PPC_BIT(0)
#define   NPU_DMARD_SYNC_RD		PPC_BIT(1)
#define   NPU_DMARD_SYNC_START_WR	PPC_BIT(2)
#define   NPU_DMARD_SYNC_WR		PPC_BIT(3)
#define NPU_TCE_KILL			0x00210
#define NPU_IODA_ADDR			0x00220
#define   NPU_IODA_AD_AUTOINC		PPC_BIT(0)
#define   NPU_IODA_AD_TSEL		PPC_BITMASK(11,15)
#define   NPU_IODA_AD_TADR		PPC_BITMASK(54,63)
#define NPU_IODA_DATA0			0x00228
#define NPU_XIVE_UPD			0x00248
#define NPU_GEN_CAP			0x00250
#define NPU_TCE_CAP			0x00258
#define NPU_INT_CAP			0x00260
#define NPU_EEH_CAP			0x00268
#define NPU_VR				0x00800
#define NPU_CTRLR			0x00810
#define NPU_TCR				0x00880
#define NPU_Q_DMA_R			0x00888
#define NPU_AT_ESR			0x00c80
#define NPU_AT_FESR			0x00c88
#define NPU_AT_LR_ER			0x00c98
#define NPU_AT_SI_ER			0x00ca0
#define NPU_AT_FR_ER			0x00ca8
#define NPU_AT_FE_ER			0x00cb0
#define NPU_AT_ESMR			0x00cd0
#define NPU_AT_FESMR			0x00cd8
#define NPU_AT_I_LR0			0x00d00
#define NPU_AT_I_LR1			0x00d08
#define NPU_AT_I_LR2			0x00d10
#define NPU_AT_I_LR3			0x00d18

/* AT */
#define NPU_AT_SCOM_OFFSET		0x180

/* NTL */
#define TL_CMD_CR			0x10000
#define TL_CMD_D_CR			0x10008
#define TL_RSP_CR			0x10010
#define TL_RSP_D_CR			0x10018
#define NTL_CONTROL			0x10020
#define   NTL_CONTROL_RESET		PPC_BIT(0)

/* IODA tables */
#define NPU_IODA_TBL_LIST	1
#define NPU_IODA_TBL_LXIVT	2
#define NPU_IODA_TBL_PCT	4
#define NPU_IODA_TBL_PESTB	8
#define NPU_IODA_TBL_TVT	9
#define NPU_IODA_TBL_TCD	10
#define NPU_IODA_TBL_TDR	11
#define NPU_IODA_TBL_PESTB_ADDR	12
#define NPU_IODA_TBL_EA		16

/* LXIVT */
#define NPU_IODA_LXIVT_SERVER		PPC_BITMASK(8,23)
#define NPU_IODA_LXIVT_PRIORITY		PPC_BITMASK(24,31)

/* PCT */
#define NPU_IODA_PCT_LINK_ENABLED	PPC_BIT(0)
#define NPU_IODA_PCT_PE			PPC_BITMASK(2,3)

/* TVT */
#define NPU_IODA_TVT_TTA		PPC_BITMASK(0,47)
#define NPU_IODA_TVT_LEVELS		PPC_BITMASK(48,50)
#define   NPU_IODA_TVE_1_LEVEL		0
#define   NPU_IODA_TVE_2_LEVELS		1
#define   NPU_IODA_TVE_3_LEVELS		2
#define   NPU_IODA_TVE_4_LEVELS		3
#define NPU_IODA_TVT_SIZE		PPC_BITMASK(51,55)
#define NPU_IODA_TVT_PSIZE		PPC_BITMASK(59,63)

/* NDL Registers */
#define NDL_STATUS		0xfff0
#define NDL_CONTROL		0xfff4

/* BAR Sizes */
#define NX_MMIO_PL_SIZE		0x200000
#define NX_MMIO_AT_SIZE		0x10000
#define NX_MMIO_DL_SIZE		0x20000

/* Translates a PHY SCOM address to an MMIO offset */
#define PL_MMIO_ADDR(reg) (((reg >> 32) & 0xfffffull) << 1)

/* PHY register scom offsets & fields */
#define RX_PR_CNTL_PL		0x0002180000000000UL
#define	  RX_PR_RESET		PPC_BIT(63)

#define TX_MODE1_PL		0x0004040000000000UL
#define   TX_LANE_PDWN		PPC_BIT(48)

#define TX_MODE2_PL		0x00040c0000000000UL
#define   TX_RXCAL		PPC_BIT(57)
#define   TX_UNLOAD_CLK_DISABLE PPC_BIT(56)

#define TX_CNTL_STAT2		0x00041c0000000000UL
#define   TX_FIFO_INIT		PPC_BIT(48)

#define RX_BANK_CONTROLS	0x0000f80000000000UL
#define   RX_LANE_ANA_PDWN	PPC_BIT(54)

#define RX_MODE			0x0002000000000000UL
#define   RX_LANE_DIG_PDWN	PPC_BIT(48)

#define RX_PR_MODE		0x0002100000000000UL
#define   RX_PR_PHASE_STEP	PPC_BITMASK(60, 63)

#define RX_A_DAC_CNTL		0x0000080000000000UL
#define   RX_PR_IQ_RES_SEL	PPC_BITMASK(58, 60)

#define RX_LANE_BUSY_VEC_0_15	0x000b000000000000UL
#define TX_FFE_TOTAL_2RSTEP_EN	0x000c240000000000UL
#define   TX_FFE_TOTAL_ENABLE_P_ENC	PPC_BITMASK(49,55)
#define   TX_FFE_TOTAL_ENABLE_N_ENC	PPC_BITMASK(57,63)
#define TX_FFE_PRE_2RSTEP_SEL	0x000c2c0000000000UL
#define   TX_FFE_PRE_P_SEL_ENC		PPC_BITMASK(51,54)
#define   TX_FFE_PRE_N_SEL_ENC		PPC_BITMASK(59,62)
#define TX_FFE_MARGIN_2RSTEP_SEL 0x000c34000000000UL
#define   TX_FFE_MARGIN_PU_P_SEL_ENC	PPC_BITMASK(51,55)
#define   TX_FFE_MARGIN_PD_N_SEL_ENC	PPC_BITMASK(59,63)
#define TX_IORESET_VEC_0_15	0x000d2c0000000000UL
#define TX_IMPCAL_PB		0x000f040000000000UL
#define   TX_ZCAL_REQ			PPC_BIT(49)
#define	  TX_ZCAL_DONE			PPC_BIT(50)
#define   TX_ZCAL_ERROR			PPC_BIT(51)
#define TX_IMPCAL_NVAL_PB	0x000f0c0000000000UL
#define   TX_ZCAL_N			PPC_BITMASK(48,56)
#define TX_IMPCAL_PVAL_PB	0x000f140000000000UL
#define   TX_ZCAL_P			PPC_BITMASK(48,56)
#define RX_EO_STEP_CNTL_PG	0x0008300000000000UL
#define   RX_EO_ENABLE_LATCH_OFFSET_CAL	PPC_BIT(48)
#define   RX_EO_ENABLE_CM_COARSE_CAL	PPC_BIT(57)
#define RX_RUN_LANE_VEC_0_15   	0x0009b80000000000UL
#define RX_RECAL_ABORT_VEC_0_15 0x0009c80000000000UL
#define RX_IORESET_VEC_0_15	0x0009d80000000000UL
#define RX_EO_RECAL_PG		0x000a800000000000UL
#define RX_INIT_DONE_VEC_0_15	0x000ac00000000000UL
#define TX_IMPCAL_SWO1_PB	0x000f240000000000UL
#define   TX_ZCAL_SWO_EN		PPC_BIT(48)
#define TX_IMPCAL_SWO2_PB	0x000f2c0000000000UL

#endif /* __NPU_REGS_H */
