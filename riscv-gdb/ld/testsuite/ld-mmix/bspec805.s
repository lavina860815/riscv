 BSPEC 80
 TETRA 2 % Decent section length name (in 32-bit words).
 BYTE  "aaaaaaaa"
 TETRA 0x11 % Flags.
 TETRA 0 % Decent high-part of section length.  However...
 ESPEC % Everything ends here.  The next thing is a LOP_LOC for .data, or
       % an ending LOP-something, hence a non-LOP_QUOTE in the section
       % length, high part.
 .data
 TETRA 0x112233
