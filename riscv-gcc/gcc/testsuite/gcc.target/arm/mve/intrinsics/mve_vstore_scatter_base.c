/* { dg-require-effective-target arm_v8_1m_mve_fp_ok } */
/* { dg-add-options arm_v8_1m_mve_fp } */
/* { dg-additional-options "-O2" } */

#include "arm_mve.h"

int
foows32(uint32x4_t pDataDest, int32x4_t value, int32_t * ret)
{
    const uint32x4_t vecOffs1 = { 0, 3, 6, 1};
    const uint32x4_t vecOffs2 = { 4, 7, 2, 5};
    vstrwq_scatter_base_s32 (pDataDest, 4, value);
    vstrwq_scatter_base_s32 (pDataDest, 132, value);
    vstrwq_scatter_offset_s32 (ret, vecOffs1, (int32x4_t) pDataDest);
    vstrwq_scatter_offset_s32 (ret, vecOffs2, (int32x4_t) pDataDest);
    return 0;
}

int
foowu32(uint32x4_t pDataDest, uint32x4_t value, int32_t * ret)
{
    const uint32x4_t vecOffs1 = { 0, 3, 6, 1};
    const uint32x4_t vecOffs2 = { 4, 7, 2, 5};
    vstrwq_scatter_base_u32 (pDataDest, 4, value);
    vstrwq_scatter_base_u32 (pDataDest, 132, value);
    vstrwq_scatter_offset_s32 (ret, vecOffs1, (int32x4_t) pDataDest);
    vstrwq_scatter_offset_s32 (ret, vecOffs2, (int32x4_t) pDataDest);
    return 0;
}

int
foowf32(uint32x4_t pDataDest, float32x4_t value, int32_t * ret)
{
    const uint32x4_t vecOffs1 = { 0, 3, 6, 1};
    const uint32x4_t vecOffs2 = { 4, 7, 2, 5};
    vstrwq_scatter_base_f32 (pDataDest, 4, value);
    vstrwq_scatter_base_f32 (pDataDest, 132, value);
    vstrwq_scatter_offset_s32 (ret, vecOffs1, (int32x4_t) pDataDest);
    vstrwq_scatter_offset_s32 (ret, vecOffs2, (int32x4_t) pDataDest);
    return 0;
}

int
foods64(uint64x2_t pDataDest, int64x2_t value, int32_t * ret)
{
    const uint32x4_t vecOffs1 = { 0, 3, 6, 1};
    const uint32x4_t vecOffs2 = { 4, 7, 2, 5};
    vstrdq_scatter_base_s64 (pDataDest, 256, value);
    vstrdq_scatter_base_s64 (pDataDest, 512, value);
    vstrwq_scatter_offset_s32 (ret, vecOffs1, (int32x4_t) pDataDest);
    vstrwq_scatter_offset_s32 (ret, vecOffs2, (int32x4_t) pDataDest);
    return 0;
}

int
foodu64(uint64x2_t pDataDest, uint64x2_t value, int32_t * ret)
{
    const uint32x4_t vecOffs1 = { 0, 3, 6, 1};
    const uint32x4_t vecOffs2 = { 4, 7, 2, 5};
    vstrdq_scatter_base_u64 (pDataDest, 256, value);
    vstrdq_scatter_base_u64 (pDataDest, 512, value);
    vstrwq_scatter_offset_s32 (ret, vecOffs1, (int32x4_t) pDataDest);
    vstrwq_scatter_offset_s32 (ret, vecOffs2, (int32x4_t) pDataDest);
    return 0;
}

/* { dg-final { scan-assembler-times "vstr\[a-z\]" 20 } } */
