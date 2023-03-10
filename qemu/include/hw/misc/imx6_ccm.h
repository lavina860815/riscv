/*
 * IMX6 Clock Control Module
 *
 * Copyright (C) 2012 NICTA
 * Updated by Jean-Christophe Dubois <jcd@tribudubois.net>
 *
 * This work is licensed under the terms of the GNU GPL, version 2 or later.
 * See the COPYING file in the top-level directory.
 */

#ifndef IMX6_CCM_H
#define IMX6_CCM_H

#include "hw/misc/imx_ccm.h"
#include "qemu/bitops.h"
#include "qom/object.h"

#define CCM_CCR 0
#define CCM_CCDR 1
#define CCM_CSR 2
#define CCM_CCSR 3
#define CCM_CACRR 4
#define CCM_CBCDR 5
#define CCM_CBCMR 6
#define CCM_CSCMR1 7
#define CCM_CSCMR2 8
#define CCM_CSCDR1 9
#define CCM_CS1CDR 10
#define CCM_CS2CDR 11
#define CCM_CDCDR 12
#define CCM_CHSCCDR 13
#define CCM_CSCDR2 14
#define CCM_CSCDR3 15
#define CCM_CDHIPR 18
#define CCM_CTOR 20
#define CCM_CLPCR 21
#define CCM_CISR 22
#define CCM_CIMR 23
#define CCM_CCOSR 24
#define CCM_CGPR 25
#define CCM_CCGR0 26
#define CCM_CCGR1 27
#define CCM_CCGR2 28
#define CCM_CCGR3 29
#define CCM_CCGR4 30
#define CCM_CCGR5 31
#define CCM_CCGR6 32
#define CCM_CMEOR 34
#define CCM_MAX 35

#define CCM_ANALOG_PLL_ARM 0
#define CCM_ANALOG_PLL_ARM_SET 1
#define CCM_ANALOG_PLL_ARM_CLR 2
#define CCM_ANALOG_PLL_ARM_TOG 3
#define CCM_ANALOG_PLL_USB1 4
#define CCM_ANALOG_PLL_USB1_SET 5
#define CCM_ANALOG_PLL_USB1_CLR 6
#define CCM_ANALOG_PLL_USB1_TOG 7
#define CCM_ANALOG_PLL_USB2 8
#define CCM_ANALOG_PLL_USB2_SET 9
#define CCM_ANALOG_PLL_USB2_CLR 10
#define CCM_ANALOG_PLL_USB2_TOG 11
#define CCM_ANALOG_PLL_SYS 12
#define CCM_ANALOG_PLL_SYS_SET 13
#define CCM_ANALOG_PLL_SYS_CLR 14
#define CCM_ANALOG_PLL_SYS_TOG 15
#define CCM_ANALOG_PLL_SYS_SS 16
#define CCM_ANALOG_PLL_SYS_NUM 20
#define CCM_ANALOG_PLL_SYS_DENOM 24
#define CCM_ANALOG_PLL_AUDIO 28
#define CCM_ANALOG_PLL_AUDIO_SET 29
#define CCM_ANALOG_PLL_AUDIO_CLR 30
#define CCM_ANALOG_PLL_AUDIO_TOG 31
#define CCM_ANALOG_PLL_AUDIO_NUM 32
#define CCM_ANALOG_PLL_AUDIO_DENOM 36
#define CCM_ANALOG_PLL_VIDEO 40
#define CCM_ANALOG_PLL_VIDEO_SET 41
#define CCM_ANALOG_PLL_VIDEO_CLR 42
#define CCM_ANALOG_PLL_VIDEO_TOG 44
#define CCM_ANALOG_PLL_VIDEO_NUM 46
#define CCM_ANALOG_PLL_VIDEO_DENOM 48
#define CCM_ANALOG_PLL_MLB 52
#define CCM_ANALOG_PLL_MLB_SET 53
#define CCM_ANALOG_PLL_MLB_CLR 54
#define CCM_ANALOG_PLL_MLB_TOG 55
#define CCM_ANALOG_PLL_ENET 56
#define CCM_ANALOG_PLL_ENET_SET 57
#define CCM_ANALOG_PLL_ENET_CLR 58
#define CCM_ANALOG_PLL_ENET_TOG 59
#define CCM_ANALOG_PFD_480 60
#define CCM_ANALOG_PFD_480_SET 61
#define CCM_ANALOG_PFD_480_CLR 62
#define CCM_ANALOG_PFD_480_TOG 63
#define CCM_ANALOG_PFD_528 64
#define CCM_ANALOG_PFD_528_SET 65
#define CCM_ANALOG_PFD_528_CLR 66
#define CCM_ANALOG_PFD_528_TOG 67

/* PMU registers */
#define PMU_REG_1P1 68
#define PMU_REG_3P0 72
#define PMU_REG_2P5 76
#define PMU_REG_CORE 80

#define CCM_ANALOG_MISC0 84
#define PMU_MISC0 84
#define CCM_ANALOG_MISC0_SET 85
#define CCM_ANALOG_MISC0_CLR 86
#define CCM_ANALOG_MISC0_TOG 87

#define PMU_MISC1 88
#define PMU_MISC1_SET 89
#define PMU_MISC1_CLR 90
#define PMU_MISC1_TOG 91

#define CCM_ANALOG_MISC2 92
#define PMU_MISC2 92
#define CCM_ANALOG_MISC2_SET 93
#define CCM_ANALOG_MISC2_CLR 94
#define CCM_ANALOG_MISC2_TOG 95

#define USB_ANALOG_USB1_VBUS_DETECT 104
#define USB_ANALOG_USB1_VBUS_DETECT_SET 105
#define USB_ANALOG_USB1_VBUS_DETECT_CLR 106
#define USB_ANALOG_USB1_VBUS_DETECT_TOG 107
#define USB_ANALOG_USB1_CHRG_DETECT 108
#define USB_ANALOG_USB1_CHRG_DETECT_SET 109
#define USB_ANALOG_USB1_CHRG_DETECT_CLR 110
#define USB_ANALOG_USB1_CHRG_DETECT_TOG 111
#define USB_ANALOG_USB1_VBUS_DETECT_STAT 112
#define USB_ANALOG_USB1_CHRG_DETECT_STAT 116
#define USB_ANALOG_USB1_MISC 124
#define USB_ANALOG_USB1_MISC_SET 125
#define USB_ANALOG_USB1_MISC_CLR 126
#define USB_ANALOG_USB1_MISC_TOG 127
#define USB_ANALOG_USB2_VBUS_DETECT 128
#define USB_ANALOG_USB2_VBUS_DETECT_SET 129
#define USB_ANALOG_USB2_VBUS_DETECT_CLR 130
#define USB_ANALOG_USB2_VBUS_DETECT_TOG 131
#define USB_ANALOG_USB2_CHRG_DETECT 132
#define USB_ANALOG_USB2_CHRG_DETECT_SET 133
#define USB_ANALOG_USB2_CHRG_DETECT_CLR 134
#define USB_ANALOG_USB2_CHRG_DETECT_TOG 135
#define USB_ANALOG_USB2_VBUS_DETECT_STAT 136
#define USB_ANALOG_USB2_CHRG_DETECT_STAT 140
#define USB_ANALOG_USB2_MISC 148
#define USB_ANALOG_USB2_MISC_SET 149
#define USB_ANALOG_USB2_MISC_CLR 150
#define USB_ANALOG_USB2_MISC_TOG 151
#define USB_ANALOG_DIGPROG 152
#define CCM_ANALOG_MAX 153

/* CCM_CBCMR */
#define PRE_PERIPH_CLK_SEL_SHIFT  (18)
#define PRE_PERIPH_CLK_SEL_LENGTH (2)

/* CCM_CBCDR */
#define AHB_PODF_SHIFT           (10)
#define AHB_PODF_LENGTH          (3)
#define IPG_PODF_SHIFT           (8)
#define IPG_PODF_LENGTH          (2)

/* CCM_CSCMR1 */
#define PERCLK_PODF_SHIFT        (0)
#define PERCLK_PODF_LENGTH       (6)

/* CCM_ANALOG_PFD_528 */
#define PFD0_FRAC_SHIFT          (0)
#define PFD0_FRAC_LENGTH         (6)
#define PFD2_FRAC_SHIFT          (16)
#define PFD2_FRAC_LENGTH         (6)

/* CCM_ANALOG_PLL_SYS */
#define DIV_SELECT_SHIFT         (0)
#define DIV_SELECT_LENGTH        (1)

#define CCM_ANALOG_PLL_LOCK      (1 << 31);

#define EXTRACT(value, name) extract32(value, name##_SHIFT, name##_LENGTH)

#define TYPE_IMX6_CCM "imx6.ccm"
OBJECT_DECLARE_SIMPLE_TYPE(IMX6CCMState, IMX6_CCM)

struct IMX6CCMState {
    /* <private> */
    IMXCCMState parent_obj;

    /* <public> */
    MemoryRegion container;
    MemoryRegion ioccm;
    MemoryRegion ioanalog;

    uint32_t ccm[CCM_MAX];
    uint32_t analog[CCM_ANALOG_MAX];

};

#endif /* IMX6_CCM_H */
