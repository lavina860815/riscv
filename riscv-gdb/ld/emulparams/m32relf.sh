MACHINE=
SCRIPT_NAME=elf
TEMPLATE_NAME=elf
OUTPUT_FORMAT="elf32-m32r"
TEXT_START_ADDR=0x100
ARCH=m32r
MACHINE=
MAXPAGESIZE=32
EMBEDDED=yes

# This sets the stack to the top of simulator memory (8MB).
OTHER_SYMBOLS='PROVIDE (_stack = 0x800000);'
