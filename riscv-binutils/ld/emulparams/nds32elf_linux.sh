DEFAULT_TEXT_START_ADDR=0
DEFAULT_STACK_START_ADDR=0
MACHINE=
SCRIPT_NAME=nds32elf
TEMPLATE_NAME=elf
EXTRA_EM_FILE=nds32elf
BIG_OUTPUT_FORMAT="elf32-nds32be-linux"
LITTLE_OUTPUT_FORMAT="elf32-nds32le-linux"
OUTPUT_FORMAT="$LITTLE_OUTPUT_FORMAT"
LIB_PATH="=/usr/local/lib:=/lib:=/usr/lib/"

if [ "${DEFAULT_TEXT_START_ADDR}" = "0" ]; then
    TEXT_START_ADDR=0x8000
else
    TEXT_START_ADDR=${DEFAULT_TEXT_START_ADDR}
fi

ARCH=nds32
MACHINE=
MAXPAGESIZE="CONSTANT (MAXPAGESIZE)"
COMMONPAGESIZE="CONSTANT (COMMONPAGESIZE)"

# Hmmm, there's got to be a better way.  This sets the stack to the
# top of simulator memory (32MB).
if [ "${DEFAULT_STACK_START_ADDR}" = "0" ]; then
    OTHER_RELOCATING_SECTIONS='PROVIDE (_stack = 0x2000000);'
else
    OTHER_RELOCATING_SECTIONS="PROVIDE (_stack = ${DEFAULT_STACK_START_ADDR});"
fi

GENERATE_SHLIB_SCRIPT=yes
GENERATE_PIE_SCRIPT=yes

# Use external linker script files.
COMPILE_IN=no
