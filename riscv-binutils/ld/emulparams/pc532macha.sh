SCRIPT_NAME=aout
OUTPUT_FORMAT="a.out-pc532-mach"
TARGET_PAGE_SIZE=0x1000
TEXT_START_ADDR="0x10020"
case ${LD_FLAG} in
    n|N)	TEXT_START_ADDR=0x10000 ;;
esac
ARCH=ns32k
