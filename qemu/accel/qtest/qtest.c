/*
 * QTest accelerator code
 *
 * Copyright IBM, Corp. 2011
 *
 * Authors:
 *  Anthony Liguori   <aliguori@us.ibm.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2 or later.
 * See the COPYING file in the top-level directory.
 *
 */

#include "qemu/osdep.h"
#include "qemu/rcu.h"
#include "qapi/error.h"
#include "qemu/module.h"
#include "qemu/option.h"
#include "qemu/config-file.h"
#include "sysemu/accel.h"
#include "sysemu/qtest.h"
#include "sysemu/cpus.h"
#include "sysemu/cpu-timers.h"
#include "qemu/guest-random.h"
#include "qemu/main-loop.h"
#include "hw/core/cpu.h"

const CpusAccel qtest_cpus = {
    .create_vcpu_thread = dummy_start_vcpu_thread,
    .get_virtual_clock = qtest_get_virtual_clock,
};

static int qtest_init_accel(MachineState *ms)
{
    cpus_register_accel(&qtest_cpus);
    return 0;
}

static void qtest_accel_class_init(ObjectClass *oc, void *data)
{
    AccelClass *ac = ACCEL_CLASS(oc);
    ac->name = "QTest";
    ac->init_machine = qtest_init_accel;
    ac->allowed = &qtest_allowed;
}

#define TYPE_QTEST_ACCEL ACCEL_CLASS_NAME("qtest")

static const TypeInfo qtest_accel_type = {
    .name = TYPE_QTEST_ACCEL,
    .parent = TYPE_ACCEL,
    .class_init = qtest_accel_class_init,
};

static void qtest_type_init(void)
{
    type_register_static(&qtest_accel_type);
}

type_init(qtest_type_init);
