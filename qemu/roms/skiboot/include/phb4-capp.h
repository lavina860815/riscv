/* Copyright 2013-2017 IBM Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *	http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef __PHB4_CAPP_H
#define __PHB4_CAPP_H

#define CAPP_SNP_ARRAY_WRITE_REG		0x2010841  /* Satellite 2 */
#define CAPP_SNP_ARRAY_ADDR_REG			0x2010828
#define CAPP_APC_MASTER_ARRAY_ADDR_REG		0x201082A
#define CAPP_APC_MASTER_ARRAY_WRITE_REG		0x2010842  /* Satellite 2 */

#define CAPP_FIR				0x2010800
#define CAPP_FIR_CLEAR				0x2010801
#define CAPP_FIR_MASK				0x2010803
#define CAPP_FIR_ACTION0			0x2010806
#define CAPP_FIR_ACTION1			0x2010807
#define CAPP_SNOOP_ERR_RTP			0x201080A
#define CAPP_APC_MASTER_ERR_RPT			0x201080B
#define CAPP_TRANSPORT_ERR_RPT			0x201080C
#define CAPP_TLBI_ERR_RPT			0x201080D
#define CAPP_ERR_STATUS_CTRL			0x201080E
#define FLUSH_SUE_STATE_MAP			0x201080F
#define CAPP_ERR_RPT_CLR			0x2010813
#define APC_MASTER_PB_CTRL			0x2010818
#define APC_MASTER_CAPI_CTRL			0x2010819
#define LCO_MASTER_TARGET			0x2010821
#define EPOCH_RECOVERY_TIMERS_CTRL		0x201082C
#define SNOOP_CAPI_CONFIG			0x201081A
#define SNOOP_CONTROL				0x201081B
#define TRANSPORT_CONTROL			0x201081C
#define CAPP_TB					0x2010826
#define CAPP_TFMR				0x2010827
#define FLUSH_CPIG_STATE_MAP			0x2010820
#define FLUSH_SUE_UOP1				0x2010843  /* Satellite 2 */
#define APC_FSM_READ_MASK			0x2010823
#define XPT_FSM_RMM				0x2010831

/* CAPP0 attached to PHB0(PEC0 - single port)
 * CAPP1 attached to PHB3(PEC2 - single or dual port)
 */
#define CAPP0_PHB_INDEX 0
#define CAPP1_PHB_INDEX 3

/* SCOM address Base (Ring = ???0010???b)
 * CAPP Unit Satellite           SCOM address Base
 * CAPP 0    S1 (sat = ???0000???b)  x02010800
 * CAPP 0    S2 (sat = ???0001???b)  x02010840
 * CAPP 1    S1 (sat = ???0000???b)  x04010800
 * CAPP 1    S2 (sat = ???0001???b)  x04010840
 */
#define CAPP1_REG_OFFSET 0x2000000

#define PHB4_CAPP_REG_OFFSET(p) ((p)->index == 0 ? 0x0 : CAPP1_REG_OFFSET)

#define CAPP_MIN_STQ_ENGINES		0x00000001
#define CAPP_MAX_STQ_ENGINES		0x00000002
#define CAPP_MIN_DMA_READ_ENGINES	0x00000100
#define CAPP_MAX_DMA_READ_ENGINES	0x00000200

#endif /* __PHB4_CAPP_H */
