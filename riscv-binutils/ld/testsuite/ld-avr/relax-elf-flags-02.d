#name: AVR, check link-relax flag is clear on partial link (first file)
#as: -mmcu=avrxmega2
#ld: -r -mavrxmega2
#source: relax-elf-flags-a.s -mno-link-relax
#source: relax-elf-flags-b.s -mlink-relax
#readelf: -h
#target: avr-*-*

ELF Header:
#...
  Flags:                             0x66, avr:102
#...