/* SPDX-License-Identifier:     GPL-2.0+ */
/*
 * Copyright 2017-2018 NXP
 *
 */

#ifndef SC_RPC_H
#define SC_RPC_H

/* Note: Check SCFW API Released DOC before you want to modify something */
#define SC_RPC_VERSION          1U

#define SC_RPC_MAX_MSG          8U

#define RPC_VER(MSG)            ((MSG)->version)
#define RPC_SIZE(MSG)           ((MSG)->size)
#define RPC_SVC(MSG)            ((MSG)->svc)
#define RPC_FUNC(MSG)           ((MSG)->func)
#define RPC_R8(MSG)             ((MSG)->func)
#define RPC_I32(MSG, IDX)       ((MSG)->DATA.i32[(IDX) / 4U])
#define RPC_I16(MSG, IDX)       ((MSG)->DATA.i16[(IDX) / 2U])
#define RPC_I8(MSG, IDX)        ((MSG)->DATA.i8[(IDX)])
#define RPC_U32(MSG, IDX)       ((MSG)->DATA.u32[(IDX) / 4U])
#define RPC_U16(MSG, IDX)       ((MSG)->DATA.u16[(IDX) / 2U])
#define RPC_U8(MSG, IDX)        ((MSG)->DATA.u8[(IDX)])

#define SC_RPC_SVC_UNKNOWN      0U
#define SC_RPC_SVC_RETURN       1U
#define SC_RPC_SVC_PM           2U
#define SC_RPC_SVC_RM           3U
#define SC_RPC_SVC_TIMER        5U
#define SC_RPC_SVC_PAD          6U
#define SC_RPC_SVC_MISC         7U
#define SC_RPC_SVC_IRQ          8U
#define SC_RPC_SVC_ABORT        9U

/* Types */

struct sc_rpc_msg_s {
	u8 version;
	u8 size;
	u8 svc;
	u8 func;
	union {
		s32 i32[(SC_RPC_MAX_MSG - 1U)];
		s16 i16[(SC_RPC_MAX_MSG - 1U) * 2U];
		s8 i8[(SC_RPC_MAX_MSG - 1U) * 4U];
		u32 u32[(SC_RPC_MAX_MSG - 1U)];
		u16 u16[(SC_RPC_MAX_MSG - 1U) * 2U];
		u8 u8[(SC_RPC_MAX_MSG - 1U) * 4U];
	} DATA;
};

/* PM RPC */
#define PM_FUNC_UNKNOWN				0
#define PM_FUNC_SET_SYS_POWER_MODE		19U
#define PM_FUNC_SET_PARTITION_POWER_MODE	1U
#define PM_FUNC_GET_SYS_POWER_MODE		2U
#define PM_FUNC_SET_RESOURCE_POWER_MODE		3U
#define PM_FUNC_GET_RESOURCE_POWER_MODE		4U
#define PM_FUNC_REQ_LOW_POWER_MODE		16U
#define PM_FUNC_REQ_CPU_LOW_POWER_MODE		20U
#define PM_FUNC_SET_CPU_RESUME_ADDR		17U
#define PM_FUNC_SET_CPU_RESUME			21U
#define PM_FUNC_REQ_SYS_IF_POWER_MODE		18U
#define PM_FUNC_SET_CLOCK_RATE			5U
#define PM_FUNC_GET_CLOCK_RATE			6U
#define PM_FUNC_CLOCK_ENABLE			7U
#define PM_FUNC_SET_CLOCK_PARENT		14U
#define PM_FUNC_GET_CLOCK_PARENT		15U
#define PM_FUNC_RESET				13U
#define PM_FUNC_RESET_REASON			10U
#define PM_FUNC_BOOT				8U
#define PM_FUNC_REBOOT				9U
#define PM_FUNC_REBOOT_PARTITION		12U
#define PM_FUNC_CPU_START			11U

/* MISC RPC */
#define MISC_FUNC_UNKNOWN			0
#define MISC_FUNC_SET_CONTROL			1U
#define MISC_FUNC_GET_CONTROL			2U
#define MISC_FUNC_SET_MAX_DMA_GROUP		4U
#define MISC_FUNC_SET_DMA_GROUP			5U
#define MISC_FUNC_SECO_IMAGE_LOAD		8U
#define MISC_FUNC_SECO_AUTHENTICATE		9U
#define MISC_FUNC_SECO_FUSE_WRITE		20U
#define MISC_FUNC_SECO_ENABLE_DEBUG		21U
#define MISC_FUNC_SECO_FORWARD_LIFECYCLE	22U
#define MISC_FUNC_SECO_RETURN_LIFECYCLE		23U
#define MISC_FUNC_SECO_BUILD_INFO		24U
#define MISC_FUNC_DEBUG_OUT			10U
#define MISC_FUNC_WAVEFORM_CAPTURE		6U
#define MISC_FUNC_BUILD_INFO			15U
#define MISC_FUNC_UNIQUE_ID			19U
#define MISC_FUNC_SET_ARI			3U
#define MISC_FUNC_BOOT_STATUS			7U
#define MISC_FUNC_BOOT_DONE			14U
#define MISC_FUNC_OTP_FUSE_READ			11U
#define MISC_FUNC_OTP_FUSE_WRITE		17U
#define MISC_FUNC_SET_TEMP			12U
#define MISC_FUNC_GET_TEMP			13U
#define MISC_FUNC_GET_BOOT_DEV			16U
#define MISC_FUNC_GET_BUTTON_STATUS		18U

/* PAD RPC */
#define PAD_FUNC_UNKNOWN			0
#define PAD_FUNC_SET_MUX			1U
#define PAD_FUNC_GET_MUX			6U
#define PAD_FUNC_SET_GP				2U
#define PAD_FUNC_GET_GP				7U
#define PAD_FUNC_SET_WAKEUP			4U
#define PAD_FUNC_GET_WAKEUP			9U
#define PAD_FUNC_SET_ALL			5U
#define PAD_FUNC_GET_ALL			10U
#define PAD_FUNC_SET				15U
#define PAD_FUNC_GET				16U
#define PAD_FUNC_SET_GP_28FDSOI			11U
#define PAD_FUNC_GET_GP_28FDSOI			12U
#define PAD_FUNC_SET_GP_28FDSOI_HSIC		3U
#define PAD_FUNC_GET_GP_28FDSOI_HSIC		8U
#define PAD_FUNC_SET_GP_28FDSOI_COMP		13U
#define PAD_FUNC_GET_GP_28FDSOI_COMP		14U

/* RM RPC */
#define RM_FUNC_UNKNOWN				0
#define RM_FUNC_PARTITION_ALLOC			1U
#define RM_FUNC_SET_CONFIDENTIAL		31U
#define RM_FUNC_PARTITION_FREE			2U
#define RM_FUNC_GET_DID				26U
#define RM_FUNC_PARTITION_STATIC		3U
#define RM_FUNC_PARTITION_LOCK			4U
#define RM_FUNC_GET_PARTITION			5U
#define RM_FUNC_SET_PARENT			6U
#define RM_FUNC_MOVE_ALL			7U
#define RM_FUNC_ASSIGN_RESOURCE			8U
#define RM_FUNC_SET_RESOURCE_MOVABLE		9U
#define RM_FUNC_SET_SUBSYS_RSRC_MOVABLE		28U
#define RM_FUNC_SET_MASTER_ATTRIBUTES		10U
#define RM_FUNC_SET_MASTER_SID			11U
#define RM_FUNC_SET_PERIPHERAL_PERMISSIONS	12U
#define RM_FUNC_IS_RESOURCE_OWNED		13U
#define RM_FUNC_IS_RESOURCE_MASTER		14U
#define RM_FUNC_IS_RESOURCE_PERIPHERAL		15U
#define RM_FUNC_GET_RESOURCE_INFO		16U
#define RM_FUNC_MEMREG_ALLOC			17U
#define RM_FUNC_MEMREG_SPLIT			29U
#define RM_FUNC_MEMREG_FREE			18U
#define RM_FUNC_FIND_MEMREG			30U
#define RM_FUNC_ASSIGN_MEMREG			19U
#define RM_FUNC_SET_MEMREG_PERMISSIONS		20U
#define RM_FUNC_IS_MEMREG_OWNED			21U
#define RM_FUNC_GET_MEMREG_INFO			22U
#define RM_FUNC_ASSIGN_PAD			23U
#define RM_FUNC_SET_PAD_MOVABLE			24U
#define RM_FUNC_IS_PAD_OWNED			25U
#define RM_FUNC_DUMP				27U

#endif /* SC_RPC_H */
