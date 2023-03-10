//===-- sanitizer_coverage_interface.inc ----------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
// Sanitizer Coverage interface list.
//===----------------------------------------------------------------------===//
INTERFACE_FUNCTION(__sanitizer_cov_dump)
INTERFACE_FUNCTION(__sanitizer_cov_reset)
INTERFACE_FUNCTION(__sanitizer_dump_coverage)
INTERFACE_FUNCTION(__sanitizer_dump_trace_pc_guard_coverage)
INTERFACE_WEAK_FUNCTION(__sancov_default_options)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_cmp)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_cmp1)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_cmp2)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_cmp4)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_cmp8)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_const_cmp1)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_const_cmp2)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_const_cmp4)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_const_cmp8)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_div4)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_div8)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_gep)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_pc_guard)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_pc_guard_init)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_pc_indir)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_trace_switch)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_8bit_counters_init)
INTERFACE_WEAK_FUNCTION(__sanitizer_cov_pcs_init)
