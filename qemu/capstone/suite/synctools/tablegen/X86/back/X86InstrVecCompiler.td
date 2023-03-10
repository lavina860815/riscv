//===- X86InstrVecCompiler.td - Vector Compiler Patterns ---*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file describes the various vector pseudo instructions used by the
// compiler, as well as Pat patterns used during instruction selection.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// No op bitconverts
//===----------------------------------------------------------------------===//

// Bitcasts between 128-bit vector types. Return the original type since
// no instruction is needed for the conversion
def : Pat<(v2i64 (bitconvert (v4i32 VR128:$src))), (v2i64 VR128:$src)>;
def : Pat<(v2i64 (bitconvert (v8i16 VR128:$src))), (v2i64 VR128:$src)>;
def : Pat<(v2i64 (bitconvert (v16i8 VR128:$src))), (v2i64 VR128:$src)>;
def : Pat<(v2i64 (bitconvert (v2f64 VR128:$src))), (v2i64 VR128:$src)>;
def : Pat<(v2i64 (bitconvert (v4f32 VR128:$src))), (v2i64 VR128:$src)>;
def : Pat<(v4i32 (bitconvert (v2i64 VR128:$src))), (v4i32 VR128:$src)>;
def : Pat<(v4i32 (bitconvert (v8i16 VR128:$src))), (v4i32 VR128:$src)>;
def : Pat<(v4i32 (bitconvert (v16i8 VR128:$src))), (v4i32 VR128:$src)>;
def : Pat<(v4i32 (bitconvert (v2f64 VR128:$src))), (v4i32 VR128:$src)>;
def : Pat<(v4i32 (bitconvert (v4f32 VR128:$src))), (v4i32 VR128:$src)>;
def : Pat<(v8i16 (bitconvert (v2i64 VR128:$src))), (v8i16 VR128:$src)>;
def : Pat<(v8i16 (bitconvert (v4i32 VR128:$src))), (v8i16 VR128:$src)>;
def : Pat<(v8i16 (bitconvert (v16i8 VR128:$src))), (v8i16 VR128:$src)>;
def : Pat<(v8i16 (bitconvert (v2f64 VR128:$src))), (v8i16 VR128:$src)>;
def : Pat<(v8i16 (bitconvert (v4f32 VR128:$src))), (v8i16 VR128:$src)>;
def : Pat<(v16i8 (bitconvert (v2i64 VR128:$src))), (v16i8 VR128:$src)>;
def : Pat<(v16i8 (bitconvert (v4i32 VR128:$src))), (v16i8 VR128:$src)>;
def : Pat<(v16i8 (bitconvert (v8i16 VR128:$src))), (v16i8 VR128:$src)>;
def : Pat<(v16i8 (bitconvert (v2f64 VR128:$src))), (v16i8 VR128:$src)>;
def : Pat<(v16i8 (bitconvert (v4f32 VR128:$src))), (v16i8 VR128:$src)>;
def : Pat<(v4f32 (bitconvert (v2i64 VR128:$src))), (v4f32 VR128:$src)>;
def : Pat<(v4f32 (bitconvert (v4i32 VR128:$src))), (v4f32 VR128:$src)>;
def : Pat<(v4f32 (bitconvert (v8i16 VR128:$src))), (v4f32 VR128:$src)>;
def : Pat<(v4f32 (bitconvert (v16i8 VR128:$src))), (v4f32 VR128:$src)>;
def : Pat<(v4f32 (bitconvert (v2f64 VR128:$src))), (v4f32 VR128:$src)>;
def : Pat<(v2f64 (bitconvert (v2i64 VR128:$src))), (v2f64 VR128:$src)>;
def : Pat<(v2f64 (bitconvert (v4i32 VR128:$src))), (v2f64 VR128:$src)>;
def : Pat<(v2f64 (bitconvert (v8i16 VR128:$src))), (v2f64 VR128:$src)>;
def : Pat<(v2f64 (bitconvert (v16i8 VR128:$src))), (v2f64 VR128:$src)>;
def : Pat<(v2f64 (bitconvert (v4f32 VR128:$src))), (v2f64 VR128:$src)>;

// Bitcasts between 256-bit vector types. Return the original type since
// no instruction is needed for the conversion
def : Pat<(v4i64  (bitconvert (v8i32  VR256:$src))), (v4i64  VR256:$src)>;
def : Pat<(v4i64  (bitconvert (v16i16 VR256:$src))), (v4i64  VR256:$src)>;
def : Pat<(v4i64  (bitconvert (v32i8  VR256:$src))), (v4i64  VR256:$src)>;
def : Pat<(v4i64  (bitconvert (v8f32  VR256:$src))), (v4i64  VR256:$src)>;
def : Pat<(v4i64  (bitconvert (v4f64  VR256:$src))), (v4i64  VR256:$src)>;
def : Pat<(v8i32  (bitconvert (v4i64  VR256:$src))), (v8i32  VR256:$src)>;
def : Pat<(v8i32  (bitconvert (v16i16 VR256:$src))), (v8i32  VR256:$src)>;
def : Pat<(v8i32  (bitconvert (v32i8  VR256:$src))), (v8i32  VR256:$src)>;
def : Pat<(v8i32  (bitconvert (v4f64  VR256:$src))), (v8i32  VR256:$src)>;
def : Pat<(v8i32  (bitconvert (v8f32  VR256:$src))), (v8i32  VR256:$src)>;
def : Pat<(v16i16 (bitconvert (v4i64  VR256:$src))), (v16i16 VR256:$src)>;
def : Pat<(v16i16 (bitconvert (v8i32  VR256:$src))), (v16i16 VR256:$src)>;
def : Pat<(v16i16 (bitconvert (v32i8  VR256:$src))), (v16i16 VR256:$src)>;
def : Pat<(v16i16 (bitconvert (v4f64  VR256:$src))), (v16i16 VR256:$src)>;
def : Pat<(v16i16 (bitconvert (v8f32  VR256:$src))), (v16i16 VR256:$src)>;
def : Pat<(v32i8  (bitconvert (v4i64  VR256:$src))), (v32i8  VR256:$src)>;
def : Pat<(v32i8  (bitconvert (v8i32  VR256:$src))), (v32i8  VR256:$src)>;
def : Pat<(v32i8  (bitconvert (v16i16 VR256:$src))), (v32i8  VR256:$src)>;
def : Pat<(v32i8  (bitconvert (v4f64  VR256:$src))), (v32i8  VR256:$src)>;
def : Pat<(v32i8  (bitconvert (v8f32  VR256:$src))), (v32i8  VR256:$src)>;
def : Pat<(v8f32  (bitconvert (v4i64  VR256:$src))), (v8f32  VR256:$src)>;
def : Pat<(v8f32  (bitconvert (v8i32  VR256:$src))), (v8f32  VR256:$src)>;
def : Pat<(v8f32  (bitconvert (v16i16 VR256:$src))), (v8f32  VR256:$src)>;
def : Pat<(v8f32  (bitconvert (v32i8  VR256:$src))), (v8f32  VR256:$src)>;
def : Pat<(v8f32  (bitconvert (v4f64  VR256:$src))), (v8f32  VR256:$src)>;
def : Pat<(v4f64  (bitconvert (v4i64  VR256:$src))), (v4f64  VR256:$src)>;
def : Pat<(v4f64  (bitconvert (v8i32  VR256:$src))), (v4f64  VR256:$src)>;
def : Pat<(v4f64  (bitconvert (v16i16 VR256:$src))), (v4f64  VR256:$src)>;
def : Pat<(v4f64  (bitconvert (v32i8  VR256:$src))), (v4f64  VR256:$src)>;
def : Pat<(v4f64  (bitconvert (v8f32  VR256:$src))), (v4f64  VR256:$src)>;

// Bitcasts between 512-bit vector types. Return the original type since
// no instruction is needed for the conversion.
def : Pat<(v8f64  (bitconvert (v8i64  VR512:$src))), (v8f64  VR512:$src)>;
def : Pat<(v8f64  (bitconvert (v16i32 VR512:$src))), (v8f64  VR512:$src)>;
def : Pat<(v8f64  (bitconvert (v32i16 VR512:$src))), (v8f64  VR512:$src)>;
def : Pat<(v8f64  (bitconvert (v64i8  VR512:$src))), (v8f64  VR512:$src)>;
def : Pat<(v8f64  (bitconvert (v16f32 VR512:$src))), (v8f64  VR512:$src)>;
def : Pat<(v16f32 (bitconvert (v8i64  VR512:$src))), (v16f32 VR512:$src)>;
def : Pat<(v16f32 (bitconvert (v16i32 VR512:$src))), (v16f32 VR512:$src)>;
def : Pat<(v16f32 (bitconvert (v32i16 VR512:$src))), (v16f32 VR512:$src)>;
def : Pat<(v16f32 (bitconvert (v64i8  VR512:$src))), (v16f32 VR512:$src)>;
def : Pat<(v16f32 (bitconvert (v8f64  VR512:$src))), (v16f32 VR512:$src)>;
def : Pat<(v8i64  (bitconvert (v16i32 VR512:$src))), (v8i64  VR512:$src)>;
def : Pat<(v8i64  (bitconvert (v32i16 VR512:$src))), (v8i64  VR512:$src)>;
def : Pat<(v8i64  (bitconvert (v64i8  VR512:$src))), (v8i64  VR512:$src)>;
def : Pat<(v8i64  (bitconvert (v8f64  VR512:$src))), (v8i64  VR512:$src)>;
def : Pat<(v8i64  (bitconvert (v16f32 VR512:$src))), (v8i64  VR512:$src)>;
def : Pat<(v16i32 (bitconvert (v8i64  VR512:$src))), (v16i32 VR512:$src)>;
def : Pat<(v16i32 (bitconvert (v16f32 VR512:$src))), (v16i32 VR512:$src)>;
def : Pat<(v16i32 (bitconvert (v32i16 VR512:$src))), (v16i32 VR512:$src)>;
def : Pat<(v16i32 (bitconvert (v64i8  VR512:$src))), (v16i32 VR512:$src)>;
def : Pat<(v16i32 (bitconvert (v8f64  VR512:$src))), (v16i32 VR512:$src)>;
def : Pat<(v32i16 (bitconvert (v8i64  VR512:$src))), (v32i16 VR512:$src)>;
def : Pat<(v32i16 (bitconvert (v16i32 VR512:$src))), (v32i16 VR512:$src)>;
def : Pat<(v32i16 (bitconvert (v64i8  VR512:$src))), (v32i16 VR512:$src)>;
def : Pat<(v32i16 (bitconvert (v8f64  VR512:$src))), (v32i16 VR512:$src)>;
def : Pat<(v32i16 (bitconvert (v16f32 VR512:$src))), (v32i16 VR512:$src)>;
def : Pat<(v64i8  (bitconvert (v8i64  VR512:$src))), (v64i8  VR512:$src)>;
def : Pat<(v64i8  (bitconvert (v16i32 VR512:$src))), (v64i8  VR512:$src)>;
def : Pat<(v64i8  (bitconvert (v32i16 VR512:$src))), (v64i8  VR512:$src)>;
def : Pat<(v64i8  (bitconvert (v8f64  VR512:$src))), (v64i8  VR512:$src)>;
def : Pat<(v64i8  (bitconvert (v16f32 VR512:$src))), (v64i8  VR512:$src)>;


//===----------------------------------------------------------------------===//
//  Non-instruction patterns
//===----------------------------------------------------------------------===//

// A vector extract of the first f32/f64 position is a subregister copy
def : Pat<(f32 (extractelt (v4f32 VR128:$src), (iPTR 0))),
          (COPY_TO_REGCLASS (v4f32 VR128:$src), FR32)>;
def : Pat<(f64 (extractelt (v2f64 VR128:$src), (iPTR 0))),
          (COPY_TO_REGCLASS (v2f64 VR128:$src), FR64)>;

// Implicitly promote a 32-bit scalar to a vector.
def : Pat<(v4f32 (scalar_to_vector FR32:$src)),
          (COPY_TO_REGCLASS FR32:$src, VR128)>;
// Implicitly promote a 64-bit scalar to a vector.
def : Pat<(v2f64 (scalar_to_vector FR64:$src)),
          (COPY_TO_REGCLASS FR64:$src, VR128)>;


//===----------------------------------------------------------------------===//
// Subvector tricks
//===----------------------------------------------------------------------===//

// Patterns for insert_subvector/extract_subvector to/from index=0
multiclass subvector_subreg_lowering<RegisterClass subRC, ValueType subVT,
                                     RegisterClass RC, ValueType VT,
                                     SubRegIndex subIdx> {
  def : Pat<(subVT (extract_subvector (VT RC:$src), (iPTR 0))),
            (subVT (EXTRACT_SUBREG RC:$src, subIdx))>;

  def : Pat<(VT (insert_subvector undef, subRC:$src, (iPTR 0))),
            (VT (INSERT_SUBREG (IMPLICIT_DEF), subRC:$src, subIdx))>;
}

// A 128-bit subvector extract from the first 256-bit vector position is a
// subregister copy that needs no instruction. Likewise, a 128-bit subvector
// insert to the first 256-bit vector position is a subregister copy that needs
// no instruction.
defm : subvector_subreg_lowering<VR128, v4i32, VR256, v8i32,  sub_xmm>;
defm : subvector_subreg_lowering<VR128, v4f32, VR256, v8f32,  sub_xmm>;
defm : subvector_subreg_lowering<VR128, v2i64, VR256, v4i64,  sub_xmm>;
defm : subvector_subreg_lowering<VR128, v2f64, VR256, v4f64,  sub_xmm>;
defm : subvector_subreg_lowering<VR128, v8i16, VR256, v16i16, sub_xmm>;
defm : subvector_subreg_lowering<VR128, v16i8, VR256, v32i8,  sub_xmm>;

// A 128-bit subvector extract from the first 512-bit vector position is a
// subregister copy that needs no instruction. Likewise, a 128-bit subvector
// insert to the first 512-bit vector position is a subregister copy that needs
// no instruction.
defm : subvector_subreg_lowering<VR128, v4i32, VR512, v16i32, sub_xmm>;
defm : subvector_subreg_lowering<VR128, v4f32, VR512, v16f32, sub_xmm>;
defm : subvector_subreg_lowering<VR128, v2i64, VR512, v8i64,  sub_xmm>;
defm : subvector_subreg_lowering<VR128, v2f64, VR512, v8f64,  sub_xmm>;
defm : subvector_subreg_lowering<VR128, v8i16, VR512, v32i16, sub_xmm>;
defm : subvector_subreg_lowering<VR128, v16i8, VR512, v64i8,  sub_xmm>;

// A 128-bit subvector extract from the first 512-bit vector position is a
// subregister copy that needs no instruction. Likewise, a 128-bit subvector
// insert to the first 512-bit vector position is a subregister copy that needs
// no instruction.
defm : subvector_subreg_lowering<VR256, v8i32,  VR512, v16i32, sub_ymm>;
defm : subvector_subreg_lowering<VR256, v8f32,  VR512, v16f32, sub_ymm>;
defm : subvector_subreg_lowering<VR256, v4i64,  VR512, v8i64,  sub_ymm>;
defm : subvector_subreg_lowering<VR256, v4f64,  VR512, v8f64,  sub_ymm>;
defm : subvector_subreg_lowering<VR256, v16i16, VR512, v32i16, sub_ymm>;
defm : subvector_subreg_lowering<VR256, v32i8,  VR512, v64i8,  sub_ymm>;


multiclass subvector_store_lowering<string AlignedStr, string UnalignedStr,
                                    RegisterClass RC, ValueType DstTy,
                                    ValueType SrcTy, SubRegIndex SubIdx> {
  def : Pat<(alignedstore (DstTy (extract_subvector
                                  (SrcTy RC:$src), (iPTR 0))), addr:$dst),
            (!cast<Instruction>("VMOV"#AlignedStr#"mr") addr:$dst,
             (DstTy (EXTRACT_SUBREG RC:$src, SubIdx)))>;

  def : Pat<(store (DstTy (extract_subvector
                           (SrcTy RC:$src), (iPTR 0))), addr:$dst),
            (!cast<Instruction>("VMOV"#UnalignedStr#"mr") addr:$dst,
             (DstTy (EXTRACT_SUBREG RC:$src, SubIdx)))>;
}

let Predicates = [HasAVX, NoVLX] in {
  defm : subvector_store_lowering<"APD", "UPD", VR256X, v2f64, v4f64,  sub_xmm>;
  defm : subvector_store_lowering<"APS", "UPS", VR256X, v4f32, v8f32,  sub_xmm>;
  defm : subvector_store_lowering<"DQA", "DQU", VR256X, v2i64, v4i64,  sub_xmm>;
  defm : subvector_store_lowering<"DQA", "DQU", VR256X, v4i32, v8i32,  sub_xmm>;
  defm : subvector_store_lowering<"DQA", "DQU", VR256X, v8i16, v16i16, sub_xmm>;
  defm : subvector_store_lowering<"DQA", "DQU", VR256X, v16i8, v32i8,  sub_xmm>;
}

let Predicates = [HasVLX] in {
  // Special patterns for storing subvector extracts of lower 128-bits
  // Its cheaper to just use VMOVAPS/VMOVUPS instead of VEXTRACTF128mr
  defm : subvector_store_lowering<"APDZ128", "UPDZ128", VR256X, v2f64, v4f64,
                                  sub_xmm>;
  defm : subvector_store_lowering<"APSZ128", "UPSZ128", VR256X, v4f32, v8f32,
                                  sub_xmm>;
  defm : subvector_store_lowering<"DQA64Z128", "DQU64Z128", VR256X, v2i64,
                                  v4i64, sub_xmm>;
  defm : subvector_store_lowering<"DQA64Z128", "DQU64Z128", VR256X, v4i32,
                                  v8i32, sub_xmm>;
  defm : subvector_store_lowering<"DQA64Z128", "DQU64Z128", VR256X, v8i16,
                                  v16i16, sub_xmm>;
  defm : subvector_store_lowering<"DQA64Z128", "DQU64Z128", VR256X, v16i8,
                                  v32i8, sub_xmm>;

  // Special patterns for storing subvector extracts of lower 128-bits of 512.
  // Its cheaper to just use VMOVAPS/VMOVUPS instead of VEXTRACTF128mr
  defm : subvector_store_lowering<"APDZ128", "UPDZ128", VR512, v2f64, v8f64,
                                  sub_xmm>;
  defm : subvector_store_lowering<"APSZ128", "UPSZ128", VR512, v4f32, v16f32,
                                  sub_xmm>;
  defm : subvector_store_lowering<"DQA64Z128", "DQU64Z128", VR512, v2i64,
                                  v8i64, sub_xmm>;
  defm : subvector_store_lowering<"DQA64Z128", "DQU64Z128", VR512, v4i32,
                                  v16i32, sub_xmm>;
  defm : subvector_store_lowering<"DQA64Z128", "DQU64Z128", VR512, v8i16,
                                  v32i16, sub_xmm>;
  defm : subvector_store_lowering<"DQA64Z128", "DQU64Z128", VR512, v16i8,
                                  v64i8, sub_xmm>;

  // Special patterns for storing subvector extracts of lower 256-bits of 512.
  // Its cheaper to just use VMOVAPS/VMOVUPS instead of VEXTRACTF128mr
  defm : subvector_store_lowering<"APDZ256", "UPDZ256", VR512, v4f64, v8f64,
                                  sub_ymm>;
  defm : subvector_store_lowering<"APSZ256", "UPSZ256", VR512, v8f32, v16f32,
                                  sub_ymm>;
  defm : subvector_store_lowering<"DQA64Z256", "DQU64Z256", VR512, v4i64,
                                  v8i64, sub_ymm>;
  defm : subvector_store_lowering<"DQA64Z256", "DQU64Z256", VR512, v8i32,
                                  v16i32, sub_ymm>;
  defm : subvector_store_lowering<"DQA64Z256", "DQU64Z256", VR512, v16i16,
                                  v32i16, sub_ymm>;
  defm : subvector_store_lowering<"DQA64Z256", "DQU64Z256", VR512, v32i8,
                                  v64i8, sub_ymm>;
}

// If we're inserting into an all zeros vector, just use a plain move which
// will zero the upper bits. A post-isel hook will take care of removing
// any moves that we can prove are unnecessary.
multiclass subvec_zero_lowering<string MoveStr,
                                RegisterClass RC, ValueType DstTy,
                                ValueType SrcTy, ValueType ZeroTy,
                                SubRegIndex SubIdx> {
  def : Pat<(DstTy (insert_subvector (bitconvert (ZeroTy immAllZerosV)),
                                     (SrcTy RC:$src), (iPTR 0))),
            (SUBREG_TO_REG (i64 0),
             (SrcTy (!cast<Instruction>("VMOV"#MoveStr#"rr") RC:$src)), SubIdx)>;
}

let Predicates = [HasAVX, NoVLX] in {
  defm : subvec_zero_lowering<"APD", VR128, v4f64, v2f64, v8i32, sub_xmm>;
  defm : subvec_zero_lowering<"APS", VR128, v8f32, v4f32, v8i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA", VR128, v4i64, v2i64, v8i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA", VR128, v8i32, v4i32, v8i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA", VR128, v16i16, v8i16, v8i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA", VR128, v32i8, v16i8, v8i32, sub_xmm>;
}

let Predicates = [HasVLX] in {
  defm : subvec_zero_lowering<"APDZ128", VR128X, v4f64, v2f64, v8i32, sub_xmm>;
  defm : subvec_zero_lowering<"APSZ128", VR128X, v8f32, v4f32, v8i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA64Z128", VR128X, v4i64, v2i64, v8i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA64Z128", VR128X, v8i32, v4i32, v8i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA64Z128", VR128X, v16i16, v8i16, v8i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA64Z128", VR128X, v32i8, v16i8, v8i32, sub_xmm>;

  defm : subvec_zero_lowering<"APDZ128", VR128X, v8f64, v2f64, v16i32, sub_xmm>;
  defm : subvec_zero_lowering<"APSZ128", VR128X, v16f32, v4f32, v16i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA64Z128", VR128X, v8i64, v2i64, v16i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA64Z128", VR128X, v16i32, v4i32, v16i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA64Z128", VR128X, v32i16, v8i16, v16i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA64Z128", VR128X, v64i8, v16i8, v16i32, sub_xmm>;

  defm : subvec_zero_lowering<"APDZ256", VR256X, v8f64, v4f64, v16i32, sub_ymm>;
  defm : subvec_zero_lowering<"APSZ256", VR256X, v16f32, v8f32, v16i32, sub_ymm>;
  defm : subvec_zero_lowering<"DQA64Z256", VR256X, v8i64, v4i64, v16i32, sub_ymm>;
  defm : subvec_zero_lowering<"DQA64Z256", VR256X, v16i32, v8i32, v16i32, sub_ymm>;
  defm : subvec_zero_lowering<"DQA64Z256", VR256X, v32i16, v16i16, v16i32, sub_ymm>;
  defm : subvec_zero_lowering<"DQA64Z256", VR256X, v64i8, v32i8, v16i32, sub_ymm>;
}

let Predicates = [HasAVX512, NoVLX] in {
  defm : subvec_zero_lowering<"APD", VR128, v8f64, v2f64, v16i32, sub_xmm>;
  defm : subvec_zero_lowering<"APS", VR128, v16f32, v4f32, v16i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA", VR128, v8i64, v2i64, v16i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA", VR128, v16i32, v4i32, v16i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA", VR128, v32i16, v8i16, v16i32, sub_xmm>;
  defm : subvec_zero_lowering<"DQA", VR128, v64i8, v16i8, v16i32, sub_xmm>;

  defm : subvec_zero_lowering<"APDY", VR256, v8f64, v4f64, v16i32, sub_ymm>;
  defm : subvec_zero_lowering<"APSY", VR256, v16f32, v8f32, v16i32, sub_ymm>;
  defm : subvec_zero_lowering<"DQAY", VR256, v8i64, v4i64, v16i32, sub_ymm>;
  defm : subvec_zero_lowering<"DQAY", VR256, v16i32, v8i32, v16i32, sub_ymm>;
  defm : subvec_zero_lowering<"DQAY", VR256, v32i16, v16i16, v16i32, sub_ymm>;
  defm : subvec_zero_lowering<"DQAY", VR256, v64i8, v32i8, v16i32, sub_ymm>;
}

class maskzeroupper<ValueType vt, RegisterClass RC> :
  PatLeaf<(vt RC:$src), [{
    return isMaskZeroExtended(N);
  }]>;

def maskzeroupperv1i1  : maskzeroupper<v1i1,  VK1>;
def maskzeroupperv2i1  : maskzeroupper<v2i1,  VK2>;
def maskzeroupperv4i1  : maskzeroupper<v4i1,  VK4>;
def maskzeroupperv8i1  : maskzeroupper<v8i1,  VK8>;
def maskzeroupperv16i1 : maskzeroupper<v16i1, VK16>;
def maskzeroupperv32i1 : maskzeroupper<v32i1, VK32>;

// The patterns determine if we can depend on the upper bits of a mask register
// being zeroed by the previous operation so that we can skip explicit
// zeroing.
let Predicates = [HasBWI] in {
  def : Pat<(v32i1 (insert_subvector (v32i1 immAllZerosV),
                                     maskzeroupperv1i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK1:$src, VK32)>;
  def : Pat<(v32i1 (insert_subvector (v32i1 immAllZerosV),
                                     maskzeroupperv8i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK8:$src, VK32)>;
  def : Pat<(v32i1 (insert_subvector (v32i1 immAllZerosV),
                                     maskzeroupperv16i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK16:$src, VK32)>;

  def : Pat<(v64i1 (insert_subvector (v64i1 immAllZerosV),
                                     maskzeroupperv1i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK1:$src, VK64)>;
  def : Pat<(v64i1 (insert_subvector (v64i1 immAllZerosV),
                                     maskzeroupperv8i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK8:$src, VK64)>;
  def : Pat<(v64i1 (insert_subvector (v64i1 immAllZerosV),
                                     maskzeroupperv16i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK16:$src, VK64)>;
  def : Pat<(v64i1 (insert_subvector (v64i1 immAllZerosV),
                                     maskzeroupperv32i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK32:$src, VK64)>;
}

let Predicates = [HasAVX512] in {
  def : Pat<(v16i1 (insert_subvector (v16i1 immAllZerosV),
                                     maskzeroupperv1i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK1:$src, VK16)>;
  def : Pat<(v16i1 (insert_subvector (v16i1 immAllZerosV),
                                     maskzeroupperv8i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK8:$src, VK16)>;
}

let Predicates = [HasDQI] in {
  def : Pat<(v8i1 (insert_subvector (v8i1 immAllZerosV),
                                    maskzeroupperv1i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK1:$src, VK8)>;
}

let Predicates = [HasVLX, HasDQI] in {
  def : Pat<(v8i1 (insert_subvector (v8i1 immAllZerosV),
                                    maskzeroupperv2i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK2:$src, VK8)>;
  def : Pat<(v8i1 (insert_subvector (v8i1 immAllZerosV),
                                    maskzeroupperv4i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK4:$src, VK8)>;
}

let Predicates = [HasVLX] in {
  def : Pat<(v16i1 (insert_subvector (v16i1 immAllZerosV),
                                     maskzeroupperv2i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK2:$src, VK16)>;
  def : Pat<(v16i1 (insert_subvector (v16i1 immAllZerosV),
                                     maskzeroupperv4i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK4:$src, VK16)>;
}

let Predicates = [HasBWI, HasVLX] in {
  def : Pat<(v32i1 (insert_subvector (v32i1 immAllZerosV),
                                     maskzeroupperv2i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK2:$src, VK32)>;
  def : Pat<(v32i1 (insert_subvector (v32i1 immAllZerosV),
                                     maskzeroupperv4i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK4:$src, VK32)>;
  def : Pat<(v64i1 (insert_subvector (v64i1 immAllZerosV),
                                     maskzeroupperv2i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK2:$src, VK64)>;
  def : Pat<(v64i1 (insert_subvector (v64i1 immAllZerosV),
                                     maskzeroupperv4i1:$src, (iPTR 0))),
            (COPY_TO_REGCLASS VK4:$src, VK64)>;
}

// If the bits are not zero we have to fall back to explicitly zeroing by
// using shifts.
let Predicates = [HasAVX512] in {
  def : Pat<(v16i1 (insert_subvector (v16i1 immAllZerosV),
                                     (v1i1 VK1:$mask), (iPTR 0))),
            (KSHIFTRWri (KSHIFTLWri (COPY_TO_REGCLASS VK1:$mask, VK16),
                                    (i8 15)), (i8 15))>;

  def : Pat<(v16i1 (insert_subvector (v16i1 immAllZerosV),
                                     (v2i1 VK2:$mask), (iPTR 0))),
            (KSHIFTRWri (KSHIFTLWri (COPY_TO_REGCLASS VK2:$mask, VK16),
                                    (i8 14)), (i8 14))>;

  def : Pat<(v16i1 (insert_subvector (v16i1 immAllZerosV),
                                     (v4i1 VK4:$mask), (iPTR 0))),
            (KSHIFTRWri (KSHIFTLWri (COPY_TO_REGCLASS VK4:$mask, VK16),
                                    (i8 12)), (i8 12))>;
}

let Predicates = [HasAVX512, NoDQI] in {
  def : Pat<(v16i1 (insert_subvector (v16i1 immAllZerosV),
                                     (v8i1 VK8:$mask), (iPTR 0))),
            (KSHIFTRWri (KSHIFTLWri (COPY_TO_REGCLASS VK8:$mask, VK16),
                                    (i8 8)), (i8 8))>;
}

let Predicates = [HasDQI] in {
  def : Pat<(v16i1 (insert_subvector (v16i1 immAllZerosV),
                                     (v8i1 VK8:$mask), (iPTR 0))),
            (COPY_TO_REGCLASS (KMOVBkk VK8:$mask), VK16)>;

  def : Pat<(v8i1 (insert_subvector (v8i1 immAllZerosV),
                                    (v1i1 VK1:$mask), (iPTR 0))),
            (KSHIFTRBri (KSHIFTLBri (COPY_TO_REGCLASS VK1:$mask, VK8),
                                    (i8 7)), (i8 7))>;
  def : Pat<(v8i1 (insert_subvector (v8i1 immAllZerosV),
                                    (v2i1 VK2:$mask), (iPTR 0))),
            (KSHIFTRBri (KSHIFTLBri (COPY_TO_REGCLASS VK2:$mask, VK8),
                                    (i8 6)), (i8 6))>;
  def : Pat<(v8i1 (insert_subvector (v8i1 immAllZerosV),
                                    (v4i1 VK4:$mask), (iPTR 0))),
            (KSHIFTRBri (KSHIFTLBri (COPY_TO_REGCLASS VK4:$mask, VK8),
                                    (i8 4)), (i8 4))>;
}

let Predicates = [HasBWI] in {
  def : Pat<(v32i1 (insert_subvector (v32i1 immAllZerosV),
                                     (v16i1 VK16:$mask), (iPTR 0))),
            (COPY_TO_REGCLASS (KMOVWkk VK16:$mask), VK32)>;

  def : Pat<(v64i1 (insert_subvector (v64i1 immAllZerosV),
                                     (v16i1 VK16:$mask), (iPTR 0))),
            (COPY_TO_REGCLASS (KMOVWkk VK16:$mask), VK64)>;
  def : Pat<(v64i1 (insert_subvector (v64i1 immAllZerosV),
                                     (v32i1 VK32:$mask), (iPTR 0))),
            (COPY_TO_REGCLASS (KMOVDkk VK32:$mask), VK64)>;
}

let Predicates = [HasBWI, NoDQI] in {
  def : Pat<(v32i1 (insert_subvector (v32i1 immAllZerosV),
                                     (v8i1 VK8:$mask), (iPTR 0))),
            (KSHIFTRDri (KSHIFTLDri (COPY_TO_REGCLASS VK8:$mask, VK32),
                                    (i8 24)), (i8 24))>;

  def : Pat<(v64i1 (insert_subvector (v64i1 immAllZerosV),
                                     (v8i1 VK8:$mask), (iPTR 0))),
            (KSHIFTRQri (KSHIFTLQri (COPY_TO_REGCLASS VK8:$mask, VK64),
                                    (i8 56)), (i8 56))>;
}

let Predicates = [HasBWI, HasDQI] in {
  def : Pat<(v32i1 (insert_subvector (v32i1 immAllZerosV),
                                     (v8i1 VK8:$mask), (iPTR 0))),
            (COPY_TO_REGCLASS (KMOVBkk VK8:$mask), VK32)>;

  def : Pat<(v64i1 (insert_subvector (v64i1 immAllZerosV),
                                     (v8i1 VK8:$mask), (iPTR 0))),
            (COPY_TO_REGCLASS (KMOVBkk VK8:$mask), VK64)>;
}

let Predicates = [HasBWI, HasVLX] in {
  def : Pat<(v32i1 (insert_subvector (v32i1 immAllZerosV),
                                     (v1i1 VK1:$mask), (iPTR 0))),
            (KSHIFTRDri (KSHIFTLDri (COPY_TO_REGCLASS VK1:$mask, VK32),
                                    (i8 31)), (i8 31))>;
  def : Pat<(v32i1 (insert_subvector (v32i1 immAllZerosV),
                                     (v2i1 VK2:$mask), (iPTR 0))),
            (KSHIFTRDri (KSHIFTLDri (COPY_TO_REGCLASS VK2:$mask, VK32),
                                    (i8 30)), (i8 30))>;
  def : Pat<(v32i1 (insert_subvector (v32i1 immAllZerosV),
                                     (v4i1 VK4:$mask), (iPTR 0))),
            (KSHIFTRDri (KSHIFTLDri (COPY_TO_REGCLASS VK4:$mask, VK32),
                                    (i8 28)), (i8 28))>;

  def : Pat<(v64i1 (insert_subvector (v64i1 immAllZerosV),
                                     (v1i1 VK1:$mask), (iPTR 0))),
            (KSHIFTRQri (KSHIFTLQri (COPY_TO_REGCLASS VK1:$mask, VK64),
                                    (i8 63)), (i8 63))>;
  def : Pat<(v64i1 (insert_subvector (v64i1 immAllZerosV),
                                     (v2i1 VK2:$mask), (iPTR 0))),
            (KSHIFTRQri (KSHIFTLQri (COPY_TO_REGCLASS VK2:$mask, VK64),
                                    (i8 62)), (i8 62))>;
  def : Pat<(v64i1 (insert_subvector (v64i1 immAllZerosV),
                                     (v4i1 VK4:$mask), (iPTR 0))),
            (KSHIFTRQri (KSHIFTLQri (COPY_TO_REGCLASS VK4:$mask, VK64),
                                    (i8 60)), (i8 60))>;
}
