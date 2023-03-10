// Copyright 2013 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package objabi

// This file defines the IDs for PCDATA and FUNCDATA instructions
// in Go binaries.
//
// These must agree with ../../../runtime/funcdata.h and
// ../../../runtime/symtab.go.

const (
	PCDATA_RegMapIndex   = 0
	PCDATA_StackMapIndex = 1
	PCDATA_InlTreeIndex  = 2

	FUNCDATA_ArgsPointerMaps    = 0
	FUNCDATA_LocalsPointerMaps  = 1
	FUNCDATA_RegPointerMaps     = 2
	FUNCDATA_StackObjects       = 3
	FUNCDATA_InlTree            = 4
	FUNCDATA_OpenCodedDeferInfo = 5

	// ArgsSizeUnknown is set in Func.argsize to mark all functions
	// whose argument size is unknown (C vararg functions, and
	// assembly code without an explicit specification).
	// This value is generated by the compiler, assembler, or linker.
	ArgsSizeUnknown = -0x80000000
)
