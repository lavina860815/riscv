/*
 * Copyright 2010-2016 Intel Corporation.
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, version 2.1.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * Disclaimer: The codes contained in these modules may be specific
 * to the Intel Software Development Platform codenamed Knights Ferry,
 * and the Intel product codenamed Knights Corner, and are not backward
 * compatible with other Intel products. Additionally, Intel will NOT
 * support the codes or instruction set in future products.
 *
 * Intel offers no warranty of any kind regarding the code. This code is
 * licensed on an "AS IS" basis and Intel is not obligated to provide
 * any support, assistance, installation, training, or other services
 * of any kind. Intel is also not obligated to provide any updates,
 * enhancements or extensions. Intel specifically disclaims any warranty
 * of merchantability, non-infringement, fitness for any particular
 * purpose, and any other warranty.
 *
 * Further, Intel disclaims all liability of any kind, including but
 * not limited to liability for infringement of any proprietary rights,
 * relating to the use of the code, even if Intel is notified of the
 * possibility of such liability. Except as expressly stated in an Intel
 * license agreement provided with this code and agreed upon with Intel,
 * no license, express or implied, by estoppel or otherwise, to any
 * intellectual property rights is granted herein.
 */

#ifndef _COIEVENT_COMMON_H
#define _COIEVENT_COMMON_H

/** @ingroup COIEvent
 *  @addtogroup COIEventcommon
@{
* @file common/COIEvent_common.h
*/
#ifndef DOXYGEN_SHOULD_SKIP_THIS

#include "../common/COITypes_common.h"
#include "../common/COIResult_common.h"

#ifdef __cplusplus
extern "C" {
#endif
#endif // DOXYGEN_SHOULD_SKIP_THIS


///////////////////////////////////////////////////////////////////////////////
///
/// Signal one shot user event. User events created on source can be
/// signaled from both sink and source. This fires the event and wakes up
/// threads waiting on COIEventWait.
///
/// Note: For events that are not registered or already signaled this call
///       will behave as a NOP. Users need to make sure that they pass valid
///       events on the sink side.
///
/// @param  in_Event
///         Event Handle to be signaled.
///
/// @return COI_INVAILD_HANDLE if in_Event was not a User event.
///
/// @return COI_ERROR if the signal fails to be sent from the sink.
///
/// @return COI_SUCCESS if the event was successfully signaled or ignored.
///
COIACCESSAPI
COIRESULT COIEventSignalUserEvent(COIEVENT in_Event);
///
///
#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* _COIEVENT_COMMON_H */

/*! @} */
