/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * Copyright 2014 Broadcom Corporation.
 */

#ifndef __TIMER_H
#define __TIMER_H

#include <linux/types.h>

void timer_systick_init(uint32_t tick_ms);
void timer_global_init(void);

/* ARM A9 Private Timer */
#define TIMER_PVT_LOAD_OFFSET			0x00000000
#define TIMER_PVT_COUNTER_OFFSET		0x00000004
#define TIMER_PVT_CTRL_OFFSET			0x00000008
#define TIMER_PVT_STATUS_OFFSET			0x0000000C
#define TIMER_PVT_TIM_CTRL_TIM_EN		0x00000001
#define TIMER_PVT_TIM_CTRL_AUTO_RELD		0x00000002
#define TIMER_PVT_TIM_CTRL_INT_EN		0x00000004
#define TIMER_PVT_TIM_CTRL_PRESC_MASK		0x0000FF00
#define TIMER_PVT_TIM_INT_STATUS_SET		0x00000001

/* Global timer */
#define TIMER_GLB_LOW_OFFSET			0x00000000
#define TIMER_GLB_HI_OFFSET			0x00000004
#define TIMER_GLB_CTRL_OFFSET			0x00000008
#define TIMER_GLB_TIM_CTRL_TIM_EN		0x00000001
#define TIMER_GLB_TIM_CTRL_COMP_EN		0x00000002
#define TIMER_GLB_TIM_CTRL_INT_EN		0x00000004
#define TIMER_GLB_TIM_CTRL_AUTO_INC		0x00000008
#define TIMER_GLB_TIM_CTRL_PRESC_MASK		0x0000FF00
#define TIMER_GLB_TIM_INT_STATUS_SET		0x00000001

#endif /*__TIMER_H */
