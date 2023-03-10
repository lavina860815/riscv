/* Copyright 2013-2014 IBM Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * 	http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef __PEL_H
#define __PEL_H

#include <compiler.h>
#include <errorlog.h>

/* Data Structures for PEL data. */

#define PRIVATE_HEADER_SECTION_SIZE		48
#define USER_HEADER_SECTION_SIZE		24
#define SRC_SECTION_SIZE			80
#define SRC_SUBSECTION_SIZE			 4
#define SRC_LENGTH				72
#define OPAL_MAX_SRC_BYTES			32
#define EXTENDED_HEADER_SECTION_SIZE		76
#define MTMS_SECTION_SIZE			28
#define IO_EVENT_SECTION_SIZE			16

#define OPAL_ELOG_VERSION		1
#define OPAL_ELOG_SST			0
#define OPAL_SRC_MAX_WORD_COUNT		8

#define OPAL_SRC_FORMAT         0x80
#define OPAL_FAILING_SUBSYSTEM  0x82

#define OPAL_SYS_MODEL_LEN      8
#define OPAL_SYS_SERIAL_LEN     12
#define OPAL_VER_LEN            16
#define OPAL_SYMPID_LEN         80
#define OPAL_RC_NONE		0

#define OPAL_IO_MAX_RPC_DATA	216
#define OPAL_SRC_SEC_VER	0x02
#define OPAL_EXT_HRD_VER	0x01

/* Error log reporting action */
#define ERRL_ACTION_REPORT     0x2000
#define ERRL_ACTION_NONE       0x0000

enum elogSectionId {
	ELOG_SID_PRIVATE_HEADER                 = 0x5048, /* PH */
	ELOG_SID_USER_HEADER                    = 0x5548, /* UH */
	ELOG_SID_EXTENDED_HEADER                = 0x4548, /* EH */
	ELOG_SID_PRIMARY_SRC                    = 0x5053, /* PS */
	ELOG_SID_MACHINE_TYPE                   = 0x4D54, /* MT */
	ELOG_SID_SECONDARY_SRC                  = 0x5353, /* SS */
	ELOG_SID_CALL_HOME                      = 0x4348, /* CH */
	ELOG_SID_DUMP_LOCATOR                   = 0x4448, /* DH */
	ELOG_SID_SOFTWARE_ERROR			= 0x5357, /* SW */
	ELOG_SID_PARTITION                      = 0x4C50, /* LP */
	ELOG_SID_LOGICAL_RESOURCE               = 0x4C52, /* LR */
	ELOG_SID_HMC_ID                         = 0x484D, /* HM */
	ELOG_SID_EPOW                           = 0x4550, /* EP */
	ELOG_SID_IO_EVENT                       = 0x4945, /* IE */
	ELOG_SID_MFG_INFORMATION                = 0x4D49, /* MI */
	ELOG_SID_USER_DEFINED                   = 0x5544  /* UD */
};


struct opal_v6_header {
	enum elogSectionId id:16;	/* section id */
	uint16_t    length;		/* section length */
	uint8_t    version;		/* section version */
	uint8_t    subtype;		/* section sub-type id */
	uint16_t   component_id;	/* component id of section creator */
};

/* opal_srctype */
#define OPAL_SRC_TYPE_ERROR 0xBB

#define OPAL_CID_SAPPHIRE	'K'	/* creator ID for sapphire log */
#define OPAL_CID_POWERNV	'P'	/* creator ID for powernv log */

/* Origin of error, elog_origin */
#define ORG_SAPPHIRE	1
#define ORG_POWERNV	2

/* MAX time for error log commit */
#define ERRORLOG_TIMEOUT_INTERVAL	180

/*struct opal_private head section_ */
struct opal_private_header_section {

	struct opal_v6_header v6header;
	uint32_t create_date;
	uint32_t create_time;
	uint32_t commit_date;
	uint32_t commit_time;

	uint32_t creator_id:8;		/* subsystem component id */
	uint32_t reserved_0:16;
	uint32_t section_count:8;	/* number of sections in log */
	uint32_t reserved_1;
	uint32_t creator_subid_hi;
	uint32_t creator_subid_lo;
	uint32_t plid;			/* platform log id */
	uint32_t log_entry_id;		/* Unique log entry id */
};

/* opal user header section */
struct opal_user_header_section {

	struct opal_v6_header v6header;

	uint8_t subsystem_id;	/* subsystem id */
	uint8_t event_scope;
	uint8_t event_severity;
	uint8_t event_type;	/* error/event severity */

	uint32_t reserved_0;
	uint16_t reserved_1;
	uint16_t action_flags;	/* error action code */
	uint32_t reserved_2;
};

struct opal_src_section {
	struct opal_v6_header v6header;
	uint8_t		version;
	uint8_t		flags;
	uint8_t		reserved_0;
	uint8_t		wordcount;
	uint16_t	reserved_1;
	uint16_t	srclength;
	uint32_t	hexwords[OPAL_SRC_MAX_WORD_COUNT];
	char		srcstring[OPAL_MAX_SRC_BYTES];
};

struct opal_extended_header_section {
	struct	opal_v6_header v6header;
	char	model[OPAL_SYS_MODEL_LEN];
	char	serial_no[OPAL_SYS_SERIAL_LEN];
	char	opal_release_version[OPAL_VER_LEN];
	char	opal_subsys_version[OPAL_VER_LEN];
	uint16_t reserved_0;
	uint32_t extended_header_date;
	uint32_t extended_header_time;
	uint16_t reserved_1;
	uint8_t reserved_2;
	uint8_t opal_symid_len;
	char	opalsymid[OPAL_SYMPID_LEN];
};

/* opal MTMS section */
struct opal_mtms_section {
	struct opal_v6_header v6header;
	char        model[OPAL_SYS_MODEL_LEN];
	char        serial_no[OPAL_SYS_SERIAL_LEN];
};

/* User defined section */
struct opal_user_section {
	struct opal_v6_header v6header;
	char dump[1];
};

/* The minimum size of a PEL record */
#define PEL_MIN_SIZE (PRIVATE_HEADER_SECTION_SIZE + USER_HEADER_SECTION_SIZE \
		      + SRC_SECTION_SIZE + EXTENDED_HEADER_SECTION_SIZE \
		      + MTMS_SECTION_SIZE)

size_t pel_size(struct errorlog *elog_data);
int create_pel_log(struct errorlog *elog_data, char *pel_buffer,
		   size_t pel_buffer_size) __warn_unused_result;

#endif
