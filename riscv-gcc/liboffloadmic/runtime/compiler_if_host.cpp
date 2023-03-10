/*
    Copyright (c) 2014-2016 Intel Corporation.  All Rights Reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:

      * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.
      * Redistributions in binary form must reproduce the above copyright
        notice, this list of conditions and the following disclaimer in the
        documentation and/or other materials provided with the distribution.
      * Neither the name of Intel Corporation nor the names of its
        contributors may be used to endorse or promote products derived
        from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
    A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
    HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/


#include "compiler_if_host.h"

#include <malloc.h>
#ifndef TARGET_WINNT
#include <alloca.h>
#endif // TARGET_WINNT

// Global counter on host.
// This variable is used if P2OPT_offload_do_data_persistence == 2.
// The variable used to identify offload constructs contained in one procedure.
// Increment of OFFLOAD_CALL_COUNT is inserted at entries of HOST routines with
// offload constructs.
static int offload_call_count = 0;

extern "C" OFFLOAD OFFLOAD_TARGET_ACQUIRE(
    TARGET_TYPE      target_type,
    int              target_number,
    int              is_optional,
    _Offload_status* status,
    const char*      file,
    uint64_t         line
)
{
    bool retval;
    OFFLOAD ofld;

    // initialize status
    if (status != 0) {
        status->result = OFFLOAD_UNAVAILABLE;
        status->device_number = -1;
        status->data_sent = 0;
        status->data_received = 0;
    }

    // make sure libray is initialized
    retval = __offload_init_library();

    // OFFLOAD_TIMER_INIT must follow call to __offload_init_library
    OffloadHostTimerData * timer_data = OFFLOAD_TIMER_INIT(file, line);

    OFFLOAD_TIMER_START(timer_data, c_offload_host_total_offload);

    OFFLOAD_TIMER_START(timer_data, c_offload_host_initialize);

    // initialize all devices is init_type is on_offload_all
    if (retval && __offload_init_type == c_init_on_offload_all) {
        for (int i = 0; i < mic_engines_total; i++) {
             mic_engines[i].init();
        }
    }
    OFFLOAD_TIMER_STOP(timer_data, c_offload_host_initialize);

    OFFLOAD_TIMER_START(timer_data, c_offload_host_target_acquire);

    if (target_type == TARGET_HOST) {
        // Host always available
        retval = true;
    }
    else if (target_type == TARGET_MIC) {
        if (target_number >= -1) {
            if (retval) {
                if (target_number >= 0) {
                    // User provided the device number
                    target_number = target_number % mic_engines_total;
                }
                else {
                    // use device 0
                    target_number = 0;
                }

                // reserve device in ORSL
                if (is_optional) {
                    if (!ORSL::try_reserve(target_number)) {
                        target_number = -1;
                    }
                }
                else {
                    if (!ORSL::reserve(target_number)) {
                        target_number = -1;
                    }
                }

                // initialize device
                if (target_number >= 0 &&
                    __offload_init_type == c_init_on_offload) {
                    OFFLOAD_TIMER_START(timer_data, c_offload_host_initialize);
                    mic_engines[target_number].init();
                    OFFLOAD_TIMER_STOP(timer_data, c_offload_host_initialize);
                }
            }
            else {
                // fallback to CPU
                target_number = -1;
            }

            if (target_number < 0 || !retval) {
                if (!is_optional && status == 0) {
                    LIBOFFLOAD_ERROR(c_device_is_not_available);
                    exit(1);
                }

                retval = false;
            }
        }
        else {
            LIBOFFLOAD_ERROR(c_invalid_device_number);
            exit(1);
        }
    }

    if (retval) {
        ofld = new OffloadDescriptor(target_number, status,
                                     !is_optional, false, timer_data);
        OFFLOAD_TIMER_HOST_MIC_NUM(timer_data, target_number);
        Offload_Report_Prolog(timer_data);
        OFFLOAD_DEBUG_TRACE_1(2, timer_data->offload_number, c_offload_start,
                              "Starting offload: target_type = %d, "
                              "number = %d, is_optional = %d\n",
                              target_type, target_number, is_optional);

        OFFLOAD_TIMER_STOP(timer_data, c_offload_host_target_acquire);
    }
    else {
        ofld = NULL;

        OFFLOAD_TIMER_STOP(timer_data, c_offload_host_target_acquire);
        OFFLOAD_TIMER_STOP(timer_data, c_offload_host_total_offload);
        offload_report_free_data(timer_data);
    }

    return ofld;
}

// This routine is called for OpenMP4.5 offload calls
// OpenMP 4.5 offload is always optional.
extern "C" OFFLOAD OFFLOAD_TARGET_ACQUIRE1(
    const int*  device_num,
    const char* file,
    uint64_t    line
)
{
    int target_number;

    // make sure libray is initialized and at least one device is available
    if (!__offload_init_library()) {
       OFFLOAD_DEBUG_TRACE(2, "No device available, fall back to host\n");
       return NULL;
    }

    // OFFLOAD_TIMER_INIT must follow call to __offload_init_library

    OffloadHostTimerData * timer_data = OFFLOAD_TIMER_INIT(file, line);

    OFFLOAD_TIMER_START(timer_data, c_offload_host_total_offload);

    OFFLOAD_TIMER_START(timer_data, c_offload_host_initialize);

    if (__offload_init_type == c_init_on_offload_all) {
        for (int i = 0; i < mic_engines_total; i++) {
             mic_engines[i].init();
        }
    }

    OFFLOAD_TIMER_STOP(timer_data, c_offload_host_initialize);

    OFFLOAD_TIMER_START(timer_data, c_offload_host_target_acquire);

    // use default device number if it is not provided
    if (device_num != 0) {
        target_number = *device_num;
    }
    else {
        target_number = __omp_device_num;
    }

    // device number should be a non-negative integer value
    if (target_number < 0) {
        LIBOFFLOAD_ERROR(c_omp_invalid_device_num);
        exit(1);
    }

    // should we do this for OpenMP?
    target_number %= mic_engines_total;

    // reserve device in ORSL
    if (!ORSL::reserve(target_number)) {
        LIBOFFLOAD_ERROR(c_device_is_not_available);
        exit(1);
    }

    // initialize device(s)
    OFFLOAD_TIMER_START(timer_data, c_offload_host_initialize);

    if (__offload_init_type == c_init_on_offload) {
        mic_engines[target_number].init();
    }

    OFFLOAD_TIMER_STOP(timer_data, c_offload_host_initialize);

    OFFLOAD ofld =
        new OffloadDescriptor(target_number, 0, true, true, timer_data);

    OFFLOAD_TIMER_HOST_MIC_NUM(timer_data, target_number);

    Offload_Report_Prolog(timer_data);

    OFFLOAD_DEBUG_TRACE_1(2, timer_data->offload_number, c_offload_start,
                          "Starting OpenMP offload, device = %d\n",
                          target_number);

    OFFLOAD_TIMER_STOP(timer_data, c_offload_host_target_acquire);

    return ofld;
}

extern "C" OFFLOAD OFFLOAD_TARGET_ACQUIRE2(
    TARGET_TYPE      target_type,
    int              target_number,
    int              is_optional,
    _Offload_status* status,
    const char*      file,
    uint64_t         line,
    const void**     stream
)
{
    bool retval;
    OFFLOAD ofld;

    // initialize status
    if (status != 0) {
        status->result = OFFLOAD_UNAVAILABLE;
        status->device_number = -1;
        status->data_sent = 0;
        status->data_received = 0;
    }

    // make sure libray is initialized
    retval = __offload_init_library();
    // OFFLOAD_TIMER_INIT must follow call to __offload_init_library
    OffloadHostTimerData * timer_data = OFFLOAD_TIMER_INIT(file, line);

    OFFLOAD_TIMER_START(timer_data, c_offload_host_total_offload);

    OFFLOAD_TIMER_START(timer_data, c_offload_host_initialize);

    // initalize all devices if init_type is on_offload_all
    if (retval && __offload_init_type == c_init_on_offload_all) {
        for (int i = 0; i < mic_engines_total; i++) {
             mic_engines[i].init();
        }
    }
    OFFLOAD_TIMER_STOP(timer_data, c_offload_host_initialize);

    OFFLOAD_TIMER_START(timer_data, c_offload_host_target_acquire);

    if (target_type == TARGET_HOST) {
        // Host always available
        retval = true;
    }
    else if (target_type == TARGET_MIC) {
        _Offload_stream handle = *(reinterpret_cast<_Offload_stream*>(stream));
        Stream * stream = handle ? Stream::find_stream(handle, false) : NULL;
        if (target_number >= -1) {
            if (retval) {
                // device number is defined by stream
                if (stream) {
                    target_number = stream->get_device();
                    target_number = target_number % mic_engines_total;
                }

                // reserve device in ORSL
                if (target_number != -1) {
                    if (is_optional) {
                        if (!ORSL::try_reserve(target_number)) {
                            target_number = -1;
                        }
                    }
                    else {
                        if (!ORSL::reserve(target_number)) {
                            target_number = -1;
                        }
                    }
                }

                // initialize device
                if (target_number >= 0 &&
                    __offload_init_type == c_init_on_offload) {
                    OFFLOAD_TIMER_START(timer_data, c_offload_host_initialize);
                    mic_engines[target_number].init();
                    OFFLOAD_TIMER_STOP(timer_data, c_offload_host_initialize);
                }
            }
            else {
                // fallback to CPU
                target_number = -1;
            }
            if (!(target_number == -1 && handle == 0)) {
                if (target_number < 0 || !retval) {
                    if (!is_optional && status == 0) {
                        LIBOFFLOAD_ERROR(c_device_is_not_available);
                        exit(1);
                    }

                    retval = false;
                }
            }
        }
        else {
            LIBOFFLOAD_ERROR(c_invalid_device_number);
            exit(1);
        }
    }

    if (retval) {
        ofld = new OffloadDescriptor(target_number, status,
                                     !is_optional, false, timer_data);
        OFFLOAD_TIMER_HOST_MIC_NUM(timer_data, target_number);
        Offload_Report_Prolog(timer_data);
        OFFLOAD_DEBUG_TRACE_1(2, timer_data->offload_number, c_offload_start,
                              "Starting offload: target_type = %d, "
                              "number = %d, is_optional = %d\n",
                              target_type, target_number, is_optional);

        OFFLOAD_TIMER_STOP(timer_data, c_offload_host_target_acquire);
    }
    else {
        ofld = NULL;

        OFFLOAD_TIMER_STOP(timer_data, c_offload_host_target_acquire);
        OFFLOAD_TIMER_STOP(timer_data, c_offload_host_total_offload);
        offload_report_free_data(timer_data);
    }

    return ofld;
}

static int offload_offload_wrap(
    OFFLOAD ofld,
    const char *name,
    int is_empty,
    int num_vars,
    VarDesc *vars,
    VarDesc2 *vars2,
    int num_waits,
    const void **waits,
    const void **signal,
    int entry_id,
    const void *stack_addr,
    OffloadFlags offload_flags
)
{
    if (signal) {
       ofld->set_signal(*signal);
    }

    bool ret = ofld->offload(name, is_empty, vars, vars2, num_vars,
                             waits, num_waits, signal, entry_id,
                             stack_addr, offload_flags);
    if (!ret || (signal == 0 && ofld->get_stream() == 0 &&
                 !offload_flags.bits.omp_async)) {
        delete ofld;
    }
    return ret;
}

extern "C" int OFFLOAD_OFFLOAD1(
    OFFLOAD ofld,
    const char *name,
    int is_empty,
    int num_vars,
    VarDesc *vars,
    VarDesc2 *vars2,
    int num_waits,
    const void **waits,
    const void **signal
)
{
    return offload_offload_wrap(ofld, name, is_empty,
                            num_vars, vars, vars2,
                            num_waits, waits,
                            signal, 0, NULL, {0});
}

extern "C" int OFFLOAD_OFFLOAD2(
    OFFLOAD ofld,
    const char *name,
    int is_empty,
    int num_vars,
    VarDesc *vars,
    VarDesc2 *vars2,
    int num_waits,
    const void** waits,
    const void** signal,
    int entry_id,
    const void *stack_addr
)
{
    return offload_offload_wrap(ofld, name, is_empty,
                            num_vars, vars, vars2,
                            num_waits, waits,
                            signal, entry_id, stack_addr, {0});
}

extern "C" int OFFLOAD_OFFLOAD3(
    OFFLOAD ofld,
    const char *name,
    int is_empty,
    int num_vars,
    VarDesc *vars,
    VarDesc2 *vars2,
    int num_waits,
    const void** waits,
    const void** signal,
    int entry_id,
    const void *stack_addr,
    OffloadFlags offload_flags,
    const void** stream
)
{
    // 1. if the source is compiled with -traceback then stream is 0
    // 2. if offload has a stream clause then stream is address of stream value
    if (stream) {
        ofld->set_stream(*(reinterpret_cast<_Offload_stream *>(stream)));
    }

    return offload_offload_wrap(ofld, name, is_empty,
                            num_vars, vars, vars2,
                            num_waits, waits,
                            signal, entry_id, stack_addr, offload_flags);
}

extern "C" int OFFLOAD_OFFLOAD(
    OFFLOAD ofld,
    const char *name,
    int is_empty,
    int num_vars,
    VarDesc *vars,
    VarDesc2 *vars2,
    int num_waits,
    const void **waits,
    const void *signal,
    int entry_id,
    const void *stack_addr
)
{
    // signal is passed by reference now
    const void **signal_new = (signal != 0) ? &signal : 0;
    const void **waits_new = 0;
    int num_waits_new = 0;

    // remove NULL values from the list of signals to wait for
    if (num_waits > 0) {
        waits_new = (const void**) alloca(sizeof(void*) * num_waits);
        for (int i = 0; i < num_waits; i++) {
            if (waits[i] != 0) {
                waits_new[num_waits_new++] = waits[i];
            }
        }
    }

    return OFFLOAD_OFFLOAD1(ofld, name, is_empty,
                            num_vars, vars, vars2,
                            num_waits_new, waits_new,
                            signal_new);
}

extern "C" int OFFLOAD_CALL_COUNT()
{
    offload_call_count++;
    return offload_call_count;
}
