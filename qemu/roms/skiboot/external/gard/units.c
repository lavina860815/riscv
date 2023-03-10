#include "gard.h"

/*
 * Each chip has a set of "units" that are detailed by the System MRW. Granted
 * they're pretty much fixed for a given chip generation so hardcoding them here
 * isn't a big deal.
 *
 * These tables we generated from obj/genfiles/errl/errludtarget.H. Which is
 * generated as a part of the hostboot build process. Yeah that's about as
 * dumb as it sounds, but whatever.
 */


/*
 * Notes:
 *
 * When formatting these as strings we print them into a buffer of MAX_PATH_SIZE
 * Given there is a max path length of ten units MAX_PATH_SIZE might need a
 * bump is we start using very detailed unit description strings.
 */

const struct chip_unit_desc p8_chip_units[] = {
	{0x00, "NA"},
	{0x01, "Sys"},
	{0x02, "Node"},
	{0x03, "DIMM"},
	{0x04, "Membuf"},
	{0x05, "Proc"},
	{0x06, "EX"},
	{0x07, "Core"},
	{0x08, "L2"},
	{0x09, "L3"},
	{0x0A, "L4"},
	{0x0B, "MCS"},
	{0x0D, "MBA"},
	{0x0E, "XBUS"},
	{0x0F, "ABUS"},
	{0x10, "PCI"},
	{0x11, "DPSS"},
	{0x12, "APSS"},
	{0x13, "OCC"},
	{0x14, "PSI"},
	{0x15, "FSP"},
	{0x16, "PNOR"},
	{0x17, "OSC"},
	{0x18, "TODCLK"},
	{0x19, "CONTROL_NODE"},
	{0x1A, "OSCREFCLK"},
	{0x1B, "OSCPCICLK"},
	{0x1C, "REFCLKENDPT"},
	{0x1D, "PCICLKENDPT"},
	{0x1E, "NX"},
	{0x1F, "PORE"},
	{0x20, "PCIESWITCH"},
	{0x21, "CAPP"},
	{0x22, "FSI"},
	{0x23, "TPM"},
	{0x24, "SP"},
	{0x25, "UART"},
	{0x26, "PS"},
	{0x27, "FAN"},
	{0x28, "VRM"},
	{0x29, "USB"},
	{0x2A, "ETH"},
	{0x2B, "PANEL"},
	{0x2C, "TEST_FAIL"},
	{0x2D, "LAST_IN_RANGE"}
};

const struct chip_unit_desc p9_chip_units[] = {
	{0x00, "NA"},
	{0x01, "Sys"},
	{0x02, "Node"},
	{0x03, "DIMM"},
	{0x04, "Membuf"},
	{0x05, "Proc"},
	{0x06, "EX"},
	{0x07, "Core"},
	{0x08, "L2"},
	{0x09, "L3"},
	{0x0A, "L4"},
	{0x0B, "MCS"},
	/* a hole! */
	{0x0D, "MBA"},
	{0x0E, "XBUS"},
	{0x0F, "ABUS"},
	{0x10, "PCI"},
	{0x11, "DPSS"},
	{0x12, "APSS"},
	{0x13, "OCC"},
	{0x14, "PSI"},
	{0x15, "FSP"},
	{0x16, "PNOR"},
	{0x17, "OSC"},
	{0x18, "TODCLK"},
	{0x19, "CONTROL_NODE"},
	{0x1A, "OSCREFCLK"},
	{0x1B, "OSCPCICLK"},
	{0x1C, "REFCLKENDPT"},
	{0x1D, "PCICLKENDPT"},
	{0x1E, "NX"},
	{0x1F, "PORE"},
	{0x20, "PCIESWITCH"},
	{0x21, "CAPP"},
	{0x22, "FSI"},
	{0x23, "EQ"},
	{0x24, "MCA"},
	{0x25, "MCBIST"},
	{0x26, "MI"},
	{0x27, "DMI"},
	{0x28, "OBUS"},
	{0x2A, "SBE"},
	{0x2B, "PPE"},
	{0x2C, "PERV"},
	{0x2D, "PEC"},
	{0x2E, "PHB"},
	{0x2F, "SYSREFCLKENDPT"},
	{0x30, "MFREFCLKENDPT"},
	{0x31, "TPM"},
	{0x32, "SP"},
	{0x33, "UART"},
	{0x34, "PS"},
	{0x35, "FAN"},
	{0x36, "VRM"},
	{0x37, "USB"},
	{0x38, "ETH"},
	{0x39, "PANEL"},
	{0x3A, "BMC"},
	{0x3B, "FLASH"},
	{0x3C, "SEEPROM"},
	{0x3D, "TMP"},
	{0x3E, "GPIO_EXPANDER"},
	{0x3F, "POWER_SEQUENCER"},
	{0x40, "RTC"},
	{0x41, "FANCTLR"},
	{0x42, "OBUS_BRICK"},
	{0x43, "NPU"},
	{0x44, "MC"},
	{0x45, "TEST_FAIL"},
	{0x46, "MFREFCLK"},
	{0x47, "LAST_IN_RANGE"},
};

