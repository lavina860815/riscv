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


#include "offload_trace.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <sstream>
#include "liboffload_error_codes.h"

extern const char *prefix;

#if !HOST_LIBRARY
extern int mic_index;
#endif

// The debug routines

static const char * offload_stage(std::stringstream &ss,
                                  int offload_number,
                                  const char *tag,
                                  const char *text,
                                  bool print_tag)
{
    ss << "[" << report_get_message_str(c_report_offload) << "]";
#if HOST_LIBRARY
    ss << " [" << prefix << "]";
    if (print_tag) {
        ss << "  [" << report_get_message_str(c_report_tag);
        ss << " " << offload_number << "]";
    }
    else {
        ss << "         ";
    }
    ss << " [" << tag << "]";
    ss << "           " << text;
#else
    ss << " [" << prefix << " " << mic_index << "]";
    if (print_tag) {
        ss << " [" << report_get_message_str(c_report_tag);
        ss << " " << offload_number << "]";
    }
    ss << " [" << tag << "]";
    ss << "           " << text;
#endif
    return 0;
}

static const char * offload_message_2str(std::stringstream &ss,
                                  int offload_number,
                                  const char *tag,
                                  const char *text)
{
    ss << "[" << report_get_message_str(c_report_offload) << "]";
    ss << " [" << prefix << "]";
    ss << "  [" << report_get_message_str(c_report_tag);
    ss << " " << offload_number << "]";
    ss << " [" << tag << "]";
    ss << "          " << text;
    return 0;
}

void offload_stage_print(int stage, int offload_number, ...)
{
    std::string buf;
    std::stringstream ss;
    char const *str1;
    char const *str2;
    va_list va_args;
    va_start(va_args, offload_number);
    va_arg(va_args, char*);

    switch (stage) {
        case c_offload_start:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_start);
            offload_stage(ss, offload_number, str1, str2, true);
            break;
        case c_offload_init:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_init);
            offload_stage(ss, offload_number, str1, str2, false);
            ss << " " << report_get_message_str(c_report_logical_card);
            ss << " " << va_arg(va_args, int);
            ss << " = " << report_get_message_str(c_report_physical_card);
            ss << " " << va_arg(va_args, int);
            break;
        case c_offload_register:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_register);
            offload_stage(ss, offload_number, str1, str2, true);
            break;
        case c_offload_init_func:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_init_func);
            offload_stage(ss, offload_number, str1, str2, true);
            ss << ": " << va_arg(va_args, char*);
            break;
        case c_offload_create_buf_host:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_create_buf_host);
            offload_stage(ss, offload_number, str1, str2, true);
            ss << ": base=0x" << std::hex << va_arg(va_args, uint64_t);
            ss << " length=" << std::dec << va_arg(va_args, uint64_t);
            break;
        case c_offload_create_buf_mic:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_create_buf_mic);
            offload_stage(ss, offload_number, str1, str2, true);
            ss << ": size=" << va_arg(va_args, uint64_t);
            ss << " offset=" << va_arg(va_args, int);
            if (va_arg(va_args,int))
               ss << " (2M page)";
            break;
        case c_offload_send_pointer_data:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_send_pointer_data);
            offload_stage(ss, offload_number, str1, str2, true);
            break;
        case c_offload_sent_pointer_data:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_sent_pointer_data);
            offload_stage(ss, offload_number, str1, str2, true);
            ss << " " << va_arg(va_args, uint64_t);
            break;
        case c_offload_gather_copyin_data:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_gather_copyin_data);
            offload_stage(ss, offload_number, str1, str2, true);
            break;
        case c_offload_copyin_data:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_copyin_data);
            offload_stage(ss, offload_number, str1, str2, true);
            ss << " " << va_arg(va_args, uint64_t) << " ";
            break;
        case c_offload_compute:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_compute);
            offload_stage(ss, offload_number, str1, str2, true);
            break;
        case c_offload_receive_pointer_data:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_receive_pointer_data);
            offload_stage(ss, offload_number, str1, str2, true);
            break;
        case c_offload_received_pointer_data:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_received_pointer_data);
            offload_stage(ss, offload_number, str1, str2, true);
            ss << " " << va_arg(va_args, uint64_t);
            break;
        case c_offload_start_target_func:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_start_target_func);
            offload_stage(ss, offload_number, str1, str2, true);
            ss << ": " << va_arg(va_args, char*);
            break;
        case c_offload_var:
            str1 = report_get_message_str(c_report_var);
            offload_stage(ss, offload_number, str1, "  ", true);
            va_arg(va_args, int);
            ss << va_arg(va_args, char*);
            ss << " " << " " << va_arg(va_args, char*);
            break;
        case c_offload_scatter_copyin_data:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_scatter_copyin_data);
            offload_stage(ss, offload_number, str1, str2, true);
            break;
        case c_offload_gather_copyout_data:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_gather_copyout_data);
            offload_stage(ss, offload_number, str1, str2, true);
            break;
        case c_offload_scatter_copyout_data:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_scatter_copyout_data);
            offload_stage(ss, offload_number, str1, str2, true);
            break;
        case c_offload_copyout_data:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_copyout_data);
            offload_stage(ss, offload_number, str1, str2, true);
            ss << "   " << va_arg(va_args, uint64_t);
            break;
        case c_offload_signal:
            {
                uint64_t  *signal;
                str1 = report_get_message_str(c_report_state_signal);
                str2 = report_get_message_str(c_report_signal);
                offload_message_2str(ss, offload_number, str1, str2);
                signal = va_arg(va_args, uint64_t*);
                if (signal)
                    ss << " 0x" << std::hex << *signal;
                else
                    ss << " none";
            }
            break;
        case c_offload_stream:
            {
                int64_t  stream;
                str1 = report_get_message_str(c_report_state_stream);
                str2 = report_get_message_str(c_report_stream);
                offload_message_2str(ss, offload_number, str1, str2);
                stream = va_arg(va_args, int64_t);
                if (stream)
                    ss << " 0x" << std::hex << stream;
                else
                    ss << " none";
            }
            break;
        case c_offload_wait:
            {
                int count;
                OffloadWaitKind kind;
                uint64_t  **signal;
                kind = (enum OffloadWaitKind) va_arg(va_args, int);
                // kind ==  c_offload_wait_signal for signal;
                // other kinds are for stream
                if (kind == c_offload_wait_signal) {
                    str1 = report_get_message_str(c_report_state_signal);
                }
                else {
                    str1 = report_get_message_str(c_report_state_stream);
                }
                str2 = report_get_message_str(c_report_wait);
                offload_message_2str(ss, offload_number, str1, str2);
                count = va_arg(va_args, int);
                signal = va_arg(va_args, uint64_t**);
                if (count) {
                    if (kind == c_offload_wait_signal) {
                        while (count) {
                            ss << " " << std::hex << signal[count-1];
                            count--;
                        }
                    }
                    else if (kind == c_offload_wait_stream) {
                        ss << signal;
                    }
                    else {
                        ss << " all";
                    }
                }
                else
                    ss << " none";
            }
            break;
        case c_offload_unregister:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_unregister);
            offload_stage(ss, offload_number, str1, str2, false);
            break;
        case c_offload_destroy:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_destroy);
            offload_stage(ss, offload_number, str1, str2, true);
            break;
        case c_offload_myoinit:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myoinit);
            offload_stage(ss, offload_number, str1, str2, false);
            break;
        case c_offload_myoregister:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myoregister);
            offload_stage(ss, offload_number, str1, str2, false);
            break;
        case c_offload_myofini:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myofini);
            offload_stage(ss, offload_number, str1, str2, false);
            break;
        case c_offload_mic_myo_shared:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_mic_myo_shared);
            offload_stage(ss, offload_number, str1, str2, false);
            ss << " " << va_arg(va_args, char*);
            break;
        case c_offload_mic_myo_fptr:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_mic_myo_fptr);
            offload_stage(ss, offload_number, str1, str2, false);
            ss << " " << va_arg(va_args, char*);
            break;
        case c_offload_myosharedmalloc:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myosharedmalloc);
            offload_stage(ss, offload_number, str1, str2, false);
            va_arg(va_args, char*);
            ss << " " << va_arg(va_args, size_t);
            break;
        case c_offload_myosharedfree:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myosharedfree);
            offload_stage(ss, offload_number, str1, str2, false);
            break;
        case c_offload_myosharedalignedmalloc:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myosharedalignedmalloc);
            offload_stage(ss, offload_number, str1, str2, false);
            va_arg(va_args, char*);
            ss << " " << va_arg(va_args, size_t);
            ss << " " << va_arg(va_args, size_t);
            break;
        case c_offload_myosharedalignedfree:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myosharedalignedfree);
            offload_stage(ss, offload_number, str1, str2, false);
            ss << " " << va_arg(va_args, size_t);
            break;
        case c_offload_myoacquire:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myoacquire);
            offload_stage(ss, offload_number, str1, str2, false);
            break;
        case c_offload_myorelease:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myorelease);
            offload_stage(ss, offload_number, str1, str2, false);
            break;
        case c_offload_myosupportsfeature:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myosupportsfeature);
            offload_stage(ss, offload_number, str1, str2, false);
            va_arg(va_args, int);
            ss << " " << va_arg(va_args, int);
            ss << " " << va_arg(va_args, int);
            ss << " " << va_arg(va_args, int);
            break;
        case c_offload_myosharedarenacreate:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myosharedarenacreate);
            offload_stage(ss, offload_number, str1, str2, false);
            va_arg(va_args, char*);
            ss << " " << va_arg(va_args, int);
            ss << " " << va_arg(va_args, int);
            ss << " " << va_arg(va_args, unsigned int);
            break;
        case c_offload_myosharedalignedarenamalloc:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myosharedalignedarenamalloc);
            offload_stage(ss, offload_number, str1, str2, false);
            va_arg(va_args, char*);
            ss << " " << va_arg(va_args, int);
            ss << " " << va_arg(va_args, size_t);
            ss << " " << va_arg(va_args, size_t);
            break;
        case c_offload_myosharedalignedarenafree:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myosharedalignedarenafree);
            offload_stage(ss, offload_number, str1, str2, false);
            va_arg(va_args, char*);
            ss << " " << va_arg(va_args, int);
            ss << " " << va_arg(va_args, size_t);
            break;
        case c_offload_myoarenaacquire:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myoarenaacquire);
            offload_stage(ss, offload_number, str1, str2, false);
            va_arg(va_args, char*);
            ss << " " << va_arg(va_args, int);
            break;
        case c_offload_myoarenarelease:
            str1 = report_get_message_str(c_report_state);
            str2 = report_get_message_str(c_report_myoarenarelease);
            offload_stage(ss, offload_number, str1, str2, false);
            va_arg(va_args, char*);
            ss << " " << va_arg(va_args, int);
            break;
        default:
            LIBOFFLOAD_ERROR(c_report_unknown_trace_node);
            abort();
    }
    ss << "\n";
    buf = ss.str();
    fprintf(stdout, buf.data());
    fflush(stdout);

    va_end(va_args);
    return;
}
