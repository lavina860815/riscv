#objdump: -dr --prefix-addresses --show-raw-insn
#name: MIPS16e2 ASE subset disassembly
#as: -32 -I$srcdir/$subdir

.*: +file format .*mips.*

Disassembly of section \.text:
[0-9a-f]+ <[^>]*> f000 9220 	lw	v0,0\(sp\)
[0-9a-f]+ <[^>]*> f000 9221 	lw	v0,1\(sp\)
[0-9a-f]+ <[^>]*> f000 9222 	lw	v0,2\(sp\)
[0-9a-f]+ <[^>]*> f000 9223 	lw	v0,3\(sp\)
[0-9a-f]+ <[^>]*> f000 9224 	lw	v0,4\(sp\)
[0-9a-f]+ <[^>]*> f000 9228 	lw	v0,8\(sp\)
[0-9a-f]+ <[^>]*> f000 9230 	lw	v0,16\(sp\)
[0-9a-f]+ <[^>]*> f020 9220 	lw	v0,32\(sp\)
[0-9a-f]+ <[^>]*> f040 9220 	lw	v0,64\(sp\)
[0-9a-f]+ <[^>]*> f080 9220 	lw	v0,128\(sp\)
[0-9a-f]+ <[^>]*> f0e0 923f 	lw	v0,255\(sp\)
[0-9a-f]+ <[^>]*> f100 9220 	lw	v0,256\(sp\)
[0-9a-f]+ <[^>]*> f200 9220 	lw	v0,512\(sp\)
[0-9a-f]+ <[^>]*> f400 9220 	lw	v0,1024\(sp\)
[0-9a-f]+ <[^>]*> f001 9220 	lw	v0,2048\(sp\)
[0-9a-f]+ <[^>]*> f002 9220 	lw	v0,4096\(sp\)
[0-9a-f]+ <[^>]*> f004 9220 	lw	v0,8192\(sp\)
[0-9a-f]+ <[^>]*> f008 9220 	lw	v0,16384\(sp\)
[0-9a-f]+ <[^>]*> f7ef 923f 	lw	v0,32767\(sp\)
[0-9a-f]+ <[^>]*> f7ff 923f 	lw	v0,-1\(sp\)
[0-9a-f]+ <[^>]*> f7ff 923e 	lw	v0,-2\(sp\)
[0-9a-f]+ <[^>]*> f7ff 923d 	lw	v0,-3\(sp\)
[0-9a-f]+ <[^>]*> f7ff 923c 	lw	v0,-4\(sp\)
[0-9a-f]+ <[^>]*> f7ff 9238 	lw	v0,-8\(sp\)
[0-9a-f]+ <[^>]*> f7ff 9230 	lw	v0,-16\(sp\)
[0-9a-f]+ <[^>]*> f7ff 9220 	lw	v0,-32\(sp\)
[0-9a-f]+ <[^>]*> f7df 9220 	lw	v0,-64\(sp\)
[0-9a-f]+ <[^>]*> f79f 9220 	lw	v0,-128\(sp\)
[0-9a-f]+ <[^>]*> f71f 9220 	lw	v0,-256\(sp\)
[0-9a-f]+ <[^>]*> f61f 9220 	lw	v0,-512\(sp\)
[0-9a-f]+ <[^>]*> f41f 9220 	lw	v0,-1024\(sp\)
[0-9a-f]+ <[^>]*> f01f 9220 	lw	v0,-2048\(sp\)
[0-9a-f]+ <[^>]*> f01e 9220 	lw	v0,-4096\(sp\)
[0-9a-f]+ <[^>]*> f01c 9220 	lw	v0,-8192\(sp\)
[0-9a-f]+ <[^>]*> f018 9220 	lw	v0,-16384\(sp\)
[0-9a-f]+ <[^>]*> f010 9220 	lw	v0,-32768\(sp\)
[0-9a-f]+ <[^>]*> f000 9240 	lw	v0,0\(sp\)
[0-9a-f]+ <[^>]*> f000 9241 	lw	v0,1\(sp\)
[0-9a-f]+ <[^>]*> f000 9242 	lw	v0,2\(sp\)
[0-9a-f]+ <[^>]*> f000 9243 	lw	v0,3\(sp\)
[0-9a-f]+ <[^>]*> f000 9244 	lw	v0,4\(sp\)
[0-9a-f]+ <[^>]*> f000 9248 	lw	v0,8\(sp\)
[0-9a-f]+ <[^>]*> f000 9250 	lw	v0,16\(sp\)
[0-9a-f]+ <[^>]*> f020 9240 	lw	v0,32\(sp\)
[0-9a-f]+ <[^>]*> f040 9240 	lw	v0,64\(sp\)
[0-9a-f]+ <[^>]*> f080 9240 	lw	v0,128\(sp\)
[0-9a-f]+ <[^>]*> f0e0 925f 	lw	v0,255\(sp\)
[0-9a-f]+ <[^>]*> f100 9240 	lw	v0,256\(sp\)
[0-9a-f]+ <[^>]*> f200 9240 	lw	v0,512\(sp\)
[0-9a-f]+ <[^>]*> f400 9240 	lw	v0,1024\(sp\)
[0-9a-f]+ <[^>]*> f001 9240 	lw	v0,2048\(sp\)
[0-9a-f]+ <[^>]*> f002 9240 	lw	v0,4096\(sp\)
[0-9a-f]+ <[^>]*> f004 9240 	lw	v0,8192\(sp\)
[0-9a-f]+ <[^>]*> f008 9240 	lw	v0,16384\(sp\)
[0-9a-f]+ <[^>]*> f7ef 925f 	lw	v0,32767\(sp\)
[0-9a-f]+ <[^>]*> f7ff 925f 	lw	v0,-1\(sp\)
[0-9a-f]+ <[^>]*> f7ff 925e 	lw	v0,-2\(sp\)
[0-9a-f]+ <[^>]*> f7ff 925d 	lw	v0,-3\(sp\)
[0-9a-f]+ <[^>]*> f7ff 925c 	lw	v0,-4\(sp\)
[0-9a-f]+ <[^>]*> f7ff 9258 	lw	v0,-8\(sp\)
[0-9a-f]+ <[^>]*> f7ff 9250 	lw	v0,-16\(sp\)
[0-9a-f]+ <[^>]*> f7ff 9240 	lw	v0,-32\(sp\)
[0-9a-f]+ <[^>]*> f7df 9240 	lw	v0,-64\(sp\)
[0-9a-f]+ <[^>]*> f79f 9240 	lw	v0,-128\(sp\)
[0-9a-f]+ <[^>]*> f71f 9240 	lw	v0,-256\(sp\)
[0-9a-f]+ <[^>]*> f61f 9240 	lw	v0,-512\(sp\)
[0-9a-f]+ <[^>]*> f41f 9240 	lw	v0,-1024\(sp\)
[0-9a-f]+ <[^>]*> f01f 9240 	lw	v0,-2048\(sp\)
[0-9a-f]+ <[^>]*> f01e 9240 	lw	v0,-4096\(sp\)
[0-9a-f]+ <[^>]*> f01c 9240 	lw	v0,-8192\(sp\)
[0-9a-f]+ <[^>]*> f018 9240 	lw	v0,-16384\(sp\)
[0-9a-f]+ <[^>]*> f010 9240 	lw	v0,-32768\(sp\)
[0-9a-f]+ <[^>]*> f000 9280 	lw	v0,0\(sp\)
[0-9a-f]+ <[^>]*> f000 9281 	lw	v0,1\(sp\)
[0-9a-f]+ <[^>]*> f000 9282 	lw	v0,2\(sp\)
[0-9a-f]+ <[^>]*> f000 9283 	lw	v0,3\(sp\)
[0-9a-f]+ <[^>]*> f000 9284 	lw	v0,4\(sp\)
[0-9a-f]+ <[^>]*> f000 9288 	lw	v0,8\(sp\)
[0-9a-f]+ <[^>]*> f000 9290 	lw	v0,16\(sp\)
[0-9a-f]+ <[^>]*> f020 9280 	lw	v0,32\(sp\)
[0-9a-f]+ <[^>]*> f040 9280 	lw	v0,64\(sp\)
[0-9a-f]+ <[^>]*> f080 9280 	lw	v0,128\(sp\)
[0-9a-f]+ <[^>]*> f0e0 929f 	lw	v0,255\(sp\)
[0-9a-f]+ <[^>]*> f100 9280 	lw	v0,256\(sp\)
[0-9a-f]+ <[^>]*> f200 9280 	lw	v0,512\(sp\)
[0-9a-f]+ <[^>]*> f400 9280 	lw	v0,1024\(sp\)
[0-9a-f]+ <[^>]*> f001 9280 	lw	v0,2048\(sp\)
[0-9a-f]+ <[^>]*> f002 9280 	lw	v0,4096\(sp\)
[0-9a-f]+ <[^>]*> f004 9280 	lw	v0,8192\(sp\)
[0-9a-f]+ <[^>]*> f008 9280 	lw	v0,16384\(sp\)
[0-9a-f]+ <[^>]*> f7ef 929f 	lw	v0,32767\(sp\)
[0-9a-f]+ <[^>]*> f7ff 929f 	lw	v0,-1\(sp\)
[0-9a-f]+ <[^>]*> f7ff 929e 	lw	v0,-2\(sp\)
[0-9a-f]+ <[^>]*> f7ff 929d 	lw	v0,-3\(sp\)
[0-9a-f]+ <[^>]*> f7ff 929c 	lw	v0,-4\(sp\)
[0-9a-f]+ <[^>]*> f7ff 9298 	lw	v0,-8\(sp\)
[0-9a-f]+ <[^>]*> f7ff 9290 	lw	v0,-16\(sp\)
[0-9a-f]+ <[^>]*> f7ff 9280 	lw	v0,-32\(sp\)
[0-9a-f]+ <[^>]*> f7df 9280 	lw	v0,-64\(sp\)
[0-9a-f]+ <[^>]*> f79f 9280 	lw	v0,-128\(sp\)
[0-9a-f]+ <[^>]*> f71f 9280 	lw	v0,-256\(sp\)
[0-9a-f]+ <[^>]*> f61f 9280 	lw	v0,-512\(sp\)
[0-9a-f]+ <[^>]*> f41f 9280 	lw	v0,-1024\(sp\)
[0-9a-f]+ <[^>]*> f01f 9280 	lw	v0,-2048\(sp\)
[0-9a-f]+ <[^>]*> f01e 9280 	lw	v0,-4096\(sp\)
[0-9a-f]+ <[^>]*> f01c 9280 	lw	v0,-8192\(sp\)
[0-9a-f]+ <[^>]*> f018 9280 	lw	v0,-16384\(sp\)
[0-9a-f]+ <[^>]*> f010 9280 	lw	v0,-32768\(sp\)
[0-9a-f]+ <[^>]*> f000 9260 	lw	v0,0\(sp\)
[0-9a-f]+ <[^>]*> f000 9261 	lw	v0,1\(sp\)
[0-9a-f]+ <[^>]*> f000 9262 	lw	v0,2\(sp\)
[0-9a-f]+ <[^>]*> f000 9263 	lw	v0,3\(sp\)
[0-9a-f]+ <[^>]*> f000 9264 	lw	v0,4\(sp\)
[0-9a-f]+ <[^>]*> f000 9268 	lw	v0,8\(sp\)
[0-9a-f]+ <[^>]*> f000 9270 	lw	v0,16\(sp\)
[0-9a-f]+ <[^>]*> f020 9260 	lw	v0,32\(sp\)
[0-9a-f]+ <[^>]*> f040 9260 	lw	v0,64\(sp\)
[0-9a-f]+ <[^>]*> f080 9260 	lw	v0,128\(sp\)
[0-9a-f]+ <[^>]*> f0e0 927f 	lw	v0,255\(sp\)
[0-9a-f]+ <[^>]*> f100 9260 	lw	v0,256\(sp\)
[0-9a-f]+ <[^>]*> f200 9260 	lw	v0,512\(sp\)
[0-9a-f]+ <[^>]*> f400 9260 	lw	v0,1024\(sp\)
[0-9a-f]+ <[^>]*> f001 9260 	lw	v0,2048\(sp\)
[0-9a-f]+ <[^>]*> f002 9260 	lw	v0,4096\(sp\)
[0-9a-f]+ <[^>]*> f004 9260 	lw	v0,8192\(sp\)
[0-9a-f]+ <[^>]*> f008 9260 	lw	v0,16384\(sp\)
[0-9a-f]+ <[^>]*> f7ef 927f 	lw	v0,32767\(sp\)
[0-9a-f]+ <[^>]*> f7ff 927f 	lw	v0,-1\(sp\)
[0-9a-f]+ <[^>]*> f7ff 927e 	lw	v0,-2\(sp\)
[0-9a-f]+ <[^>]*> f7ff 927d 	lw	v0,-3\(sp\)
[0-9a-f]+ <[^>]*> f7ff 927c 	lw	v0,-4\(sp\)
[0-9a-f]+ <[^>]*> f7ff 9278 	lw	v0,-8\(sp\)
[0-9a-f]+ <[^>]*> f7ff 9270 	lw	v0,-16\(sp\)
[0-9a-f]+ <[^>]*> f7ff 9260 	lw	v0,-32\(sp\)
[0-9a-f]+ <[^>]*> f7df 9260 	lw	v0,-64\(sp\)
[0-9a-f]+ <[^>]*> f79f 9260 	lw	v0,-128\(sp\)
[0-9a-f]+ <[^>]*> f71f 9260 	lw	v0,-256\(sp\)
[0-9a-f]+ <[^>]*> f61f 9260 	lw	v0,-512\(sp\)
[0-9a-f]+ <[^>]*> f41f 9260 	lw	v0,-1024\(sp\)
[0-9a-f]+ <[^>]*> f01f 9260 	lw	v0,-2048\(sp\)
[0-9a-f]+ <[^>]*> f01e 9260 	lw	v0,-4096\(sp\)
[0-9a-f]+ <[^>]*> f01c 9260 	lw	v0,-8192\(sp\)
[0-9a-f]+ <[^>]*> f018 9260 	lw	v0,-16384\(sp\)
[0-9a-f]+ <[^>]*> f010 9260 	lw	v0,-32768\(sp\)
[0-9a-f]+ <[^>]*> f000 92a0 	lw	v0,0\(sp\)
[0-9a-f]+ <[^>]*> f000 92a1 	lw	v0,1\(sp\)
[0-9a-f]+ <[^>]*> f000 92a2 	lw	v0,2\(sp\)
[0-9a-f]+ <[^>]*> f000 92a3 	lw	v0,3\(sp\)
[0-9a-f]+ <[^>]*> f000 92a4 	lw	v0,4\(sp\)
[0-9a-f]+ <[^>]*> f000 92a8 	lw	v0,8\(sp\)
[0-9a-f]+ <[^>]*> f000 92b0 	lw	v0,16\(sp\)
[0-9a-f]+ <[^>]*> f020 92a0 	lw	v0,32\(sp\)
[0-9a-f]+ <[^>]*> f040 92a0 	lw	v0,64\(sp\)
[0-9a-f]+ <[^>]*> f080 92a0 	lw	v0,128\(sp\)
[0-9a-f]+ <[^>]*> f0e0 92bf 	lw	v0,255\(sp\)
[0-9a-f]+ <[^>]*> f100 92a0 	lw	v0,256\(sp\)
[0-9a-f]+ <[^>]*> f200 92a0 	lw	v0,512\(sp\)
[0-9a-f]+ <[^>]*> f400 92a0 	lw	v0,1024\(sp\)
[0-9a-f]+ <[^>]*> f001 92a0 	lw	v0,2048\(sp\)
[0-9a-f]+ <[^>]*> f002 92a0 	lw	v0,4096\(sp\)
[0-9a-f]+ <[^>]*> f004 92a0 	lw	v0,8192\(sp\)
[0-9a-f]+ <[^>]*> f008 92a0 	lw	v0,16384\(sp\)
[0-9a-f]+ <[^>]*> f7ef 92bf 	lw	v0,32767\(sp\)
[0-9a-f]+ <[^>]*> f7ff 92bf 	lw	v0,-1\(sp\)
[0-9a-f]+ <[^>]*> f7ff 92be 	lw	v0,-2\(sp\)
[0-9a-f]+ <[^>]*> f7ff 92bd 	lw	v0,-3\(sp\)
[0-9a-f]+ <[^>]*> f7ff 92bc 	lw	v0,-4\(sp\)
[0-9a-f]+ <[^>]*> f7ff 92b8 	lw	v0,-8\(sp\)
[0-9a-f]+ <[^>]*> f7ff 92b0 	lw	v0,-16\(sp\)
[0-9a-f]+ <[^>]*> f7ff 92a0 	lw	v0,-32\(sp\)
[0-9a-f]+ <[^>]*> f7df 92a0 	lw	v0,-64\(sp\)
[0-9a-f]+ <[^>]*> f79f 92a0 	lw	v0,-128\(sp\)
[0-9a-f]+ <[^>]*> f71f 92a0 	lw	v0,-256\(sp\)
[0-9a-f]+ <[^>]*> f61f 92a0 	lw	v0,-512\(sp\)
[0-9a-f]+ <[^>]*> f41f 92a0 	lw	v0,-1024\(sp\)
[0-9a-f]+ <[^>]*> f01f 92a0 	lw	v0,-2048\(sp\)
[0-9a-f]+ <[^>]*> f01e 92a0 	lw	v0,-4096\(sp\)
[0-9a-f]+ <[^>]*> f01c 92a0 	lw	v0,-8192\(sp\)
[0-9a-f]+ <[^>]*> f018 92a0 	lw	v0,-16384\(sp\)
[0-9a-f]+ <[^>]*> f010 92a0 	lw	v0,-32768\(sp\)
[0-9a-f]+ <[^>]*> f000 d220 	sw	v0,0\(sp\)
[0-9a-f]+ <[^>]*> f000 d221 	sw	v0,1\(sp\)
[0-9a-f]+ <[^>]*> f000 d222 	sw	v0,2\(sp\)
[0-9a-f]+ <[^>]*> f000 d223 	sw	v0,3\(sp\)
[0-9a-f]+ <[^>]*> f000 d224 	sw	v0,4\(sp\)
[0-9a-f]+ <[^>]*> f000 d228 	sw	v0,8\(sp\)
[0-9a-f]+ <[^>]*> f000 d230 	sw	v0,16\(sp\)
[0-9a-f]+ <[^>]*> f020 d220 	sw	v0,32\(sp\)
[0-9a-f]+ <[^>]*> f040 d220 	sw	v0,64\(sp\)
[0-9a-f]+ <[^>]*> f080 d220 	sw	v0,128\(sp\)
[0-9a-f]+ <[^>]*> f0e0 d23f 	sw	v0,255\(sp\)
[0-9a-f]+ <[^>]*> f100 d220 	sw	v0,256\(sp\)
[0-9a-f]+ <[^>]*> f200 d220 	sw	v0,512\(sp\)
[0-9a-f]+ <[^>]*> f400 d220 	sw	v0,1024\(sp\)
[0-9a-f]+ <[^>]*> f001 d220 	sw	v0,2048\(sp\)
[0-9a-f]+ <[^>]*> f002 d220 	sw	v0,4096\(sp\)
[0-9a-f]+ <[^>]*> f004 d220 	sw	v0,8192\(sp\)
[0-9a-f]+ <[^>]*> f008 d220 	sw	v0,16384\(sp\)
[0-9a-f]+ <[^>]*> f7ef d23f 	sw	v0,32767\(sp\)
[0-9a-f]+ <[^>]*> f7ff d23f 	sw	v0,-1\(sp\)
[0-9a-f]+ <[^>]*> f7ff d23e 	sw	v0,-2\(sp\)
[0-9a-f]+ <[^>]*> f7ff d23d 	sw	v0,-3\(sp\)
[0-9a-f]+ <[^>]*> f7ff d23c 	sw	v0,-4\(sp\)
[0-9a-f]+ <[^>]*> f7ff d238 	sw	v0,-8\(sp\)
[0-9a-f]+ <[^>]*> f7ff d230 	sw	v0,-16\(sp\)
[0-9a-f]+ <[^>]*> f7ff d220 	sw	v0,-32\(sp\)
[0-9a-f]+ <[^>]*> f7df d220 	sw	v0,-64\(sp\)
[0-9a-f]+ <[^>]*> f79f d220 	sw	v0,-128\(sp\)
[0-9a-f]+ <[^>]*> f71f d220 	sw	v0,-256\(sp\)
[0-9a-f]+ <[^>]*> f61f d220 	sw	v0,-512\(sp\)
[0-9a-f]+ <[^>]*> f41f d220 	sw	v0,-1024\(sp\)
[0-9a-f]+ <[^>]*> f01f d220 	sw	v0,-2048\(sp\)
[0-9a-f]+ <[^>]*> f01e d220 	sw	v0,-4096\(sp\)
[0-9a-f]+ <[^>]*> f01c d220 	sw	v0,-8192\(sp\)
[0-9a-f]+ <[^>]*> f018 d220 	sw	v0,-16384\(sp\)
[0-9a-f]+ <[^>]*> f010 d220 	sw	v0,-32768\(sp\)
[0-9a-f]+ <[^>]*> f000 d240 	sw	v0,0\(sp\)
[0-9a-f]+ <[^>]*> f000 d241 	sw	v0,1\(sp\)
[0-9a-f]+ <[^>]*> f000 d242 	sw	v0,2\(sp\)
[0-9a-f]+ <[^>]*> f000 d243 	sw	v0,3\(sp\)
[0-9a-f]+ <[^>]*> f000 d244 	sw	v0,4\(sp\)
[0-9a-f]+ <[^>]*> f000 d248 	sw	v0,8\(sp\)
[0-9a-f]+ <[^>]*> f000 d250 	sw	v0,16\(sp\)
[0-9a-f]+ <[^>]*> f020 d240 	sw	v0,32\(sp\)
[0-9a-f]+ <[^>]*> f040 d240 	sw	v0,64\(sp\)
[0-9a-f]+ <[^>]*> f080 d240 	sw	v0,128\(sp\)
[0-9a-f]+ <[^>]*> f0e0 d25f 	sw	v0,255\(sp\)
[0-9a-f]+ <[^>]*> f100 d240 	sw	v0,256\(sp\)
[0-9a-f]+ <[^>]*> f200 d240 	sw	v0,512\(sp\)
[0-9a-f]+ <[^>]*> f400 d240 	sw	v0,1024\(sp\)
[0-9a-f]+ <[^>]*> f001 d240 	sw	v0,2048\(sp\)
[0-9a-f]+ <[^>]*> f002 d240 	sw	v0,4096\(sp\)
[0-9a-f]+ <[^>]*> f004 d240 	sw	v0,8192\(sp\)
[0-9a-f]+ <[^>]*> f008 d240 	sw	v0,16384\(sp\)
[0-9a-f]+ <[^>]*> f7ef d25f 	sw	v0,32767\(sp\)
[0-9a-f]+ <[^>]*> f7ff d25f 	sw	v0,-1\(sp\)
[0-9a-f]+ <[^>]*> f7ff d25e 	sw	v0,-2\(sp\)
[0-9a-f]+ <[^>]*> f7ff d25d 	sw	v0,-3\(sp\)
[0-9a-f]+ <[^>]*> f7ff d25c 	sw	v0,-4\(sp\)
[0-9a-f]+ <[^>]*> f7ff d258 	sw	v0,-8\(sp\)
[0-9a-f]+ <[^>]*> f7ff d250 	sw	v0,-16\(sp\)
[0-9a-f]+ <[^>]*> f7ff d240 	sw	v0,-32\(sp\)
[0-9a-f]+ <[^>]*> f7df d240 	sw	v0,-64\(sp\)
[0-9a-f]+ <[^>]*> f79f d240 	sw	v0,-128\(sp\)
[0-9a-f]+ <[^>]*> f71f d240 	sw	v0,-256\(sp\)
[0-9a-f]+ <[^>]*> f61f d240 	sw	v0,-512\(sp\)
[0-9a-f]+ <[^>]*> f41f d240 	sw	v0,-1024\(sp\)
[0-9a-f]+ <[^>]*> f01f d240 	sw	v0,-2048\(sp\)
[0-9a-f]+ <[^>]*> f01e d240 	sw	v0,-4096\(sp\)
[0-9a-f]+ <[^>]*> f01c d240 	sw	v0,-8192\(sp\)
[0-9a-f]+ <[^>]*> f018 d240 	sw	v0,-16384\(sp\)
[0-9a-f]+ <[^>]*> f010 d240 	sw	v0,-32768\(sp\)
[0-9a-f]+ <[^>]*> f000 d260 	sw	v0,0\(sp\)
[0-9a-f]+ <[^>]*> f000 d261 	sw	v0,1\(sp\)
[0-9a-f]+ <[^>]*> f000 d262 	sw	v0,2\(sp\)
[0-9a-f]+ <[^>]*> f000 d263 	sw	v0,3\(sp\)
[0-9a-f]+ <[^>]*> f000 d264 	sw	v0,4\(sp\)
[0-9a-f]+ <[^>]*> f000 d268 	sw	v0,8\(sp\)
[0-9a-f]+ <[^>]*> f000 d270 	sw	v0,16\(sp\)
[0-9a-f]+ <[^>]*> f020 d260 	sw	v0,32\(sp\)
[0-9a-f]+ <[^>]*> f040 d260 	sw	v0,64\(sp\)
[0-9a-f]+ <[^>]*> f080 d260 	sw	v0,128\(sp\)
[0-9a-f]+ <[^>]*> f0e0 d27f 	sw	v0,255\(sp\)
[0-9a-f]+ <[^>]*> f100 d260 	sw	v0,256\(sp\)
[0-9a-f]+ <[^>]*> f200 d260 	sw	v0,512\(sp\)
[0-9a-f]+ <[^>]*> f400 d260 	sw	v0,1024\(sp\)
[0-9a-f]+ <[^>]*> f001 d260 	sw	v0,2048\(sp\)
[0-9a-f]+ <[^>]*> f002 d260 	sw	v0,4096\(sp\)
[0-9a-f]+ <[^>]*> f004 d260 	sw	v0,8192\(sp\)
[0-9a-f]+ <[^>]*> f008 d260 	sw	v0,16384\(sp\)
[0-9a-f]+ <[^>]*> f7ef d27f 	sw	v0,32767\(sp\)
[0-9a-f]+ <[^>]*> f7ff d27f 	sw	v0,-1\(sp\)
[0-9a-f]+ <[^>]*> f7ff d27e 	sw	v0,-2\(sp\)
[0-9a-f]+ <[^>]*> f7ff d27d 	sw	v0,-3\(sp\)
[0-9a-f]+ <[^>]*> f7ff d27c 	sw	v0,-4\(sp\)
[0-9a-f]+ <[^>]*> f7ff d278 	sw	v0,-8\(sp\)
[0-9a-f]+ <[^>]*> f7ff d270 	sw	v0,-16\(sp\)
[0-9a-f]+ <[^>]*> f7ff d260 	sw	v0,-32\(sp\)
[0-9a-f]+ <[^>]*> f7df d260 	sw	v0,-64\(sp\)
[0-9a-f]+ <[^>]*> f79f d260 	sw	v0,-128\(sp\)
[0-9a-f]+ <[^>]*> f71f d260 	sw	v0,-256\(sp\)
[0-9a-f]+ <[^>]*> f61f d260 	sw	v0,-512\(sp\)
[0-9a-f]+ <[^>]*> f41f d260 	sw	v0,-1024\(sp\)
[0-9a-f]+ <[^>]*> f01f d260 	sw	v0,-2048\(sp\)
[0-9a-f]+ <[^>]*> f01e d260 	sw	v0,-4096\(sp\)
[0-9a-f]+ <[^>]*> f01c d260 	sw	v0,-8192\(sp\)
[0-9a-f]+ <[^>]*> f018 d260 	sw	v0,-16384\(sp\)
[0-9a-f]+ <[^>]*> f010 d260 	sw	v0,-32768\(sp\)
[0-9a-f]+ <[^>]*> f003 92c0 	lw	v0,6144\(sp\)
[0-9a-f]+ <[^>]*> f003 92c1 	lw	v0,6145\(sp\)
[0-9a-f]+ <[^>]*> f003 92c2 	lw	v0,6146\(sp\)
[0-9a-f]+ <[^>]*> f003 92c3 	lw	v0,6147\(sp\)
[0-9a-f]+ <[^>]*> f003 92c4 	lw	v0,6148\(sp\)
[0-9a-f]+ <[^>]*> f003 92c8 	lw	v0,6152\(sp\)
[0-9a-f]+ <[^>]*> f003 92d0 	lw	v0,6160\(sp\)
[0-9a-f]+ <[^>]*> f023 92c0 	lw	v0,6176\(sp\)
[0-9a-f]+ <[^>]*> f043 92c0 	lw	v0,6208\(sp\)
[0-9a-f]+ <[^>]*> f083 92c0 	lw	v0,6272\(sp\)
[0-9a-f]+ <[^>]*> f0e3 92df 	lw	v0,6399\(sp\)
[0-9a-f]+ <[^>]*> f1e3 92df 	lw	v0,6655\(sp\)
[0-9a-f]+ <[^>]*> f1e3 92de 	lw	v0,6654\(sp\)
[0-9a-f]+ <[^>]*> f1e3 92dd 	lw	v0,6653\(sp\)
[0-9a-f]+ <[^>]*> f1e3 92dc 	lw	v0,6652\(sp\)
[0-9a-f]+ <[^>]*> f1e3 92d8 	lw	v0,6648\(sp\)
[0-9a-f]+ <[^>]*> f1e3 92d0 	lw	v0,6640\(sp\)
[0-9a-f]+ <[^>]*> f1e3 92c0 	lw	v0,6624\(sp\)
[0-9a-f]+ <[^>]*> f1c3 92c0 	lw	v0,6592\(sp\)
[0-9a-f]+ <[^>]*> f183 92c0 	lw	v0,6528\(sp\)
[0-9a-f]+ <[^>]*> f103 92c0 	lw	v0,6400\(sp\)
[0-9a-f]+ <[^>]*> f003 92e0 	lw	v0,6144\(sp\)
[0-9a-f]+ <[^>]*> f003 92e1 	lw	v0,6145\(sp\)
[0-9a-f]+ <[^>]*> f003 92e2 	lw	v0,6146\(sp\)
[0-9a-f]+ <[^>]*> f003 92e3 	lw	v0,6147\(sp\)
[0-9a-f]+ <[^>]*> f003 92e4 	lw	v0,6148\(sp\)
[0-9a-f]+ <[^>]*> f003 92e8 	lw	v0,6152\(sp\)
[0-9a-f]+ <[^>]*> f003 92f0 	lw	v0,6160\(sp\)
[0-9a-f]+ <[^>]*> f023 92e0 	lw	v0,6176\(sp\)
[0-9a-f]+ <[^>]*> f043 92e0 	lw	v0,6208\(sp\)
[0-9a-f]+ <[^>]*> f083 92e0 	lw	v0,6272\(sp\)
[0-9a-f]+ <[^>]*> f0e3 92ff 	lw	v0,6399\(sp\)
[0-9a-f]+ <[^>]*> f1e3 92ff 	lw	v0,6655\(sp\)
[0-9a-f]+ <[^>]*> f1e3 92fe 	lw	v0,6654\(sp\)
[0-9a-f]+ <[^>]*> f1e3 92fd 	lw	v0,6653\(sp\)
[0-9a-f]+ <[^>]*> f1e3 92fc 	lw	v0,6652\(sp\)
[0-9a-f]+ <[^>]*> f1e3 92f8 	lw	v0,6648\(sp\)
[0-9a-f]+ <[^>]*> f1e3 92f0 	lw	v0,6640\(sp\)
[0-9a-f]+ <[^>]*> f1e3 92e0 	lw	v0,6624\(sp\)
[0-9a-f]+ <[^>]*> f1c3 92e0 	lw	v0,6592\(sp\)
[0-9a-f]+ <[^>]*> f183 92e0 	lw	v0,6528\(sp\)
[0-9a-f]+ <[^>]*> f103 92e0 	lw	v0,6400\(sp\)
[0-9a-f]+ <[^>]*> f013 92e0 	lw	v0,-26624\(sp\)
[0-9a-f]+ <[^>]*> f013 92e1 	lw	v0,-26623\(sp\)
[0-9a-f]+ <[^>]*> f013 92e2 	lw	v0,-26622\(sp\)
[0-9a-f]+ <[^>]*> f013 92e3 	lw	v0,-26621\(sp\)
[0-9a-f]+ <[^>]*> f013 92e4 	lw	v0,-26620\(sp\)
[0-9a-f]+ <[^>]*> f013 92e8 	lw	v0,-26616\(sp\)
[0-9a-f]+ <[^>]*> f013 92f0 	lw	v0,-26608\(sp\)
[0-9a-f]+ <[^>]*> f033 92e0 	lw	v0,-26592\(sp\)
[0-9a-f]+ <[^>]*> f053 92e0 	lw	v0,-26560\(sp\)
[0-9a-f]+ <[^>]*> f093 92e0 	lw	v0,-26496\(sp\)
[0-9a-f]+ <[^>]*> f0f3 92ff 	lw	v0,-26369\(sp\)
[0-9a-f]+ <[^>]*> f1f3 92ff 	lw	v0,-26113\(sp\)
[0-9a-f]+ <[^>]*> f1f3 92fe 	lw	v0,-26114\(sp\)
[0-9a-f]+ <[^>]*> f1f3 92fd 	lw	v0,-26115\(sp\)
[0-9a-f]+ <[^>]*> f1f3 92fc 	lw	v0,-26116\(sp\)
[0-9a-f]+ <[^>]*> f1f3 92f8 	lw	v0,-26120\(sp\)
[0-9a-f]+ <[^>]*> f1f3 92f0 	lw	v0,-26128\(sp\)
[0-9a-f]+ <[^>]*> f1f3 92e0 	lw	v0,-26144\(sp\)
[0-9a-f]+ <[^>]*> f1d3 92e0 	lw	v0,-26176\(sp\)
[0-9a-f]+ <[^>]*> f193 92e0 	lw	v0,-26240\(sp\)
[0-9a-f]+ <[^>]*> f113 92e0 	lw	v0,-26368\(sp\)
[0-9a-f]+ <[^>]*> f003 d2c0 	sw	v0,6144\(sp\)
[0-9a-f]+ <[^>]*> f003 d2c1 	sw	v0,6145\(sp\)
[0-9a-f]+ <[^>]*> f003 d2c2 	sw	v0,6146\(sp\)
[0-9a-f]+ <[^>]*> f003 d2c3 	sw	v0,6147\(sp\)
[0-9a-f]+ <[^>]*> f003 d2c4 	sw	v0,6148\(sp\)
[0-9a-f]+ <[^>]*> f003 d2c8 	sw	v0,6152\(sp\)
[0-9a-f]+ <[^>]*> f003 d2d0 	sw	v0,6160\(sp\)
[0-9a-f]+ <[^>]*> f023 d2c0 	sw	v0,6176\(sp\)
[0-9a-f]+ <[^>]*> f043 d2c0 	sw	v0,6208\(sp\)
[0-9a-f]+ <[^>]*> f083 d2c0 	sw	v0,6272\(sp\)
[0-9a-f]+ <[^>]*> f0e3 d2df 	sw	v0,6399\(sp\)
[0-9a-f]+ <[^>]*> f1e3 d2df 	sw	v0,6655\(sp\)
[0-9a-f]+ <[^>]*> f1e3 d2de 	sw	v0,6654\(sp\)
[0-9a-f]+ <[^>]*> f1e3 d2dd 	sw	v0,6653\(sp\)
[0-9a-f]+ <[^>]*> f1e3 d2dc 	sw	v0,6652\(sp\)
[0-9a-f]+ <[^>]*> f1e3 d2d8 	sw	v0,6648\(sp\)
[0-9a-f]+ <[^>]*> f1e3 d2d0 	sw	v0,6640\(sp\)
[0-9a-f]+ <[^>]*> f1e3 d2c0 	sw	v0,6624\(sp\)
[0-9a-f]+ <[^>]*> f1c3 d2c0 	sw	v0,6592\(sp\)
[0-9a-f]+ <[^>]*> f183 d2c0 	sw	v0,6528\(sp\)
[0-9a-f]+ <[^>]*> f103 d2c0 	sw	v0,6400\(sp\)
[0-9a-f]+ <[^>]*> f003 d2e0 	sw	v0,6144\(sp\)
[0-9a-f]+ <[^>]*> f003 d2e1 	sw	v0,6145\(sp\)
[0-9a-f]+ <[^>]*> f003 d2e2 	sw	v0,6146\(sp\)
[0-9a-f]+ <[^>]*> f003 d2e3 	sw	v0,6147\(sp\)
[0-9a-f]+ <[^>]*> f003 d2e4 	sw	v0,6148\(sp\)
[0-9a-f]+ <[^>]*> f003 d2e8 	sw	v0,6152\(sp\)
[0-9a-f]+ <[^>]*> f003 d2f0 	sw	v0,6160\(sp\)
[0-9a-f]+ <[^>]*> f023 d2e0 	sw	v0,6176\(sp\)
[0-9a-f]+ <[^>]*> f043 d2e0 	sw	v0,6208\(sp\)
[0-9a-f]+ <[^>]*> f083 d2e0 	sw	v0,6272\(sp\)
[0-9a-f]+ <[^>]*> f0e3 d2ff 	sw	v0,6399\(sp\)
[0-9a-f]+ <[^>]*> f1e3 d2ff 	sw	v0,6655\(sp\)
[0-9a-f]+ <[^>]*> f1e3 d2fe 	sw	v0,6654\(sp\)
[0-9a-f]+ <[^>]*> f1e3 d2fd 	sw	v0,6653\(sp\)
[0-9a-f]+ <[^>]*> f1e3 d2fc 	sw	v0,6652\(sp\)
[0-9a-f]+ <[^>]*> f1e3 d2f8 	sw	v0,6648\(sp\)
[0-9a-f]+ <[^>]*> f1e3 d2f0 	sw	v0,6640\(sp\)
[0-9a-f]+ <[^>]*> f1e3 d2e0 	sw	v0,6624\(sp\)
[0-9a-f]+ <[^>]*> f1c3 d2e0 	sw	v0,6592\(sp\)
[0-9a-f]+ <[^>]*> f183 d2e0 	sw	v0,6528\(sp\)
[0-9a-f]+ <[^>]*> f103 d2e0 	sw	v0,6400\(sp\)
[0-9a-f]+ <[^>]*> f013 d2e0 	sw	v0,-26624\(sp\)
[0-9a-f]+ <[^>]*> f013 d2e1 	sw	v0,-26623\(sp\)
[0-9a-f]+ <[^>]*> f013 d2e2 	sw	v0,-26622\(sp\)
[0-9a-f]+ <[^>]*> f013 d2e3 	sw	v0,-26621\(sp\)
[0-9a-f]+ <[^>]*> f013 d2e4 	sw	v0,-26620\(sp\)
[0-9a-f]+ <[^>]*> f013 d2e8 	sw	v0,-26616\(sp\)
[0-9a-f]+ <[^>]*> f013 d2f0 	sw	v0,-26608\(sp\)
[0-9a-f]+ <[^>]*> f033 d2e0 	sw	v0,-26592\(sp\)
[0-9a-f]+ <[^>]*> f053 d2e0 	sw	v0,-26560\(sp\)
[0-9a-f]+ <[^>]*> f093 d2e0 	sw	v0,-26496\(sp\)
[0-9a-f]+ <[^>]*> f0f3 d2ff 	sw	v0,-26369\(sp\)
[0-9a-f]+ <[^>]*> f1f3 d2ff 	sw	v0,-26113\(sp\)
[0-9a-f]+ <[^>]*> f1f3 d2fe 	sw	v0,-26114\(sp\)
[0-9a-f]+ <[^>]*> f1f3 d2fd 	sw	v0,-26115\(sp\)
[0-9a-f]+ <[^>]*> f1f3 d2fc 	sw	v0,-26116\(sp\)
[0-9a-f]+ <[^>]*> f1f3 d2f8 	sw	v0,-26120\(sp\)
[0-9a-f]+ <[^>]*> f1f3 d2f0 	sw	v0,-26128\(sp\)
[0-9a-f]+ <[^>]*> f1f3 d2e0 	sw	v0,-26144\(sp\)
[0-9a-f]+ <[^>]*> f1d3 d2e0 	sw	v0,-26176\(sp\)
[0-9a-f]+ <[^>]*> f193 d2e0 	sw	v0,-26240\(sp\)
[0-9a-f]+ <[^>]*> f113 d2e0 	sw	v0,-26368\(sp\)
[0-9a-f]+ <[^>]*> f002 d3a0 	sw	v1,4096\(sp\)
[0-9a-f]+ <[^>]*> f002 d3a1 	sw	v1,4097\(sp\)
[0-9a-f]+ <[^>]*> f002 d3a2 	sw	v1,4098\(sp\)
[0-9a-f]+ <[^>]*> f002 d3a3 	sw	v1,4099\(sp\)
[0-9a-f]+ <[^>]*> f002 d3a4 	sw	v1,4100\(sp\)
[0-9a-f]+ <[^>]*> f002 d3a8 	sw	v1,4104\(sp\)
[0-9a-f]+ <[^>]*> f002 d3b0 	sw	v1,4112\(sp\)
[0-9a-f]+ <[^>]*> f022 d3a0 	sw	v1,4128\(sp\)
[0-9a-f]+ <[^>]*> f042 d3a0 	sw	v1,4160\(sp\)
[0-9a-f]+ <[^>]*> f082 d3a0 	sw	v1,4224\(sp\)
[0-9a-f]+ <[^>]*> f0e2 d3bf 	sw	v1,4351\(sp\)
[0-9a-f]+ <[^>]*> f1e2 d3bf 	sw	v1,4607\(sp\)
[0-9a-f]+ <[^>]*> f1e2 d3be 	sw	v1,4606\(sp\)
[0-9a-f]+ <[^>]*> f1e2 d3bd 	sw	v1,4605\(sp\)
[0-9a-f]+ <[^>]*> f1e2 d3bc 	sw	v1,4604\(sp\)
[0-9a-f]+ <[^>]*> f1e2 d3b8 	sw	v1,4600\(sp\)
[0-9a-f]+ <[^>]*> f1e2 d3b0 	sw	v1,4592\(sp\)
[0-9a-f]+ <[^>]*> f1e2 d3a0 	sw	v1,4576\(sp\)
[0-9a-f]+ <[^>]*> f1c2 d3a0 	sw	v1,4544\(sp\)
[0-9a-f]+ <[^>]*> f182 d3a0 	sw	v1,4480\(sp\)
[0-9a-f]+ <[^>]*> f102 d3a0 	sw	v1,4352\(sp\)
[0-9a-f]+ <[^>]*> f01d d3a0 	sw	v1,-6144\(sp\)
[0-9a-f]+ <[^>]*> f01d d3a1 	sw	v1,-6143\(sp\)
[0-9a-f]+ <[^>]*> f01d d3a2 	sw	v1,-6142\(sp\)
[0-9a-f]+ <[^>]*> f01d d3a3 	sw	v1,-6141\(sp\)
[0-9a-f]+ <[^>]*> f01d d3a4 	sw	v1,-6140\(sp\)
[0-9a-f]+ <[^>]*> f01d d3a8 	sw	v1,-6136\(sp\)
[0-9a-f]+ <[^>]*> f01d d3b0 	sw	v1,-6128\(sp\)
[0-9a-f]+ <[^>]*> f03d d3a0 	sw	v1,-6112\(sp\)
[0-9a-f]+ <[^>]*> f05d d3a0 	sw	v1,-6080\(sp\)
[0-9a-f]+ <[^>]*> f09d d3a0 	sw	v1,-6016\(sp\)
[0-9a-f]+ <[^>]*> f0fd d3bf 	sw	v1,-5889\(sp\)
[0-9a-f]+ <[^>]*> f1fd d3bf 	sw	v1,-5633\(sp\)
[0-9a-f]+ <[^>]*> f1fd d3be 	sw	v1,-5634\(sp\)
[0-9a-f]+ <[^>]*> f1fd d3bd 	sw	v1,-5635\(sp\)
[0-9a-f]+ <[^>]*> f1fd d3bc 	sw	v1,-5636\(sp\)
[0-9a-f]+ <[^>]*> f1fd d3b8 	sw	v1,-5640\(sp\)
[0-9a-f]+ <[^>]*> f1fd d3b0 	sw	v1,-5648\(sp\)
[0-9a-f]+ <[^>]*> f1fd d3a0 	sw	v1,-5664\(sp\)
[0-9a-f]+ <[^>]*> f1dd d3a0 	sw	v1,-5696\(sp\)
[0-9a-f]+ <[^>]*> f19d d3a0 	sw	v1,-5760\(sp\)
[0-9a-f]+ <[^>]*> f11d d3a0 	sw	v1,-5888\(sp\)
[0-9a-f]+ <[^>]*> f008 d380 	sw	v1,16384\(sp\)
[0-9a-f]+ <[^>]*> f008 d381 	sw	v1,16385\(sp\)
[0-9a-f]+ <[^>]*> f008 d382 	sw	v1,16386\(sp\)
[0-9a-f]+ <[^>]*> f008 d383 	sw	v1,16387\(sp\)
[0-9a-f]+ <[^>]*> f008 d384 	sw	v1,16388\(sp\)
[0-9a-f]+ <[^>]*> f008 d388 	sw	v1,16392\(sp\)
[0-9a-f]+ <[^>]*> f008 d390 	sw	v1,16400\(sp\)
[0-9a-f]+ <[^>]*> f028 d380 	sw	v1,16416\(sp\)
[0-9a-f]+ <[^>]*> f048 d380 	sw	v1,16448\(sp\)
[0-9a-f]+ <[^>]*> f088 d380 	sw	v1,16512\(sp\)
[0-9a-f]+ <[^>]*> f0e8 d39f 	sw	v1,16639\(sp\)
[0-9a-f]+ <[^>]*> f1e8 d39f 	sw	v1,16895\(sp\)
[0-9a-f]+ <[^>]*> f1e8 d39e 	sw	v1,16894\(sp\)
[0-9a-f]+ <[^>]*> f1e8 d39d 	sw	v1,16893\(sp\)
[0-9a-f]+ <[^>]*> f1e8 d39c 	sw	v1,16892\(sp\)
[0-9a-f]+ <[^>]*> f1e8 d398 	sw	v1,16888\(sp\)
[0-9a-f]+ <[^>]*> f1e8 d390 	sw	v1,16880\(sp\)
[0-9a-f]+ <[^>]*> f1e8 d380 	sw	v1,16864\(sp\)
[0-9a-f]+ <[^>]*> f1c8 d380 	sw	v1,16832\(sp\)
[0-9a-f]+ <[^>]*> f188 d380 	sw	v1,16768\(sp\)
[0-9a-f]+ <[^>]*> f108 d380 	sw	v1,16640\(sp\)
[0-9a-f]+ <[^>]*> f017 d380 	sw	v1,-18432\(sp\)
[0-9a-f]+ <[^>]*> f017 d381 	sw	v1,-18431\(sp\)
[0-9a-f]+ <[^>]*> f017 d382 	sw	v1,-18430\(sp\)
[0-9a-f]+ <[^>]*> f017 d383 	sw	v1,-18429\(sp\)
[0-9a-f]+ <[^>]*> f017 d384 	sw	v1,-18428\(sp\)
[0-9a-f]+ <[^>]*> f017 d388 	sw	v1,-18424\(sp\)
[0-9a-f]+ <[^>]*> f017 d390 	sw	v1,-18416\(sp\)
[0-9a-f]+ <[^>]*> f037 d380 	sw	v1,-18400\(sp\)
[0-9a-f]+ <[^>]*> f057 d380 	sw	v1,-18368\(sp\)
[0-9a-f]+ <[^>]*> f097 d380 	sw	v1,-18304\(sp\)
[0-9a-f]+ <[^>]*> f0f7 d39f 	sw	v1,-18177\(sp\)
[0-9a-f]+ <[^>]*> f1f7 d39f 	sw	v1,-17921\(sp\)
[0-9a-f]+ <[^>]*> f1f7 d39e 	sw	v1,-17922\(sp\)
[0-9a-f]+ <[^>]*> f1f7 d39d 	sw	v1,-17923\(sp\)
[0-9a-f]+ <[^>]*> f1f7 d39c 	sw	v1,-17924\(sp\)
[0-9a-f]+ <[^>]*> f1f7 d398 	sw	v1,-17928\(sp\)
[0-9a-f]+ <[^>]*> f1f7 d390 	sw	v1,-17936\(sp\)
[0-9a-f]+ <[^>]*> f1f7 d380 	sw	v1,-17952\(sp\)
[0-9a-f]+ <[^>]*> f1d7 d380 	sw	v1,-17984\(sp\)
[0-9a-f]+ <[^>]*> f197 d380 	sw	v1,-18048\(sp\)
[0-9a-f]+ <[^>]*> f117 d380 	sw	v1,-18176\(sp\)
[0-9a-f]+ <[^>]*> f000 0220 	addiu	v0,sp,0
[0-9a-f]+ <[^>]*> f000 0221 	addiu	v0,sp,1
[0-9a-f]+ <[^>]*> f000 0222 	addiu	v0,sp,2
[0-9a-f]+ <[^>]*> f000 0224 	addiu	v0,sp,4
[0-9a-f]+ <[^>]*> f000 0228 	addiu	v0,sp,8
[0-9a-f]+ <[^>]*> f000 0230 	addiu	v0,sp,16
[0-9a-f]+ <[^>]*> f020 0220 	addiu	v0,sp,32
[0-9a-f]+ <[^>]*> f040 0220 	addiu	v0,sp,64
[0-9a-f]+ <[^>]*> f080 0220 	addiu	v0,sp,128
[0-9a-f]+ <[^>]*> f100 0220 	addiu	v0,sp,256
[0-9a-f]+ <[^>]*> f200 0220 	addiu	v0,sp,512
[0-9a-f]+ <[^>]*> f400 0220 	addiu	v0,sp,1024
[0-9a-f]+ <[^>]*> f001 0220 	addiu	v0,sp,2048
[0-9a-f]+ <[^>]*> f002 0220 	addiu	v0,sp,4096
[0-9a-f]+ <[^>]*> f004 0220 	addiu	v0,sp,8192
[0-9a-f]+ <[^>]*> f008 0220 	addiu	v0,sp,16384
[0-9a-f]+ <[^>]*> f7ef 023f 	addiu	v0,sp,32767
[0-9a-f]+ <[^>]*> f7ff 023f 	addiu	v0,sp,-1
[0-9a-f]+ <[^>]*> f7ff 023e 	addiu	v0,sp,-2
[0-9a-f]+ <[^>]*> f7ff 023c 	addiu	v0,sp,-4
[0-9a-f]+ <[^>]*> f7ff 0238 	addiu	v0,sp,-8
[0-9a-f]+ <[^>]*> f7ff 0230 	addiu	v0,sp,-16
[0-9a-f]+ <[^>]*> f7ff 0220 	addiu	v0,sp,-32
[0-9a-f]+ <[^>]*> f7df 0220 	addiu	v0,sp,-64
[0-9a-f]+ <[^>]*> f79f 0220 	addiu	v0,sp,-128
[0-9a-f]+ <[^>]*> f71f 0220 	addiu	v0,sp,-256
[0-9a-f]+ <[^>]*> f61f 0220 	addiu	v0,sp,-512
[0-9a-f]+ <[^>]*> f41f 0220 	addiu	v0,sp,-1024
[0-9a-f]+ <[^>]*> f01f 0220 	addiu	v0,sp,-2048
[0-9a-f]+ <[^>]*> f01e 0220 	addiu	v0,sp,-4096
[0-9a-f]+ <[^>]*> f01c 0220 	addiu	v0,sp,-8192
[0-9a-f]+ <[^>]*> f018 0220 	addiu	v0,sp,-16384
[0-9a-f]+ <[^>]*> f010 0220 	addiu	v0,sp,-32768
[0-9a-f]+ <[^>]*> f000 0220 	addiu	v0,sp,0
[0-9a-f]+ <[^>]*> f000 0221 	addiu	v0,sp,1
[0-9a-f]+ <[^>]*> f000 0222 	addiu	v0,sp,2
[0-9a-f]+ <[^>]*> f000 0224 	addiu	v0,sp,4
[0-9a-f]+ <[^>]*> f000 0228 	addiu	v0,sp,8
[0-9a-f]+ <[^>]*> f000 0230 	addiu	v0,sp,16
[0-9a-f]+ <[^>]*> f020 0220 	addiu	v0,sp,32
[0-9a-f]+ <[^>]*> f040 0220 	addiu	v0,sp,64
[0-9a-f]+ <[^>]*> f080 0220 	addiu	v0,sp,128
[0-9a-f]+ <[^>]*> f100 0220 	addiu	v0,sp,256
[0-9a-f]+ <[^>]*> f200 0220 	addiu	v0,sp,512
[0-9a-f]+ <[^>]*> f400 0220 	addiu	v0,sp,1024
[0-9a-f]+ <[^>]*> f001 0220 	addiu	v0,sp,2048
[0-9a-f]+ <[^>]*> f002 0220 	addiu	v0,sp,4096
[0-9a-f]+ <[^>]*> f004 0220 	addiu	v0,sp,8192
[0-9a-f]+ <[^>]*> f008 0220 	addiu	v0,sp,16384
[0-9a-f]+ <[^>]*> f7ef 023f 	addiu	v0,sp,32767
[0-9a-f]+ <[^>]*> f7ff 023f 	addiu	v0,sp,-1
[0-9a-f]+ <[^>]*> f7ff 023e 	addiu	v0,sp,-2
[0-9a-f]+ <[^>]*> f7ff 023c 	addiu	v0,sp,-4
[0-9a-f]+ <[^>]*> f7ff 0238 	addiu	v0,sp,-8
[0-9a-f]+ <[^>]*> f7ff 0230 	addiu	v0,sp,-16
[0-9a-f]+ <[^>]*> f7ff 0220 	addiu	v0,sp,-32
[0-9a-f]+ <[^>]*> f7df 0220 	addiu	v0,sp,-64
[0-9a-f]+ <[^>]*> f79f 0220 	addiu	v0,sp,-128
[0-9a-f]+ <[^>]*> f71f 0220 	addiu	v0,sp,-256
[0-9a-f]+ <[^>]*> f61f 0220 	addiu	v0,sp,-512
[0-9a-f]+ <[^>]*> f41f 0220 	addiu	v0,sp,-1024
[0-9a-f]+ <[^>]*> f01f 0220 	addiu	v0,sp,-2048
[0-9a-f]+ <[^>]*> f01e 0220 	addiu	v0,sp,-4096
[0-9a-f]+ <[^>]*> f01c 0220 	addiu	v0,sp,-8192
[0-9a-f]+ <[^>]*> f018 0220 	addiu	v0,sp,-16384
[0-9a-f]+ <[^>]*> f010 0220 	addiu	v0,sp,-32768
[0-9a-f]+ <[^>]*> f000 6a20 	li	v0,0
[0-9a-f]+ <[^>]*> f000 6a21 	li	v0,1
[0-9a-f]+ <[^>]*> f000 6a22 	li	v0,2
[0-9a-f]+ <[^>]*> f000 6a24 	li	v0,4
[0-9a-f]+ <[^>]*> f000 6a28 	li	v0,8
[0-9a-f]+ <[^>]*> f000 6a30 	li	v0,16
[0-9a-f]+ <[^>]*> f020 6a20 	li	v0,32
[0-9a-f]+ <[^>]*> f040 6a20 	li	v0,64
[0-9a-f]+ <[^>]*> f080 6a20 	li	v0,128
[0-9a-f]+ <[^>]*> f100 6a20 	li	v0,256
[0-9a-f]+ <[^>]*> f200 6a20 	li	v0,512
[0-9a-f]+ <[^>]*> f400 6a20 	li	v0,1024
[0-9a-f]+ <[^>]*> f001 6a20 	li	v0,2048
[0-9a-f]+ <[^>]*> f002 6a20 	li	v0,4096
[0-9a-f]+ <[^>]*> f004 6a20 	li	v0,8192
[0-9a-f]+ <[^>]*> f008 6a20 	li	v0,16384
[0-9a-f]+ <[^>]*> f7ef 6a3f 	li	v0,32767
[0-9a-f]+ <[^>]*> f010 6a20 	li	v0,32768
[0-9a-f]+ <[^>]*> f7ff 6a3f 	li	v0,65535
[0-9a-f]+ <[^>]*> f000 6a60 	li	v0,0
[0-9a-f]+ <[^>]*> f000 6a61 	li	v0,1
[0-9a-f]+ <[^>]*> f000 6a62 	li	v0,2
[0-9a-f]+ <[^>]*> f000 6a64 	li	v0,4
[0-9a-f]+ <[^>]*> f000 6a68 	li	v0,8
[0-9a-f]+ <[^>]*> f000 6a70 	li	v0,16
[0-9a-f]+ <[^>]*> f020 6a60 	li	v0,32
[0-9a-f]+ <[^>]*> f040 6a60 	li	v0,64
[0-9a-f]+ <[^>]*> f080 6a60 	li	v0,128
[0-9a-f]+ <[^>]*> f100 6a60 	li	v0,256
[0-9a-f]+ <[^>]*> f200 6a60 	li	v0,512
[0-9a-f]+ <[^>]*> f400 6a60 	li	v0,1024
[0-9a-f]+ <[^>]*> f001 6a60 	li	v0,2048
[0-9a-f]+ <[^>]*> f002 6a60 	li	v0,4096
[0-9a-f]+ <[^>]*> f004 6a60 	li	v0,8192
[0-9a-f]+ <[^>]*> f008 6a60 	li	v0,16384
[0-9a-f]+ <[^>]*> f7ef 6a7f 	li	v0,32767
[0-9a-f]+ <[^>]*> f010 6a60 	li	v0,32768
[0-9a-f]+ <[^>]*> f7ff 6a7f 	li	v0,65535
[0-9a-f]+ <[^>]*> f000 6a40 	li	v0,0
[0-9a-f]+ <[^>]*> f000 6a41 	li	v0,1
[0-9a-f]+ <[^>]*> f000 6a42 	li	v0,2
[0-9a-f]+ <[^>]*> f000 6a44 	li	v0,4
[0-9a-f]+ <[^>]*> f000 6a48 	li	v0,8
[0-9a-f]+ <[^>]*> f000 6a50 	li	v0,16
[0-9a-f]+ <[^>]*> f020 6a40 	li	v0,32
[0-9a-f]+ <[^>]*> f040 6a40 	li	v0,64
[0-9a-f]+ <[^>]*> f080 6a40 	li	v0,128
[0-9a-f]+ <[^>]*> f100 6a40 	li	v0,256
[0-9a-f]+ <[^>]*> f200 6a40 	li	v0,512
[0-9a-f]+ <[^>]*> f400 6a40 	li	v0,1024
[0-9a-f]+ <[^>]*> f001 6a40 	li	v0,2048
[0-9a-f]+ <[^>]*> f002 6a40 	li	v0,4096
[0-9a-f]+ <[^>]*> f004 6a40 	li	v0,8192
[0-9a-f]+ <[^>]*> f008 6a40 	li	v0,16384
[0-9a-f]+ <[^>]*> f7ef 6a5f 	li	v0,32767
[0-9a-f]+ <[^>]*> f010 6a40 	li	v0,32768
[0-9a-f]+ <[^>]*> f7ff 6a5f 	li	v0,65535
[0-9a-f]+ <[^>]*> f000 6a80 	li	v0,0
[0-9a-f]+ <[^>]*> f000 6a81 	li	v0,1
[0-9a-f]+ <[^>]*> f000 6a82 	li	v0,2
[0-9a-f]+ <[^>]*> f000 6a84 	li	v0,4
[0-9a-f]+ <[^>]*> f000 6a88 	li	v0,8
[0-9a-f]+ <[^>]*> f000 6a90 	li	v0,16
[0-9a-f]+ <[^>]*> f020 6a80 	li	v0,32
[0-9a-f]+ <[^>]*> f040 6a80 	li	v0,64
[0-9a-f]+ <[^>]*> f080 6a80 	li	v0,128
[0-9a-f]+ <[^>]*> f100 6a80 	li	v0,256
[0-9a-f]+ <[^>]*> f200 6a80 	li	v0,512
[0-9a-f]+ <[^>]*> f400 6a80 	li	v0,1024
[0-9a-f]+ <[^>]*> f001 6a80 	li	v0,2048
[0-9a-f]+ <[^>]*> f002 6a80 	li	v0,4096
[0-9a-f]+ <[^>]*> f004 6a80 	li	v0,8192
[0-9a-f]+ <[^>]*> f008 6a80 	li	v0,16384
[0-9a-f]+ <[^>]*> f7ef 6a9f 	li	v0,32767
[0-9a-f]+ <[^>]*> f010 6a80 	li	v0,32768
[0-9a-f]+ <[^>]*> f7ff 6a9f 	li	v0,65535
[0-9a-f]+ <[^>]*> f03f 3348 	sll	v1,v0,0
[0-9a-f]+ <[^>]*> f078 3348 	sll	v1,v0,1
[0-9a-f]+ <[^>]*> f0b0 3348 	sll	v1,v0,2
[0-9a-f]+ <[^>]*> f0ec 3348 	sll	v1,v0,3
[0-9a-f]+ <[^>]*> f128 3348 	sll	v1,v0,4
[0-9a-f]+ <[^>]*> f1a6 3348 	sll	v1,v0,6
[0-9a-f]+ <[^>]*> f224 3348 	sll	v1,v0,8
[0-9a-f]+ <[^>]*> f323 3348 	sll	v1,v0,12
[0-9a-f]+ <[^>]*> f422 3348 	sll	v1,v0,16
[0-9a-f]+ <[^>]*> f621 3348 	sll	v1,v0,24
[0-9a-f]+ <[^>]*> f7e0 3348 	sll	v1,v0,31
[0-9a-f]+ <[^>]*> f03f 3344 	sll	v1,v0,0
[0-9a-f]+ <[^>]*> f079 3344 	sll	v1,v0,1
[0-9a-f]+ <[^>]*> f0b2 3344 	sll	v1,v0,2
[0-9a-f]+ <[^>]*> f0ef 3344 	sll	v1,v0,3
[0-9a-f]+ <[^>]*> f12c 3344 	sll	v1,v0,4
[0-9a-f]+ <[^>]*> f1ac 3344 	sll	v1,v0,6
[0-9a-f]+ <[^>]*> f22c 3344 	sll	v1,v0,8
[0-9a-f]+ <[^>]*> f32f 3344 	sll	v1,v0,12
[0-9a-f]+ <[^>]*> f432 3344 	sll	v1,v0,16
[0-9a-f]+ <[^>]*> f639 3344 	sll	v1,v0,24
[0-9a-f]+ <[^>]*> f7ff 3344 	sll	v1,v0,31
[0-9a-f]+ <[^>]*> f01f 30c4 	sll	s0,a2,0
[0-9a-f]+ <[^>]*> f059 30c4 	sll	s0,a2,1
[0-9a-f]+ <[^>]*> f092 30c4 	sll	s0,a2,2
[0-9a-f]+ <[^>]*> f0cf 30c4 	sll	s0,a2,3
[0-9a-f]+ <[^>]*> f10c 30c4 	sll	s0,a2,4
[0-9a-f]+ <[^>]*> f18c 30c4 	sll	s0,a2,6
[0-9a-f]+ <[^>]*> f20c 30c4 	sll	s0,a2,8
[0-9a-f]+ <[^>]*> f30f 30c4 	sll	s0,a2,12
[0-9a-f]+ <[^>]*> f412 30c4 	sll	s0,a2,16
[0-9a-f]+ <[^>]*> f619 30c4 	sll	s0,a2,24
[0-9a-f]+ <[^>]*> f7df 30c4 	sll	s0,a2,31
[0-9a-f]+ <[^>]*> f023 328a 	srl	v0,a0,0
[0-9a-f]+ <[^>]*> f025 344a 	srl	a0,v0,0
[0-9a-f]+ <[^>]*> f026 372a 	srl	a3,s1,0
[0-9a-f]+ <[^>]*> f000 328a 	srl	v0,a0,0
[0-9a-f]+ <[^>]*> f023 3286 	srl	v0,a0,0
[0-9a-f]+ <[^>]*> f025 3446 	srl	a0,v0,0
[0-9a-f]+ <[^>]*> f026 31e6 	srl	s1,a3,0
[0-9a-f]+ <[^>]*> f000 3286 	srl	v0,a0,0
[0-9a-f]+ <[^>]*> f023 321a 	srl	v0,s0,0
[0-9a-f]+ <[^>]*> f025 341a 	srl	a0,s0,0
[0-9a-f]+ <[^>]*> f026 371a 	srl	a3,s0,0
[0-9a-f]+ <[^>]*> f000 321a 	srl	v0,s0,0
[0-9a-f]+ <[^>]*> f023 3216 	srl	v0,s0,0
[0-9a-f]+ <[^>]*> f025 3416 	srl	a0,s0,0
[0-9a-f]+ <[^>]*> f026 3116 	srl	s1,s0,0
[0-9a-f]+ <[^>]*> f000 3216 	srl	v0,s0,0
[0-9a-f]+ <[^>]*> f0c0 3010 	sll	s0,3
[0-9a-f]+ <[^>]*> f140 3018 	sll	s0,5
[0-9a-f]+ <[^>]*> f000 3014 	sll	s0,0
[0-9a-f]+ <[^>]*> f040 3014 	sll	s0,1
[0-9a-f]+ <[^>]*> f100 3014 	sll	s0,4
[0-9a-f]+ <[^>]*> f340 3014 	sll	s0,13
[0-9a-f]+ <[^>]*> f7c0 3014 	sll	s0,31
[0-9a-f]+ <[^>]*> f100 3014 	sll	s0,4
[0-9a-f]+ <[^>]*> f400 3014 	sll	s0,16
[0-9a-f]+ <[^>]*> f440 3014 	sll	s0,17
[0-9a-f]+ <[^>]*> f480 3014 	sll	s0,18
[0-9a-f]+ <[^>]*> f4c0 3014 	sll	s0,19
[0-9a-f]+ <[^>]*> f001 304c 	sll	s0,v0,0
[0-9a-f]+ <[^>]*> f005 306c 	sll	s0,v1,0
[0-9a-f]+ <[^>]*> f01d 308c 	sll	s0,a0,0
[0-9a-f]+ <[^>]*> f01f 30ac 	sll	s0,a1,0
[0-9a-f]+ <[^>]*> f006      	extend	0x6
[0-9a-f]+ <[^>]*> 670c      	move	s0,t4
[0-9a-f]+ <[^>]*> f006      	extend	0x6
[0-9a-f]+ <[^>]*> 670c      	move	s0,t4
[0-9a-f]+ <[^>]*> f002      	extend	0x2
[0-9a-f]+ <[^>]*> 674c      	move	v0,t4
[0-9a-f]+ <[^>]*> f007      	extend	0x7
[0-9a-f]+ <[^>]*> 670c      	move	s0,t4
[0-9a-f]+ <[^>]*> f007      	extend	0x7
[0-9a-f]+ <[^>]*> 670c      	move	s0,t4
[0-9a-f]+ <[^>]*> f003      	extend	0x3
[0-9a-f]+ <[^>]*> 674c      	move	v0,t4
[0-9a-f]+ <[^>]*> f000      	extend	0x0
[0-9a-f]+ <[^>]*> 6765      	move	v1,a1
[0-9a-f]+ <[^>]*> f000      	extend	0x0
[0-9a-f]+ <[^>]*> 67a9      	move	a1,t1
[0-9a-f]+ <[^>]*> f060      	extend	0x60
[0-9a-f]+ <[^>]*> 67ed      	move	a3,t5
[0-9a-f]+ <[^>]*> f020      	extend	0x20
[0-9a-f]+ <[^>]*> 672f      	move	s1,t7
[0-9a-f]+ <[^>]*> f0e0      	extend	0xe0
[0-9a-f]+ <[^>]*> 6751      	move	v0,s1
[0-9a-f]+ <[^>]*> f000      	extend	0x0
[0-9a-f]+ <[^>]*> 67d5      	move	a2,s5
[0-9a-f]+ <[^>]*> f001      	extend	0x1
[0-9a-f]+ <[^>]*> 6765      	move	v1,a1
[0-9a-f]+ <[^>]*> f001      	extend	0x1
[0-9a-f]+ <[^>]*> 67a9      	move	a1,t1
[0-9a-f]+ <[^>]*> f061      	extend	0x61
[0-9a-f]+ <[^>]*> 67ed      	move	a3,t5
[0-9a-f]+ <[^>]*> f021      	extend	0x21
[0-9a-f]+ <[^>]*> 672f      	move	s1,t7
[0-9a-f]+ <[^>]*> f0e1      	extend	0xe1
[0-9a-f]+ <[^>]*> 6751      	move	v0,s1
[0-9a-f]+ <[^>]*> f001      	extend	0x1
[0-9a-f]+ <[^>]*> 67d5      	move	a2,s5
	\.\.\.
