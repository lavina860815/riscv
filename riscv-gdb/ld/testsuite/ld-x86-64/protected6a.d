#source: protected6.s
#as: --64
#ld: -shared -melf_x86_64
#error: .*relocation R_X86_64_GOTOFF64 against protected data `foo' can not be used when making a shared object
