#ifndef PXE_ERROR_H
#define PXE_ERROR_H

/** @file
 *
 * Preboot eXecution Environment (PXE) error definitions
 *
 */

FILE_LICENCE ( GPL2_OR_LATER_OR_UBDL );

/**
 * @defgroup pxeerrors PXE error codes
 *
 * @{
 */

/* Generic errors */
#define	PXENV_STATUS_SUCCESS					       0x0000
#define	PXENV_STATUS_FAILURE					       0x0001
#define	PXENV_STATUS_BAD_FUNC					       0x0002
#define	PXENV_STATUS_UNSUPPORTED				       0x0003
#define	PXENV_STATUS_KEEP_UNDI					       0x0004
#define	PXENV_STATUS_KEEP_ALL					       0x0005
#define	PXENV_STATUS_OUT_OF_RESOURCES				       0x0006

/* ARP errors (0x0010 to 0x001f) */
#define	PXENV_STATUS_ARP_TIMEOUT				       0x0011

/* Base-Code state errors */
#define	PXENV_STATUS_UDP_CLOSED					       0x0018
#define	PXENV_STATUS_UDP_OPEN					       0x0019
#define	PXENV_STATUS_TFTP_CLOSED				       0x001a
#define	PXENV_STATUS_TFTP_OPEN					       0x001b

/* BIOS/system errors (0x0020 to 0x002f) */
#define	PXENV_STATUS_MCOPY_PROBLEM				       0x0020
#define	PXENV_STATUS_BIS_INTEGRITY_FAILURE			       0x0021
#define	PXENV_STATUS_BIS_VALIDATE_FAILURE			       0x0022
#define	PXENV_STATUS_BIS_INIT_FAILURE				       0x0023
#define	PXENV_STATUS_BIS_SHUTDOWN_FAILURE			       0x0024
#define	PXENV_STATUS_BIS_GBOA_FAILURE				       0x0025
#define	PXENV_STATUS_BIS_FREE_FAILURE				       0x0026
#define	PXENV_STATUS_BIS_GSI_FAILURE				       0x0027
#define	PXENV_STATUS_BIS_BAD_CKSUM				       0x0028

/* TFTP/MTFTP errors (0x0030 to 0x003f) */
#define	PXENV_STATUS_TFTP_CANNOT_ARP_ADDRESS			       0x0030
#define	PXENV_STATUS_TFTP_OPEN_TIMEOUT				       0x0032
#define	PXENV_STATUS_TFTP_UNKNOWN_OPCODE			       0x0033
#define	PXENV_STATUS_TFTP_READ_TIMEOUT				       0x0035
#define	PXENV_STATUS_TFTP_ERROR_OPCODE				       0x0036
#define	PXENV_STATUS_TFTP_CANNOT_OPEN_CONNECTION		       0x0038
#define	PXENV_STATUS_TFTP_CANNOT_READ_FROM_CONNECTION		       0x0039
#define	PXENV_STATUS_TFTP_TOO_MANY_PACKAGES			       0x003a
#define	PXENV_STATUS_TFTP_FILE_NOT_FOUND			       0x003b
#define	PXENV_STATUS_TFTP_ACCESS_VIOLATION			       0x003c
#define	PXENV_STATUS_TFTP_NO_MCAST_ADDRESS			       0x003d
#define	PXENV_STATUS_TFTP_NO_FILESIZE				       0x003e
#define	PXENV_STATUS_TFTP_INVALID_PACKET_SIZE			       0x003f

/* Reserved errors 0x0040 to 0x004f) */

/* DHCP/BOOTP errors (0x0050 to 0x005f) */
#define	PXENV_STATUS_DHCP_TIMEOUT				       0x0051
#define	PXENV_STATUS_DHCP_NO_IP_ADDRESS				       0x0052
#define	PXENV_STATUS_DHCP_NO_BOOTFILE_NAME			       0x0053
#define	PXENV_STATUS_DHCP_BAD_IP_ADDRESS			       0x0054

/* Driver errors (0x0060 to 0x006f) */
#define	PXENV_STATUS_UNDI_INVALID_FUNCTION			       0x0060
#define	PXENV_STATUS_UNDI_MEDIATEST_FAILED			       0x0061
#define	PXENV_STATUS_UNDI_CANNOT_INIT_NIC_FOR_MCAST		       0x0062
#define	PXENV_STATUS_UNDI_CANNOT_INITIALIZE_NIC			       0x0063
#define	PXENV_STATUS_UNDI_CANNOT_INITIALIZE_PHY			       0x0064
#define	PXENV_STATUS_UNDI_CANNOT_READ_CONFIG_DATA		       0x0065
#define	PXENV_STATUS_UNDI_CANNOT_READ_INIT_DATA			       0x0066
#define	PXENV_STATUS_UNDI_BAD_MAC_ADDRESS			       0x0067
#define	PXENV_STATUS_UNDI_BAD_EEPROM_CHECKSUM			       0x0068
#define	PXENV_STATUS_UNDI_ERROR_SETTING_ISR			       0x0069
#define	PXENV_STATUS_UNDI_INVALID_STATE				       0x006a
#define	PXENV_STATUS_UNDI_TRANSMIT_ERROR			       0x006b
#define	PXENV_STATUS_UNDI_INVALID_PARAMETER			       0x006c

/* ROM and NBP bootstrap errors (0x0070 to 0x007f) */
#define	PXENV_STATUS_BSTRAP_PROMPT_MENU				       0x0074
#define	PXENV_STATUS_BSTRAP_MCAST_ADDR				       0x0076
#define	PXENV_STATUS_BSTRAP_MISSING_LIST			       0x0077
#define	PXENV_STATUS_BSTRAP_NO_RESPONSE				       0x0078
#define	PXENV_STATUS_BSTRAP_FILE_TOO_BIG			       0x0079

/* Environment NBP errors (0x0080 to 0x008f) */

/* Reserved errors (0x0090 to 0x009f) */

/* Miscellaneous errors (0x00a0 to 0x00af) */
#define	PXENV_STATUS_BINL_CANCELED_BY_KEYSTROKE			       0x00a0
#define	PXENV_STATUS_BINL_NO_PXE_SERVER				       0x00a1
#define	PXENV_STATUS_NOT_AVAILABLE_IN_PMODE			       0x00a2
#define	PXENV_STATUS_NOT_AVAILABLE_IN_RMODE			       0x00a3

/* BUSD errors (0x00b0 to 0x00bf) */
#define	PXENV_STATUS_BUSD_DEVICE_NOT_SUPPORTED			       0x00b0

/* Loader errors (0x00c0 to 0x00cf) */
#define	PXENV_STATUS_LOADER_NO_FREE_BASE_MEMORY			       0x00c0
#define	PXENV_STATUS_LOADER_NO_BC_ROMID				       0x00c1
#define	PXENV_STATUS_LOADER_BAD_BC_ROMID			       0x00c2
#define	PXENV_STATUS_LOADER_BAD_BC_RUNTIME_IMAGE		       0x00c3
#define	PXENV_STATUS_LOADER_NO_UNDI_ROMID			       0x00c4
#define	PXENV_STATUS_LOADER_BAD_UNDI_ROMID			       0x00c5
#define	PXENV_STATUS_LOADER_BAD_UNDI_DRIVER_IMAGE		       0x00c6
#define	PXENV_STATUS_LOADER_NO_PXE_STRUCT			       0x00c8
#define	PXENV_STATUS_LOADER_NO_PXENV_STRUCT			       0x00c9
#define	PXENV_STATUS_LOADER_UNDI_START				       0x00ca
#define	PXENV_STATUS_LOADER_BC_START				       0x00cb

/** @} */

/** Derive PXENV_STATUS code from iPXE error number */
#define PXENV_STATUS( rc ) ( (-(rc)) & 0x00ff )

#endif /* PXE_ERROR_H */
