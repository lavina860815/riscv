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

#ifndef __PHB3_CAPP_H
#define __PHB3_CAPP_H

#define CAPP_SNP_ARRAY_ADDR_REG			0x2013028
#define CAPP_APC_MASTER_ARRAY_ADDR_REG		0x201302A
#define CAPP_SNP_ARRAY_WRITE_REG		0x2013801
#define CAPP_APC_MASTER_ARRAY_WRITE_REG		0x2013802

#define CAPP_FIR				0x2013000
#define CAPP_FIR_MASK				0x2013003
#define CAPP_FIR_ACTION0			0x2013006
#define CAPP_FIR_ACTION1			0x2013007
#define CAPP_ERR_RPT_CLR			0x2013013
#define APC_MASTER_PB_CTRL			0x2013018
#define APC_MASTER_CAPI_CTRL			0x2013019
#define TRANSPORT_CONTROL			0x201301C
#define CANNED_PRESP_MAP0			0x201301D
#define CANNED_PRESP_MAP1			0x201301E
#define CANNED_PRESP_MAP2			0x201301F
#define CAPP_ERR_STATUS_CTRL			0x201300E
#define FLUSH_SUE_STATE_MAP			0x201300F
#define CAPP_TB					0x2013026
#define CAPP_TFMR				0x2013027
#define CAPP_EPOCH_TIMER_CTRL			0x201302C
#define FLUSH_UOP_CONFIG1			0x2013803
#define FLUSH_UOP_CONFIG2			0x2013804
#define SNOOP_CAPI_CONFIG			0x201301A

/*
 * Naples has two CAPP units, statically mapped:
 * CAPP0 attached to PHB0, and CAPP1 attached to PHB1.
 * The addresses of CAPP1 XSCOMS registers are 0x180 away.
 */
#define CAPP1_REG_OFFSET 0x180

#endif /* __PHB3_CAPP_H */
