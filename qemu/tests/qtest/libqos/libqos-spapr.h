#ifndef LIBQOS_SPAPR_H
#define LIBQOS_SPAPR_H

#include "libqos.h"

QOSState *qtest_spapr_vboot(const char *cmdline_fmt, va_list ap);
QOSState *qtest_spapr_boot(const char *cmdline_fmt, ...);
void qtest_spapr_shutdown(QOSState *qs);

/* List of capabilities needed to silence warnings with TCG */
#define PSERIES_DEFAULT_CAPABILITIES             \
    "cap-cfpc=broken,"                           \
    "cap-sbbc=broken,"                           \
    "cap-ibs=broken,"                            \
    "cap-ccf-assist=off,"

#endif
