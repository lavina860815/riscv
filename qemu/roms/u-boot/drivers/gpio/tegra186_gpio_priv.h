/* SPDX-License-Identifier: GPL-2.0 */
/*
 * Copyright (c) 2016, NVIDIA CORPORATION.
 */

#ifndef _TEGRA186_GPIO_PRIV_H_
#define _TEGRA186_GPIO_PRIV_H_

/*
 * For each GPIO, there are a set of registers than affect it, all packed
 * back-to-back.
 */
#define TEGRA186_GPIO_ENABLE_CONFIG				0x00
#define TEGRA186_GPIO_ENABLE_CONFIG_ENABLE			BIT(0)
#define TEGRA186_GPIO_ENABLE_CONFIG_OUT				BIT(1)
#define TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_SHIFT		2
#define TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_MASK		3
#define TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_NONE		0
#define TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_LEVEL		1
#define TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_SINGLE_EDGE	2
#define TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_TYPE_DOUBLE_EDGE	3
#define TEGRA186_GPIO_ENABLE_CONFIG_TRIGGER_LEVEL_HIGH_RISING	BIT(4)
#define TEGRA186_GPIO_ENABLE_CONFIG_DEBOUNCE_ENABLE		BIT(5)
#define TEGRA186_GPIO_ENABLE_CONFIG_INTERRUPT_ENABLE		BIT(6)
#define TEGRA186_GPIO_ENABLE_CONFIG_TIMESTAMPING_ENABLE		BIT(7)

#define TEGRA186_GPIO_DEBOUNCE_THRESHOLD			0x04

#define TEGRA186_GPIO_INPUT					0x08

#define TEGRA186_GPIO_OUTPUT_CONTROL				0x0c
#define TEGRA186_GPIO_OUTPUT_CONTROL_FLOATED			BIT(0)

#define TEGRA186_GPIO_OUTPUT_VALUE				0x10
#define TEGRA186_GPIO_OUTPUT_VALUE_HIGH				1

#define TEGRA186_GPIO_INTERRUPT_CLEAR				0x14

/*
 * 8 GPIOs are packed into a port. Their registers appear back-to-back in the
 * port's address space.
 */
#define TEGRA186_GPIO_PER_GPIO_STRIDE				0x20
#define TEGRA186_GPIO_PER_GPIO_COUNT				8

/*
 * Per-port registers are packed immediately following all of a port's
 * per-GPIO registers.
 */
#define TEGRA186_GPIO_INTERRUPT_STATUS_G			0x100
#define TEGRA186_GPIO_INTERRUPT_STATUS_G_STRIDE			4
#define TEGRA186_GPIO_INTERRUPT_STATUS_G_COUNT			8

/*
 * The registers for multiple ports are packed together back-to-back to form
 * the overall controller.
 */
#define TEGRA186_GPIO_PER_PORT_STRIDE				0x200

#endif
