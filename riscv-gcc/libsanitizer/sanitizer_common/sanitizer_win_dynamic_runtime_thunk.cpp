//===-- santizer_win_dynamic_runtime_thunk.cpp ----------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines things that need to be present in the application modules
// to interact with Sanitizer Common, when it is included in a dll.
//
//===----------------------------------------------------------------------===//
#ifdef SANITIZER_DYNAMIC_RUNTIME_THUNK
#define SANITIZER_IMPORT_INTERFACE 1
#include "sanitizer_win_defs.h"
// Define weak alias for all weak functions imported from sanitizer common.
#define INTERFACE_FUNCTION(Name)
#define INTERFACE_WEAK_FUNCTION(Name) WIN_WEAK_IMPORT_DEF(Name)
#include "sanitizer_common_interface.inc"
#endif // SANITIZER_DYNAMIC_RUNTIME_THUNK

namespace __sanitizer {
// Add one, otherwise unused, external symbol to this object file so that the
// Visual C++ linker includes it and reads the .drective section.
void ForceWholeArchiveIncludeForSanitizerCommon() {}
}
