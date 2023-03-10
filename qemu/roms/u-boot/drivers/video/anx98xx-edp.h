/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright (C) 2015 Hans de Goede <hdegoede@redhat.com>
 * Copyright (C) 2017 Vasily Khoruzhick <anarsoul@gmail.com>
 */

/* Registers at i2c address 0x38 */

#define ANX9804_HDCP_CONTROL_0_REG				0x01

#define ANX9804_SYS_CTRL1_REG					0x80
#define ANX9804_SYS_CTRL1_PD_IO					0x80
#define ANX9804_SYS_CTRL1_PD_VID				0x40
#define ANX9804_SYS_CTRL1_PD_LINK				0x20
#define ANX9804_SYS_CTRL1_PD_TOTAL				0x10
#define ANX9804_SYS_CTRL1_MODE_SEL				0x08
#define ANX9804_SYS_CTRL1_DET_STA				0x04
#define ANX9804_SYS_CTRL1_FORCE_DET				0x02
#define ANX9804_SYS_CTRL1_DET_CTRL				0x01

#define ANX9804_SYS_CTRL2_REG					0x81
#define ANX9804_SYS_CTRL2_CHA_STA				0x04

#define ANX9804_SYS_CTRL3_REG					0x82
#define ANX9804_SYS_CTRL3_VALID_CTRL				BIT(0)
#define ANX9804_SYS_CTRL3_F_VALID				BIT(1)
#define ANX9804_SYS_CTRL3_HPD_CTRL				BIT(4)
#define ANX9804_SYS_CTRL3_F_HPD					BIT(5)

#define ANX9804_LINK_BW_SET_REG					0xa0
#define ANX9804_LANE_COUNT_SET_REG				0xa1
#define ANX9804_TRAINING_PTN_SET_REG				0xa2
#define ANX9804_TRAINING_LANE0_SET_REG				0xa3
#define ANX9804_TRAINING_LANE1_SET_REG				0xa4
#define ANX9804_TRAINING_LANE2_SET_REG				0xa5
#define ANX9804_TRAINING_LANE3_SET_REG				0xa6

#define ANX9804_LINK_TRAINING_CTRL_REG				0xa8
#define ANX9804_LINK_TRAINING_CTRL_EN				BIT(0)

#define ANX9804_LINK_DEBUG_REG					0xb8
#define ANX9804_PLL_CTRL_REG					0xc7
#define ANX9804_ANALOG_POWER_DOWN_REG				0xc8

#define ANX9804_AUX_CH_STA					0xe0
#define ANX9804_AUX_BUSY					BIT(4)
#define ANX9804_AUX_STATUS_MASK					0x0f

#define ANX9804_DP_AUX_RX_COMM					0xe3
#define ANX9804_AUX_RX_COMM_I2C_DEFER				BIT(3)
#define ANX9804_AUX_RX_COMM_AUX_DEFER				BIT(1)

#define ANX9804_DP_AUX_CH_CTL_1					0xe5
#define ANX9804_AUX_LENGTH(x)					(((x - 1) & 0x0f) << 4)
#define ANX9804_AUX_TX_COMM_MASK				0x0f
#define ANX9804_AUX_TX_COMM_DP_TRANSACTION			BIT(3)
#define ANX9804_AUX_TX_COMM_MOT					BIT(2)
#define ANX9804_AUX_TX_COMM_READ				BIT(0)

#define ANX9804_DP_AUX_ADDR_7_0					0xe6
#define ANX9804_DP_AUX_ADDR_15_8				0xe7
#define ANX9804_DP_AUX_ADDR_19_16				0xe8

#define ANX9804_DP_AUX_CH_CTL_2					0xe9
#define ANX9804_ADDR_ONLY					BIT(1)
#define ANX9804_AUX_EN						BIT(0)

#define ANX9804_BUF_DATA_0					0xf0

/* Registers at i2c address 0x39 */

#define ANX9804_DEV_IDH_REG					0x03

#define ANX9804_POWERD_CTRL_REG					0x05
#define ANX9804_POWERD_AUDIO					BIT(4)

#define ANX9804_RST_CTRL_REG					0x06

#define ANX9804_RST_CTRL2_REG					0x07
#define ANX9804_RST_CTRL2_AUX					BIT(2)
#define ANX9804_RST_CTRL2_AC_MODE				BIT(6)

#define ANX9804_VID_CTRL1_REG					0x08
#define ANX9804_VID_CTRL1_VID_EN				BIT(7)
#define ANX9804_VID_CTRL1_EDGE					BIT(0)

#define ANX9804_VID_CTRL2_REG					0x09
#define ANX9804_ANALOG_DEBUG_REG1				0xdc
#define ANX9804_ANALOG_DEBUG_REG3				0xde
#define ANX9804_PLL_FILTER_CTRL1				0xdf
#define ANX9804_PLL_FILTER_CTRL3				0xe1
#define ANX9804_PLL_FILTER_CTRL					0xe2
#define ANX9804_PLL_CTRL3					0xe6

#define ANX9804_DP_INT_STA					0xf7
#define ANX9804_RPLY_RECEIV					BIT(1)
#define ANX9804_AUX_ERR						BIT(0)
