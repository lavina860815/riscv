#objdump: -dr --prefix-addresses --show-raw-insn
#name: MIPS16e2 ASE instructions
#as: -32

.*: +file format .*mips.*

Disassembly of section \.text:
[0-9a-f]+ <[^>]*> f000 9220 	lw	v0,0\(gp\)
[0-9a-f]+ <[^>]*> f000 9221 	lw	v0,1\(gp\)
[0-9a-f]+ <[^>]*> f000 9222 	lw	v0,2\(gp\)
[0-9a-f]+ <[^>]*> f000 9223 	lw	v0,3\(gp\)
[0-9a-f]+ <[^>]*> f000 9224 	lw	v0,4\(gp\)
[0-9a-f]+ <[^>]*> f000 9228 	lw	v0,8\(gp\)
[0-9a-f]+ <[^>]*> f000 9230 	lw	v0,16\(gp\)
[0-9a-f]+ <[^>]*> f020 9220 	lw	v0,32\(gp\)
[0-9a-f]+ <[^>]*> f040 9220 	lw	v0,64\(gp\)
[0-9a-f]+ <[^>]*> f080 9220 	lw	v0,128\(gp\)
[0-9a-f]+ <[^>]*> f0e0 923f 	lw	v0,255\(gp\)
[0-9a-f]+ <[^>]*> f100 9220 	lw	v0,256\(gp\)
[0-9a-f]+ <[^>]*> f200 9220 	lw	v0,512\(gp\)
[0-9a-f]+ <[^>]*> f400 9220 	lw	v0,1024\(gp\)
[0-9a-f]+ <[^>]*> f001 9220 	lw	v0,2048\(gp\)
[0-9a-f]+ <[^>]*> f002 9220 	lw	v0,4096\(gp\)
[0-9a-f]+ <[^>]*> f004 9220 	lw	v0,8192\(gp\)
[0-9a-f]+ <[^>]*> f008 9220 	lw	v0,16384\(gp\)
[0-9a-f]+ <[^>]*> f7ef 923f 	lw	v0,32767\(gp\)
[0-9a-f]+ <[^>]*> f7ff 923f 	lw	v0,-1\(gp\)
[0-9a-f]+ <[^>]*> f7ff 923e 	lw	v0,-2\(gp\)
[0-9a-f]+ <[^>]*> f7ff 923d 	lw	v0,-3\(gp\)
[0-9a-f]+ <[^>]*> f7ff 923c 	lw	v0,-4\(gp\)
[0-9a-f]+ <[^>]*> f7ff 9238 	lw	v0,-8\(gp\)
[0-9a-f]+ <[^>]*> f7ff 9230 	lw	v0,-16\(gp\)
[0-9a-f]+ <[^>]*> f7ff 9220 	lw	v0,-32\(gp\)
[0-9a-f]+ <[^>]*> f7df 9220 	lw	v0,-64\(gp\)
[0-9a-f]+ <[^>]*> f79f 9220 	lw	v0,-128\(gp\)
[0-9a-f]+ <[^>]*> f71f 9220 	lw	v0,-256\(gp\)
[0-9a-f]+ <[^>]*> f61f 9220 	lw	v0,-512\(gp\)
[0-9a-f]+ <[^>]*> f41f 9220 	lw	v0,-1024\(gp\)
[0-9a-f]+ <[^>]*> f01f 9220 	lw	v0,-2048\(gp\)
[0-9a-f]+ <[^>]*> f01e 9220 	lw	v0,-4096\(gp\)
[0-9a-f]+ <[^>]*> f01c 9220 	lw	v0,-8192\(gp\)
[0-9a-f]+ <[^>]*> f018 9220 	lw	v0,-16384\(gp\)
[0-9a-f]+ <[^>]*> f010 9220 	lw	v0,-32768\(gp\)
[0-9a-f]+ <[^>]*> f000 9240 	lh	v0,0\(gp\)
[0-9a-f]+ <[^>]*> f000 9241 	lh	v0,1\(gp\)
[0-9a-f]+ <[^>]*> f000 9242 	lh	v0,2\(gp\)
[0-9a-f]+ <[^>]*> f000 9243 	lh	v0,3\(gp\)
[0-9a-f]+ <[^>]*> f000 9244 	lh	v0,4\(gp\)
[0-9a-f]+ <[^>]*> f000 9248 	lh	v0,8\(gp\)
[0-9a-f]+ <[^>]*> f000 9250 	lh	v0,16\(gp\)
[0-9a-f]+ <[^>]*> f020 9240 	lh	v0,32\(gp\)
[0-9a-f]+ <[^>]*> f040 9240 	lh	v0,64\(gp\)
[0-9a-f]+ <[^>]*> f080 9240 	lh	v0,128\(gp\)
[0-9a-f]+ <[^>]*> f0e0 925f 	lh	v0,255\(gp\)
[0-9a-f]+ <[^>]*> f100 9240 	lh	v0,256\(gp\)
[0-9a-f]+ <[^>]*> f200 9240 	lh	v0,512\(gp\)
[0-9a-f]+ <[^>]*> f400 9240 	lh	v0,1024\(gp\)
[0-9a-f]+ <[^>]*> f001 9240 	lh	v0,2048\(gp\)
[0-9a-f]+ <[^>]*> f002 9240 	lh	v0,4096\(gp\)
[0-9a-f]+ <[^>]*> f004 9240 	lh	v0,8192\(gp\)
[0-9a-f]+ <[^>]*> f008 9240 	lh	v0,16384\(gp\)
[0-9a-f]+ <[^>]*> f7ef 925f 	lh	v0,32767\(gp\)
[0-9a-f]+ <[^>]*> f7ff 925f 	lh	v0,-1\(gp\)
[0-9a-f]+ <[^>]*> f7ff 925e 	lh	v0,-2\(gp\)
[0-9a-f]+ <[^>]*> f7ff 925d 	lh	v0,-3\(gp\)
[0-9a-f]+ <[^>]*> f7ff 925c 	lh	v0,-4\(gp\)
[0-9a-f]+ <[^>]*> f7ff 9258 	lh	v0,-8\(gp\)
[0-9a-f]+ <[^>]*> f7ff 9250 	lh	v0,-16\(gp\)
[0-9a-f]+ <[^>]*> f7ff 9240 	lh	v0,-32\(gp\)
[0-9a-f]+ <[^>]*> f7df 9240 	lh	v0,-64\(gp\)
[0-9a-f]+ <[^>]*> f79f 9240 	lh	v0,-128\(gp\)
[0-9a-f]+ <[^>]*> f71f 9240 	lh	v0,-256\(gp\)
[0-9a-f]+ <[^>]*> f61f 9240 	lh	v0,-512\(gp\)
[0-9a-f]+ <[^>]*> f41f 9240 	lh	v0,-1024\(gp\)
[0-9a-f]+ <[^>]*> f01f 9240 	lh	v0,-2048\(gp\)
[0-9a-f]+ <[^>]*> f01e 9240 	lh	v0,-4096\(gp\)
[0-9a-f]+ <[^>]*> f01c 9240 	lh	v0,-8192\(gp\)
[0-9a-f]+ <[^>]*> f018 9240 	lh	v0,-16384\(gp\)
[0-9a-f]+ <[^>]*> f010 9240 	lh	v0,-32768\(gp\)
[0-9a-f]+ <[^>]*> f000 9280 	lhu	v0,0\(gp\)
[0-9a-f]+ <[^>]*> f000 9281 	lhu	v0,1\(gp\)
[0-9a-f]+ <[^>]*> f000 9282 	lhu	v0,2\(gp\)
[0-9a-f]+ <[^>]*> f000 9283 	lhu	v0,3\(gp\)
[0-9a-f]+ <[^>]*> f000 9284 	lhu	v0,4\(gp\)
[0-9a-f]+ <[^>]*> f000 9288 	lhu	v0,8\(gp\)
[0-9a-f]+ <[^>]*> f000 9290 	lhu	v0,16\(gp\)
[0-9a-f]+ <[^>]*> f020 9280 	lhu	v0,32\(gp\)
[0-9a-f]+ <[^>]*> f040 9280 	lhu	v0,64\(gp\)
[0-9a-f]+ <[^>]*> f080 9280 	lhu	v0,128\(gp\)
[0-9a-f]+ <[^>]*> f0e0 929f 	lhu	v0,255\(gp\)
[0-9a-f]+ <[^>]*> f100 9280 	lhu	v0,256\(gp\)
[0-9a-f]+ <[^>]*> f200 9280 	lhu	v0,512\(gp\)
[0-9a-f]+ <[^>]*> f400 9280 	lhu	v0,1024\(gp\)
[0-9a-f]+ <[^>]*> f001 9280 	lhu	v0,2048\(gp\)
[0-9a-f]+ <[^>]*> f002 9280 	lhu	v0,4096\(gp\)
[0-9a-f]+ <[^>]*> f004 9280 	lhu	v0,8192\(gp\)
[0-9a-f]+ <[^>]*> f008 9280 	lhu	v0,16384\(gp\)
[0-9a-f]+ <[^>]*> f7ef 929f 	lhu	v0,32767\(gp\)
[0-9a-f]+ <[^>]*> f7ff 929f 	lhu	v0,-1\(gp\)
[0-9a-f]+ <[^>]*> f7ff 929e 	lhu	v0,-2\(gp\)
[0-9a-f]+ <[^>]*> f7ff 929d 	lhu	v0,-3\(gp\)
[0-9a-f]+ <[^>]*> f7ff 929c 	lhu	v0,-4\(gp\)
[0-9a-f]+ <[^>]*> f7ff 9298 	lhu	v0,-8\(gp\)
[0-9a-f]+ <[^>]*> f7ff 9290 	lhu	v0,-16\(gp\)
[0-9a-f]+ <[^>]*> f7ff 9280 	lhu	v0,-32\(gp\)
[0-9a-f]+ <[^>]*> f7df 9280 	lhu	v0,-64\(gp\)
[0-9a-f]+ <[^>]*> f79f 9280 	lhu	v0,-128\(gp\)
[0-9a-f]+ <[^>]*> f71f 9280 	lhu	v0,-256\(gp\)
[0-9a-f]+ <[^>]*> f61f 9280 	lhu	v0,-512\(gp\)
[0-9a-f]+ <[^>]*> f41f 9280 	lhu	v0,-1024\(gp\)
[0-9a-f]+ <[^>]*> f01f 9280 	lhu	v0,-2048\(gp\)
[0-9a-f]+ <[^>]*> f01e 9280 	lhu	v0,-4096\(gp\)
[0-9a-f]+ <[^>]*> f01c 9280 	lhu	v0,-8192\(gp\)
[0-9a-f]+ <[^>]*> f018 9280 	lhu	v0,-16384\(gp\)
[0-9a-f]+ <[^>]*> f010 9280 	lhu	v0,-32768\(gp\)
[0-9a-f]+ <[^>]*> f000 9260 	lb	v0,0\(gp\)
[0-9a-f]+ <[^>]*> f000 9261 	lb	v0,1\(gp\)
[0-9a-f]+ <[^>]*> f000 9262 	lb	v0,2\(gp\)
[0-9a-f]+ <[^>]*> f000 9263 	lb	v0,3\(gp\)
[0-9a-f]+ <[^>]*> f000 9264 	lb	v0,4\(gp\)
[0-9a-f]+ <[^>]*> f000 9268 	lb	v0,8\(gp\)
[0-9a-f]+ <[^>]*> f000 9270 	lb	v0,16\(gp\)
[0-9a-f]+ <[^>]*> f020 9260 	lb	v0,32\(gp\)
[0-9a-f]+ <[^>]*> f040 9260 	lb	v0,64\(gp\)
[0-9a-f]+ <[^>]*> f080 9260 	lb	v0,128\(gp\)
[0-9a-f]+ <[^>]*> f0e0 927f 	lb	v0,255\(gp\)
[0-9a-f]+ <[^>]*> f100 9260 	lb	v0,256\(gp\)
[0-9a-f]+ <[^>]*> f200 9260 	lb	v0,512\(gp\)
[0-9a-f]+ <[^>]*> f400 9260 	lb	v0,1024\(gp\)
[0-9a-f]+ <[^>]*> f001 9260 	lb	v0,2048\(gp\)
[0-9a-f]+ <[^>]*> f002 9260 	lb	v0,4096\(gp\)
[0-9a-f]+ <[^>]*> f004 9260 	lb	v0,8192\(gp\)
[0-9a-f]+ <[^>]*> f008 9260 	lb	v0,16384\(gp\)
[0-9a-f]+ <[^>]*> f7ef 927f 	lb	v0,32767\(gp\)
[0-9a-f]+ <[^>]*> f7ff 927f 	lb	v0,-1\(gp\)
[0-9a-f]+ <[^>]*> f7ff 927e 	lb	v0,-2\(gp\)
[0-9a-f]+ <[^>]*> f7ff 927d 	lb	v0,-3\(gp\)
[0-9a-f]+ <[^>]*> f7ff 927c 	lb	v0,-4\(gp\)
[0-9a-f]+ <[^>]*> f7ff 9278 	lb	v0,-8\(gp\)
[0-9a-f]+ <[^>]*> f7ff 9270 	lb	v0,-16\(gp\)
[0-9a-f]+ <[^>]*> f7ff 9260 	lb	v0,-32\(gp\)
[0-9a-f]+ <[^>]*> f7df 9260 	lb	v0,-64\(gp\)
[0-9a-f]+ <[^>]*> f79f 9260 	lb	v0,-128\(gp\)
[0-9a-f]+ <[^>]*> f71f 9260 	lb	v0,-256\(gp\)
[0-9a-f]+ <[^>]*> f61f 9260 	lb	v0,-512\(gp\)
[0-9a-f]+ <[^>]*> f41f 9260 	lb	v0,-1024\(gp\)
[0-9a-f]+ <[^>]*> f01f 9260 	lb	v0,-2048\(gp\)
[0-9a-f]+ <[^>]*> f01e 9260 	lb	v0,-4096\(gp\)
[0-9a-f]+ <[^>]*> f01c 9260 	lb	v0,-8192\(gp\)
[0-9a-f]+ <[^>]*> f018 9260 	lb	v0,-16384\(gp\)
[0-9a-f]+ <[^>]*> f010 9260 	lb	v0,-32768\(gp\)
[0-9a-f]+ <[^>]*> f000 92a0 	lbu	v0,0\(gp\)
[0-9a-f]+ <[^>]*> f000 92a1 	lbu	v0,1\(gp\)
[0-9a-f]+ <[^>]*> f000 92a2 	lbu	v0,2\(gp\)
[0-9a-f]+ <[^>]*> f000 92a3 	lbu	v0,3\(gp\)
[0-9a-f]+ <[^>]*> f000 92a4 	lbu	v0,4\(gp\)
[0-9a-f]+ <[^>]*> f000 92a8 	lbu	v0,8\(gp\)
[0-9a-f]+ <[^>]*> f000 92b0 	lbu	v0,16\(gp\)
[0-9a-f]+ <[^>]*> f020 92a0 	lbu	v0,32\(gp\)
[0-9a-f]+ <[^>]*> f040 92a0 	lbu	v0,64\(gp\)
[0-9a-f]+ <[^>]*> f080 92a0 	lbu	v0,128\(gp\)
[0-9a-f]+ <[^>]*> f0e0 92bf 	lbu	v0,255\(gp\)
[0-9a-f]+ <[^>]*> f100 92a0 	lbu	v0,256\(gp\)
[0-9a-f]+ <[^>]*> f200 92a0 	lbu	v0,512\(gp\)
[0-9a-f]+ <[^>]*> f400 92a0 	lbu	v0,1024\(gp\)
[0-9a-f]+ <[^>]*> f001 92a0 	lbu	v0,2048\(gp\)
[0-9a-f]+ <[^>]*> f002 92a0 	lbu	v0,4096\(gp\)
[0-9a-f]+ <[^>]*> f004 92a0 	lbu	v0,8192\(gp\)
[0-9a-f]+ <[^>]*> f008 92a0 	lbu	v0,16384\(gp\)
[0-9a-f]+ <[^>]*> f7ef 92bf 	lbu	v0,32767\(gp\)
[0-9a-f]+ <[^>]*> f7ff 92bf 	lbu	v0,-1\(gp\)
[0-9a-f]+ <[^>]*> f7ff 92be 	lbu	v0,-2\(gp\)
[0-9a-f]+ <[^>]*> f7ff 92bd 	lbu	v0,-3\(gp\)
[0-9a-f]+ <[^>]*> f7ff 92bc 	lbu	v0,-4\(gp\)
[0-9a-f]+ <[^>]*> f7ff 92b8 	lbu	v0,-8\(gp\)
[0-9a-f]+ <[^>]*> f7ff 92b0 	lbu	v0,-16\(gp\)
[0-9a-f]+ <[^>]*> f7ff 92a0 	lbu	v0,-32\(gp\)
[0-9a-f]+ <[^>]*> f7df 92a0 	lbu	v0,-64\(gp\)
[0-9a-f]+ <[^>]*> f79f 92a0 	lbu	v0,-128\(gp\)
[0-9a-f]+ <[^>]*> f71f 92a0 	lbu	v0,-256\(gp\)
[0-9a-f]+ <[^>]*> f61f 92a0 	lbu	v0,-512\(gp\)
[0-9a-f]+ <[^>]*> f41f 92a0 	lbu	v0,-1024\(gp\)
[0-9a-f]+ <[^>]*> f01f 92a0 	lbu	v0,-2048\(gp\)
[0-9a-f]+ <[^>]*> f01e 92a0 	lbu	v0,-4096\(gp\)
[0-9a-f]+ <[^>]*> f01c 92a0 	lbu	v0,-8192\(gp\)
[0-9a-f]+ <[^>]*> f018 92a0 	lbu	v0,-16384\(gp\)
[0-9a-f]+ <[^>]*> f010 92a0 	lbu	v0,-32768\(gp\)
[0-9a-f]+ <[^>]*> f000 d220 	sw	v0,0\(gp\)
[0-9a-f]+ <[^>]*> f000 d221 	sw	v0,1\(gp\)
[0-9a-f]+ <[^>]*> f000 d222 	sw	v0,2\(gp\)
[0-9a-f]+ <[^>]*> f000 d223 	sw	v0,3\(gp\)
[0-9a-f]+ <[^>]*> f000 d224 	sw	v0,4\(gp\)
[0-9a-f]+ <[^>]*> f000 d228 	sw	v0,8\(gp\)
[0-9a-f]+ <[^>]*> f000 d230 	sw	v0,16\(gp\)
[0-9a-f]+ <[^>]*> f020 d220 	sw	v0,32\(gp\)
[0-9a-f]+ <[^>]*> f040 d220 	sw	v0,64\(gp\)
[0-9a-f]+ <[^>]*> f080 d220 	sw	v0,128\(gp\)
[0-9a-f]+ <[^>]*> f0e0 d23f 	sw	v0,255\(gp\)
[0-9a-f]+ <[^>]*> f100 d220 	sw	v0,256\(gp\)
[0-9a-f]+ <[^>]*> f200 d220 	sw	v0,512\(gp\)
[0-9a-f]+ <[^>]*> f400 d220 	sw	v0,1024\(gp\)
[0-9a-f]+ <[^>]*> f001 d220 	sw	v0,2048\(gp\)
[0-9a-f]+ <[^>]*> f002 d220 	sw	v0,4096\(gp\)
[0-9a-f]+ <[^>]*> f004 d220 	sw	v0,8192\(gp\)
[0-9a-f]+ <[^>]*> f008 d220 	sw	v0,16384\(gp\)
[0-9a-f]+ <[^>]*> f7ef d23f 	sw	v0,32767\(gp\)
[0-9a-f]+ <[^>]*> f7ff d23f 	sw	v0,-1\(gp\)
[0-9a-f]+ <[^>]*> f7ff d23e 	sw	v0,-2\(gp\)
[0-9a-f]+ <[^>]*> f7ff d23d 	sw	v0,-3\(gp\)
[0-9a-f]+ <[^>]*> f7ff d23c 	sw	v0,-4\(gp\)
[0-9a-f]+ <[^>]*> f7ff d238 	sw	v0,-8\(gp\)
[0-9a-f]+ <[^>]*> f7ff d230 	sw	v0,-16\(gp\)
[0-9a-f]+ <[^>]*> f7ff d220 	sw	v0,-32\(gp\)
[0-9a-f]+ <[^>]*> f7df d220 	sw	v0,-64\(gp\)
[0-9a-f]+ <[^>]*> f79f d220 	sw	v0,-128\(gp\)
[0-9a-f]+ <[^>]*> f71f d220 	sw	v0,-256\(gp\)
[0-9a-f]+ <[^>]*> f61f d220 	sw	v0,-512\(gp\)
[0-9a-f]+ <[^>]*> f41f d220 	sw	v0,-1024\(gp\)
[0-9a-f]+ <[^>]*> f01f d220 	sw	v0,-2048\(gp\)
[0-9a-f]+ <[^>]*> f01e d220 	sw	v0,-4096\(gp\)
[0-9a-f]+ <[^>]*> f01c d220 	sw	v0,-8192\(gp\)
[0-9a-f]+ <[^>]*> f018 d220 	sw	v0,-16384\(gp\)
[0-9a-f]+ <[^>]*> f010 d220 	sw	v0,-32768\(gp\)
[0-9a-f]+ <[^>]*> f000 d240 	sh	v0,0\(gp\)
[0-9a-f]+ <[^>]*> f000 d241 	sh	v0,1\(gp\)
[0-9a-f]+ <[^>]*> f000 d242 	sh	v0,2\(gp\)
[0-9a-f]+ <[^>]*> f000 d243 	sh	v0,3\(gp\)
[0-9a-f]+ <[^>]*> f000 d244 	sh	v0,4\(gp\)
[0-9a-f]+ <[^>]*> f000 d248 	sh	v0,8\(gp\)
[0-9a-f]+ <[^>]*> f000 d250 	sh	v0,16\(gp\)
[0-9a-f]+ <[^>]*> f020 d240 	sh	v0,32\(gp\)
[0-9a-f]+ <[^>]*> f040 d240 	sh	v0,64\(gp\)
[0-9a-f]+ <[^>]*> f080 d240 	sh	v0,128\(gp\)
[0-9a-f]+ <[^>]*> f0e0 d25f 	sh	v0,255\(gp\)
[0-9a-f]+ <[^>]*> f100 d240 	sh	v0,256\(gp\)
[0-9a-f]+ <[^>]*> f200 d240 	sh	v0,512\(gp\)
[0-9a-f]+ <[^>]*> f400 d240 	sh	v0,1024\(gp\)
[0-9a-f]+ <[^>]*> f001 d240 	sh	v0,2048\(gp\)
[0-9a-f]+ <[^>]*> f002 d240 	sh	v0,4096\(gp\)
[0-9a-f]+ <[^>]*> f004 d240 	sh	v0,8192\(gp\)
[0-9a-f]+ <[^>]*> f008 d240 	sh	v0,16384\(gp\)
[0-9a-f]+ <[^>]*> f7ef d25f 	sh	v0,32767\(gp\)
[0-9a-f]+ <[^>]*> f7ff d25f 	sh	v0,-1\(gp\)
[0-9a-f]+ <[^>]*> f7ff d25e 	sh	v0,-2\(gp\)
[0-9a-f]+ <[^>]*> f7ff d25d 	sh	v0,-3\(gp\)
[0-9a-f]+ <[^>]*> f7ff d25c 	sh	v0,-4\(gp\)
[0-9a-f]+ <[^>]*> f7ff d258 	sh	v0,-8\(gp\)
[0-9a-f]+ <[^>]*> f7ff d250 	sh	v0,-16\(gp\)
[0-9a-f]+ <[^>]*> f7ff d240 	sh	v0,-32\(gp\)
[0-9a-f]+ <[^>]*> f7df d240 	sh	v0,-64\(gp\)
[0-9a-f]+ <[^>]*> f79f d240 	sh	v0,-128\(gp\)
[0-9a-f]+ <[^>]*> f71f d240 	sh	v0,-256\(gp\)
[0-9a-f]+ <[^>]*> f61f d240 	sh	v0,-512\(gp\)
[0-9a-f]+ <[^>]*> f41f d240 	sh	v0,-1024\(gp\)
[0-9a-f]+ <[^>]*> f01f d240 	sh	v0,-2048\(gp\)
[0-9a-f]+ <[^>]*> f01e d240 	sh	v0,-4096\(gp\)
[0-9a-f]+ <[^>]*> f01c d240 	sh	v0,-8192\(gp\)
[0-9a-f]+ <[^>]*> f018 d240 	sh	v0,-16384\(gp\)
[0-9a-f]+ <[^>]*> f010 d240 	sh	v0,-32768\(gp\)
[0-9a-f]+ <[^>]*> f000 d260 	sb	v0,0\(gp\)
[0-9a-f]+ <[^>]*> f000 d261 	sb	v0,1\(gp\)
[0-9a-f]+ <[^>]*> f000 d262 	sb	v0,2\(gp\)
[0-9a-f]+ <[^>]*> f000 d263 	sb	v0,3\(gp\)
[0-9a-f]+ <[^>]*> f000 d264 	sb	v0,4\(gp\)
[0-9a-f]+ <[^>]*> f000 d268 	sb	v0,8\(gp\)
[0-9a-f]+ <[^>]*> f000 d270 	sb	v0,16\(gp\)
[0-9a-f]+ <[^>]*> f020 d260 	sb	v0,32\(gp\)
[0-9a-f]+ <[^>]*> f040 d260 	sb	v0,64\(gp\)
[0-9a-f]+ <[^>]*> f080 d260 	sb	v0,128\(gp\)
[0-9a-f]+ <[^>]*> f0e0 d27f 	sb	v0,255\(gp\)
[0-9a-f]+ <[^>]*> f100 d260 	sb	v0,256\(gp\)
[0-9a-f]+ <[^>]*> f200 d260 	sb	v0,512\(gp\)
[0-9a-f]+ <[^>]*> f400 d260 	sb	v0,1024\(gp\)
[0-9a-f]+ <[^>]*> f001 d260 	sb	v0,2048\(gp\)
[0-9a-f]+ <[^>]*> f002 d260 	sb	v0,4096\(gp\)
[0-9a-f]+ <[^>]*> f004 d260 	sb	v0,8192\(gp\)
[0-9a-f]+ <[^>]*> f008 d260 	sb	v0,16384\(gp\)
[0-9a-f]+ <[^>]*> f7ef d27f 	sb	v0,32767\(gp\)
[0-9a-f]+ <[^>]*> f7ff d27f 	sb	v0,-1\(gp\)
[0-9a-f]+ <[^>]*> f7ff d27e 	sb	v0,-2\(gp\)
[0-9a-f]+ <[^>]*> f7ff d27d 	sb	v0,-3\(gp\)
[0-9a-f]+ <[^>]*> f7ff d27c 	sb	v0,-4\(gp\)
[0-9a-f]+ <[^>]*> f7ff d278 	sb	v0,-8\(gp\)
[0-9a-f]+ <[^>]*> f7ff d270 	sb	v0,-16\(gp\)
[0-9a-f]+ <[^>]*> f7ff d260 	sb	v0,-32\(gp\)
[0-9a-f]+ <[^>]*> f7df d260 	sb	v0,-64\(gp\)
[0-9a-f]+ <[^>]*> f79f d260 	sb	v0,-128\(gp\)
[0-9a-f]+ <[^>]*> f71f d260 	sb	v0,-256\(gp\)
[0-9a-f]+ <[^>]*> f61f d260 	sb	v0,-512\(gp\)
[0-9a-f]+ <[^>]*> f41f d260 	sb	v0,-1024\(gp\)
[0-9a-f]+ <[^>]*> f01f d260 	sb	v0,-2048\(gp\)
[0-9a-f]+ <[^>]*> f01e d260 	sb	v0,-4096\(gp\)
[0-9a-f]+ <[^>]*> f01c d260 	sb	v0,-8192\(gp\)
[0-9a-f]+ <[^>]*> f018 d260 	sb	v0,-16384\(gp\)
[0-9a-f]+ <[^>]*> f010 d260 	sb	v0,-32768\(gp\)
[0-9a-f]+ <[^>]*> f003 92c0 	ll	v0,0\(v1\)
[0-9a-f]+ <[^>]*> f003 92c1 	ll	v0,1\(v1\)
[0-9a-f]+ <[^>]*> f003 92c2 	ll	v0,2\(v1\)
[0-9a-f]+ <[^>]*> f003 92c3 	ll	v0,3\(v1\)
[0-9a-f]+ <[^>]*> f003 92c4 	ll	v0,4\(v1\)
[0-9a-f]+ <[^>]*> f003 92c8 	ll	v0,8\(v1\)
[0-9a-f]+ <[^>]*> f003 92d0 	ll	v0,16\(v1\)
[0-9a-f]+ <[^>]*> f023 92c0 	ll	v0,32\(v1\)
[0-9a-f]+ <[^>]*> f043 92c0 	ll	v0,64\(v1\)
[0-9a-f]+ <[^>]*> f083 92c0 	ll	v0,128\(v1\)
[0-9a-f]+ <[^>]*> f0e3 92df 	ll	v0,255\(v1\)
[0-9a-f]+ <[^>]*> f1e3 92df 	ll	v0,-1\(v1\)
[0-9a-f]+ <[^>]*> f1e3 92de 	ll	v0,-2\(v1\)
[0-9a-f]+ <[^>]*> f1e3 92dd 	ll	v0,-3\(v1\)
[0-9a-f]+ <[^>]*> f1e3 92dc 	ll	v0,-4\(v1\)
[0-9a-f]+ <[^>]*> f1e3 92d8 	ll	v0,-8\(v1\)
[0-9a-f]+ <[^>]*> f1e3 92d0 	ll	v0,-16\(v1\)
[0-9a-f]+ <[^>]*> f1e3 92c0 	ll	v0,-32\(v1\)
[0-9a-f]+ <[^>]*> f1c3 92c0 	ll	v0,-64\(v1\)
[0-9a-f]+ <[^>]*> f183 92c0 	ll	v0,-128\(v1\)
[0-9a-f]+ <[^>]*> f103 92c0 	ll	v0,-256\(v1\)
[0-9a-f]+ <[^>]*> f003 92e0 	lwl	v0,0\(v1\)
[0-9a-f]+ <[^>]*> f003 92e1 	lwl	v0,1\(v1\)
[0-9a-f]+ <[^>]*> f003 92e2 	lwl	v0,2\(v1\)
[0-9a-f]+ <[^>]*> f003 92e3 	lwl	v0,3\(v1\)
[0-9a-f]+ <[^>]*> f003 92e4 	lwl	v0,4\(v1\)
[0-9a-f]+ <[^>]*> f003 92e8 	lwl	v0,8\(v1\)
[0-9a-f]+ <[^>]*> f003 92f0 	lwl	v0,16\(v1\)
[0-9a-f]+ <[^>]*> f023 92e0 	lwl	v0,32\(v1\)
[0-9a-f]+ <[^>]*> f043 92e0 	lwl	v0,64\(v1\)
[0-9a-f]+ <[^>]*> f083 92e0 	lwl	v0,128\(v1\)
[0-9a-f]+ <[^>]*> f0e3 92ff 	lwl	v0,255\(v1\)
[0-9a-f]+ <[^>]*> f1e3 92ff 	lwl	v0,-1\(v1\)
[0-9a-f]+ <[^>]*> f1e3 92fe 	lwl	v0,-2\(v1\)
[0-9a-f]+ <[^>]*> f1e3 92fd 	lwl	v0,-3\(v1\)
[0-9a-f]+ <[^>]*> f1e3 92fc 	lwl	v0,-4\(v1\)
[0-9a-f]+ <[^>]*> f1e3 92f8 	lwl	v0,-8\(v1\)
[0-9a-f]+ <[^>]*> f1e3 92f0 	lwl	v0,-16\(v1\)
[0-9a-f]+ <[^>]*> f1e3 92e0 	lwl	v0,-32\(v1\)
[0-9a-f]+ <[^>]*> f1c3 92e0 	lwl	v0,-64\(v1\)
[0-9a-f]+ <[^>]*> f183 92e0 	lwl	v0,-128\(v1\)
[0-9a-f]+ <[^>]*> f103 92e0 	lwl	v0,-256\(v1\)
[0-9a-f]+ <[^>]*> f013 92e0 	lwr	v0,0\(v1\)
[0-9a-f]+ <[^>]*> f013 92e1 	lwr	v0,1\(v1\)
[0-9a-f]+ <[^>]*> f013 92e2 	lwr	v0,2\(v1\)
[0-9a-f]+ <[^>]*> f013 92e3 	lwr	v0,3\(v1\)
[0-9a-f]+ <[^>]*> f013 92e4 	lwr	v0,4\(v1\)
[0-9a-f]+ <[^>]*> f013 92e8 	lwr	v0,8\(v1\)
[0-9a-f]+ <[^>]*> f013 92f0 	lwr	v0,16\(v1\)
[0-9a-f]+ <[^>]*> f033 92e0 	lwr	v0,32\(v1\)
[0-9a-f]+ <[^>]*> f053 92e0 	lwr	v0,64\(v1\)
[0-9a-f]+ <[^>]*> f093 92e0 	lwr	v0,128\(v1\)
[0-9a-f]+ <[^>]*> f0f3 92ff 	lwr	v0,255\(v1\)
[0-9a-f]+ <[^>]*> f1f3 92ff 	lwr	v0,-1\(v1\)
[0-9a-f]+ <[^>]*> f1f3 92fe 	lwr	v0,-2\(v1\)
[0-9a-f]+ <[^>]*> f1f3 92fd 	lwr	v0,-3\(v1\)
[0-9a-f]+ <[^>]*> f1f3 92fc 	lwr	v0,-4\(v1\)
[0-9a-f]+ <[^>]*> f1f3 92f8 	lwr	v0,-8\(v1\)
[0-9a-f]+ <[^>]*> f1f3 92f0 	lwr	v0,-16\(v1\)
[0-9a-f]+ <[^>]*> f1f3 92e0 	lwr	v0,-32\(v1\)
[0-9a-f]+ <[^>]*> f1d3 92e0 	lwr	v0,-64\(v1\)
[0-9a-f]+ <[^>]*> f193 92e0 	lwr	v0,-128\(v1\)
[0-9a-f]+ <[^>]*> f113 92e0 	lwr	v0,-256\(v1\)
[0-9a-f]+ <[^>]*> f003 d2c0 	sc	v0,0\(v1\)
[0-9a-f]+ <[^>]*> f003 d2c1 	sc	v0,1\(v1\)
[0-9a-f]+ <[^>]*> f003 d2c2 	sc	v0,2\(v1\)
[0-9a-f]+ <[^>]*> f003 d2c3 	sc	v0,3\(v1\)
[0-9a-f]+ <[^>]*> f003 d2c4 	sc	v0,4\(v1\)
[0-9a-f]+ <[^>]*> f003 d2c8 	sc	v0,8\(v1\)
[0-9a-f]+ <[^>]*> f003 d2d0 	sc	v0,16\(v1\)
[0-9a-f]+ <[^>]*> f023 d2c0 	sc	v0,32\(v1\)
[0-9a-f]+ <[^>]*> f043 d2c0 	sc	v0,64\(v1\)
[0-9a-f]+ <[^>]*> f083 d2c0 	sc	v0,128\(v1\)
[0-9a-f]+ <[^>]*> f0e3 d2df 	sc	v0,255\(v1\)
[0-9a-f]+ <[^>]*> f1e3 d2df 	sc	v0,-1\(v1\)
[0-9a-f]+ <[^>]*> f1e3 d2de 	sc	v0,-2\(v1\)
[0-9a-f]+ <[^>]*> f1e3 d2dd 	sc	v0,-3\(v1\)
[0-9a-f]+ <[^>]*> f1e3 d2dc 	sc	v0,-4\(v1\)
[0-9a-f]+ <[^>]*> f1e3 d2d8 	sc	v0,-8\(v1\)
[0-9a-f]+ <[^>]*> f1e3 d2d0 	sc	v0,-16\(v1\)
[0-9a-f]+ <[^>]*> f1e3 d2c0 	sc	v0,-32\(v1\)
[0-9a-f]+ <[^>]*> f1c3 d2c0 	sc	v0,-64\(v1\)
[0-9a-f]+ <[^>]*> f183 d2c0 	sc	v0,-128\(v1\)
[0-9a-f]+ <[^>]*> f103 d2c0 	sc	v0,-256\(v1\)
[0-9a-f]+ <[^>]*> f003 d2e0 	swl	v0,0\(v1\)
[0-9a-f]+ <[^>]*> f003 d2e1 	swl	v0,1\(v1\)
[0-9a-f]+ <[^>]*> f003 d2e2 	swl	v0,2\(v1\)
[0-9a-f]+ <[^>]*> f003 d2e3 	swl	v0,3\(v1\)
[0-9a-f]+ <[^>]*> f003 d2e4 	swl	v0,4\(v1\)
[0-9a-f]+ <[^>]*> f003 d2e8 	swl	v0,8\(v1\)
[0-9a-f]+ <[^>]*> f003 d2f0 	swl	v0,16\(v1\)
[0-9a-f]+ <[^>]*> f023 d2e0 	swl	v0,32\(v1\)
[0-9a-f]+ <[^>]*> f043 d2e0 	swl	v0,64\(v1\)
[0-9a-f]+ <[^>]*> f083 d2e0 	swl	v0,128\(v1\)
[0-9a-f]+ <[^>]*> f0e3 d2ff 	swl	v0,255\(v1\)
[0-9a-f]+ <[^>]*> f1e3 d2ff 	swl	v0,-1\(v1\)
[0-9a-f]+ <[^>]*> f1e3 d2fe 	swl	v0,-2\(v1\)
[0-9a-f]+ <[^>]*> f1e3 d2fd 	swl	v0,-3\(v1\)
[0-9a-f]+ <[^>]*> f1e3 d2fc 	swl	v0,-4\(v1\)
[0-9a-f]+ <[^>]*> f1e3 d2f8 	swl	v0,-8\(v1\)
[0-9a-f]+ <[^>]*> f1e3 d2f0 	swl	v0,-16\(v1\)
[0-9a-f]+ <[^>]*> f1e3 d2e0 	swl	v0,-32\(v1\)
[0-9a-f]+ <[^>]*> f1c3 d2e0 	swl	v0,-64\(v1\)
[0-9a-f]+ <[^>]*> f183 d2e0 	swl	v0,-128\(v1\)
[0-9a-f]+ <[^>]*> f103 d2e0 	swl	v0,-256\(v1\)
[0-9a-f]+ <[^>]*> f013 d2e0 	swr	v0,0\(v1\)
[0-9a-f]+ <[^>]*> f013 d2e1 	swr	v0,1\(v1\)
[0-9a-f]+ <[^>]*> f013 d2e2 	swr	v0,2\(v1\)
[0-9a-f]+ <[^>]*> f013 d2e3 	swr	v0,3\(v1\)
[0-9a-f]+ <[^>]*> f013 d2e4 	swr	v0,4\(v1\)
[0-9a-f]+ <[^>]*> f013 d2e8 	swr	v0,8\(v1\)
[0-9a-f]+ <[^>]*> f013 d2f0 	swr	v0,16\(v1\)
[0-9a-f]+ <[^>]*> f033 d2e0 	swr	v0,32\(v1\)
[0-9a-f]+ <[^>]*> f053 d2e0 	swr	v0,64\(v1\)
[0-9a-f]+ <[^>]*> f093 d2e0 	swr	v0,128\(v1\)
[0-9a-f]+ <[^>]*> f0f3 d2ff 	swr	v0,255\(v1\)
[0-9a-f]+ <[^>]*> f1f3 d2ff 	swr	v0,-1\(v1\)
[0-9a-f]+ <[^>]*> f1f3 d2fe 	swr	v0,-2\(v1\)
[0-9a-f]+ <[^>]*> f1f3 d2fd 	swr	v0,-3\(v1\)
[0-9a-f]+ <[^>]*> f1f3 d2fc 	swr	v0,-4\(v1\)
[0-9a-f]+ <[^>]*> f1f3 d2f8 	swr	v0,-8\(v1\)
[0-9a-f]+ <[^>]*> f1f3 d2f0 	swr	v0,-16\(v1\)
[0-9a-f]+ <[^>]*> f1f3 d2e0 	swr	v0,-32\(v1\)
[0-9a-f]+ <[^>]*> f1d3 d2e0 	swr	v0,-64\(v1\)
[0-9a-f]+ <[^>]*> f193 d2e0 	swr	v0,-128\(v1\)
[0-9a-f]+ <[^>]*> f113 d2e0 	swr	v0,-256\(v1\)
[0-9a-f]+ <[^>]*> f002 d3a0 	cache	0x2,0\(v1\)
[0-9a-f]+ <[^>]*> f002 d3a1 	cache	0x2,1\(v1\)
[0-9a-f]+ <[^>]*> f002 d3a2 	cache	0x2,2\(v1\)
[0-9a-f]+ <[^>]*> f002 d3a3 	cache	0x2,3\(v1\)
[0-9a-f]+ <[^>]*> f002 d3a4 	cache	0x2,4\(v1\)
[0-9a-f]+ <[^>]*> f002 d3a8 	cache	0x2,8\(v1\)
[0-9a-f]+ <[^>]*> f002 d3b0 	cache	0x2,16\(v1\)
[0-9a-f]+ <[^>]*> f022 d3a0 	cache	0x2,32\(v1\)
[0-9a-f]+ <[^>]*> f042 d3a0 	cache	0x2,64\(v1\)
[0-9a-f]+ <[^>]*> f082 d3a0 	cache	0x2,128\(v1\)
[0-9a-f]+ <[^>]*> f0e2 d3bf 	cache	0x2,255\(v1\)
[0-9a-f]+ <[^>]*> f1e2 d3bf 	cache	0x2,-1\(v1\)
[0-9a-f]+ <[^>]*> f1e2 d3be 	cache	0x2,-2\(v1\)
[0-9a-f]+ <[^>]*> f1e2 d3bd 	cache	0x2,-3\(v1\)
[0-9a-f]+ <[^>]*> f1e2 d3bc 	cache	0x2,-4\(v1\)
[0-9a-f]+ <[^>]*> f1e2 d3b8 	cache	0x2,-8\(v1\)
[0-9a-f]+ <[^>]*> f1e2 d3b0 	cache	0x2,-16\(v1\)
[0-9a-f]+ <[^>]*> f1e2 d3a0 	cache	0x2,-32\(v1\)
[0-9a-f]+ <[^>]*> f1c2 d3a0 	cache	0x2,-64\(v1\)
[0-9a-f]+ <[^>]*> f182 d3a0 	cache	0x2,-128\(v1\)
[0-9a-f]+ <[^>]*> f102 d3a0 	cache	0x2,-256\(v1\)
[0-9a-f]+ <[^>]*> f01d d3a0 	cache	0x1d,0\(v1\)
[0-9a-f]+ <[^>]*> f01d d3a1 	cache	0x1d,1\(v1\)
[0-9a-f]+ <[^>]*> f01d d3a2 	cache	0x1d,2\(v1\)
[0-9a-f]+ <[^>]*> f01d d3a3 	cache	0x1d,3\(v1\)
[0-9a-f]+ <[^>]*> f01d d3a4 	cache	0x1d,4\(v1\)
[0-9a-f]+ <[^>]*> f01d d3a8 	cache	0x1d,8\(v1\)
[0-9a-f]+ <[^>]*> f01d d3b0 	cache	0x1d,16\(v1\)
[0-9a-f]+ <[^>]*> f03d d3a0 	cache	0x1d,32\(v1\)
[0-9a-f]+ <[^>]*> f05d d3a0 	cache	0x1d,64\(v1\)
[0-9a-f]+ <[^>]*> f09d d3a0 	cache	0x1d,128\(v1\)
[0-9a-f]+ <[^>]*> f0fd d3bf 	cache	0x1d,255\(v1\)
[0-9a-f]+ <[^>]*> f1fd d3bf 	cache	0x1d,-1\(v1\)
[0-9a-f]+ <[^>]*> f1fd d3be 	cache	0x1d,-2\(v1\)
[0-9a-f]+ <[^>]*> f1fd d3bd 	cache	0x1d,-3\(v1\)
[0-9a-f]+ <[^>]*> f1fd d3bc 	cache	0x1d,-4\(v1\)
[0-9a-f]+ <[^>]*> f1fd d3b8 	cache	0x1d,-8\(v1\)
[0-9a-f]+ <[^>]*> f1fd d3b0 	cache	0x1d,-16\(v1\)
[0-9a-f]+ <[^>]*> f1fd d3a0 	cache	0x1d,-32\(v1\)
[0-9a-f]+ <[^>]*> f1dd d3a0 	cache	0x1d,-64\(v1\)
[0-9a-f]+ <[^>]*> f19d d3a0 	cache	0x1d,-128\(v1\)
[0-9a-f]+ <[^>]*> f11d d3a0 	cache	0x1d,-256\(v1\)
[0-9a-f]+ <[^>]*> f008 d380 	pref	0x8,0\(v1\)
[0-9a-f]+ <[^>]*> f008 d381 	pref	0x8,1\(v1\)
[0-9a-f]+ <[^>]*> f008 d382 	pref	0x8,2\(v1\)
[0-9a-f]+ <[^>]*> f008 d383 	pref	0x8,3\(v1\)
[0-9a-f]+ <[^>]*> f008 d384 	pref	0x8,4\(v1\)
[0-9a-f]+ <[^>]*> f008 d388 	pref	0x8,8\(v1\)
[0-9a-f]+ <[^>]*> f008 d390 	pref	0x8,16\(v1\)
[0-9a-f]+ <[^>]*> f028 d380 	pref	0x8,32\(v1\)
[0-9a-f]+ <[^>]*> f048 d380 	pref	0x8,64\(v1\)
[0-9a-f]+ <[^>]*> f088 d380 	pref	0x8,128\(v1\)
[0-9a-f]+ <[^>]*> f0e8 d39f 	pref	0x8,255\(v1\)
[0-9a-f]+ <[^>]*> f1e8 d39f 	pref	0x8,-1\(v1\)
[0-9a-f]+ <[^>]*> f1e8 d39e 	pref	0x8,-2\(v1\)
[0-9a-f]+ <[^>]*> f1e8 d39d 	pref	0x8,-3\(v1\)
[0-9a-f]+ <[^>]*> f1e8 d39c 	pref	0x8,-4\(v1\)
[0-9a-f]+ <[^>]*> f1e8 d398 	pref	0x8,-8\(v1\)
[0-9a-f]+ <[^>]*> f1e8 d390 	pref	0x8,-16\(v1\)
[0-9a-f]+ <[^>]*> f1e8 d380 	pref	0x8,-32\(v1\)
[0-9a-f]+ <[^>]*> f1c8 d380 	pref	0x8,-64\(v1\)
[0-9a-f]+ <[^>]*> f188 d380 	pref	0x8,-128\(v1\)
[0-9a-f]+ <[^>]*> f108 d380 	pref	0x8,-256\(v1\)
[0-9a-f]+ <[^>]*> f017 d380 	pref	0x17,0\(v1\)
[0-9a-f]+ <[^>]*> f017 d381 	pref	0x17,1\(v1\)
[0-9a-f]+ <[^>]*> f017 d382 	pref	0x17,2\(v1\)
[0-9a-f]+ <[^>]*> f017 d383 	pref	0x17,3\(v1\)
[0-9a-f]+ <[^>]*> f017 d384 	pref	0x17,4\(v1\)
[0-9a-f]+ <[^>]*> f017 d388 	pref	0x17,8\(v1\)
[0-9a-f]+ <[^>]*> f017 d390 	pref	0x17,16\(v1\)
[0-9a-f]+ <[^>]*> f037 d380 	pref	0x17,32\(v1\)
[0-9a-f]+ <[^>]*> f057 d380 	pref	0x17,64\(v1\)
[0-9a-f]+ <[^>]*> f097 d380 	pref	0x17,128\(v1\)
[0-9a-f]+ <[^>]*> f0f7 d39f 	pref	0x17,255\(v1\)
[0-9a-f]+ <[^>]*> f1f7 d39f 	pref	0x17,-1\(v1\)
[0-9a-f]+ <[^>]*> f1f7 d39e 	pref	0x17,-2\(v1\)
[0-9a-f]+ <[^>]*> f1f7 d39d 	pref	0x17,-3\(v1\)
[0-9a-f]+ <[^>]*> f1f7 d39c 	pref	0x17,-4\(v1\)
[0-9a-f]+ <[^>]*> f1f7 d398 	pref	0x17,-8\(v1\)
[0-9a-f]+ <[^>]*> f1f7 d390 	pref	0x17,-16\(v1\)
[0-9a-f]+ <[^>]*> f1f7 d380 	pref	0x17,-32\(v1\)
[0-9a-f]+ <[^>]*> f1d7 d380 	pref	0x17,-64\(v1\)
[0-9a-f]+ <[^>]*> f197 d380 	pref	0x17,-128\(v1\)
[0-9a-f]+ <[^>]*> f117 d380 	pref	0x17,-256\(v1\)
[0-9a-f]+ <[^>]*> f000 0220 	addiu	v0,gp,0
[0-9a-f]+ <[^>]*> f000 0221 	addiu	v0,gp,1
[0-9a-f]+ <[^>]*> f000 0222 	addiu	v0,gp,2
[0-9a-f]+ <[^>]*> f000 0224 	addiu	v0,gp,4
[0-9a-f]+ <[^>]*> f000 0228 	addiu	v0,gp,8
[0-9a-f]+ <[^>]*> f000 0230 	addiu	v0,gp,16
[0-9a-f]+ <[^>]*> f020 0220 	addiu	v0,gp,32
[0-9a-f]+ <[^>]*> f040 0220 	addiu	v0,gp,64
[0-9a-f]+ <[^>]*> f080 0220 	addiu	v0,gp,128
[0-9a-f]+ <[^>]*> f100 0220 	addiu	v0,gp,256
[0-9a-f]+ <[^>]*> f200 0220 	addiu	v0,gp,512
[0-9a-f]+ <[^>]*> f400 0220 	addiu	v0,gp,1024
[0-9a-f]+ <[^>]*> f001 0220 	addiu	v0,gp,2048
[0-9a-f]+ <[^>]*> f002 0220 	addiu	v0,gp,4096
[0-9a-f]+ <[^>]*> f004 0220 	addiu	v0,gp,8192
[0-9a-f]+ <[^>]*> f008 0220 	addiu	v0,gp,16384
[0-9a-f]+ <[^>]*> f7ef 023f 	addiu	v0,gp,32767
[0-9a-f]+ <[^>]*> f7ff 023f 	addiu	v0,gp,-1
[0-9a-f]+ <[^>]*> f7ff 023e 	addiu	v0,gp,-2
[0-9a-f]+ <[^>]*> f7ff 023c 	addiu	v0,gp,-4
[0-9a-f]+ <[^>]*> f7ff 0238 	addiu	v0,gp,-8
[0-9a-f]+ <[^>]*> f7ff 0230 	addiu	v0,gp,-16
[0-9a-f]+ <[^>]*> f7ff 0220 	addiu	v0,gp,-32
[0-9a-f]+ <[^>]*> f7df 0220 	addiu	v0,gp,-64
[0-9a-f]+ <[^>]*> f79f 0220 	addiu	v0,gp,-128
[0-9a-f]+ <[^>]*> f71f 0220 	addiu	v0,gp,-256
[0-9a-f]+ <[^>]*> f61f 0220 	addiu	v0,gp,-512
[0-9a-f]+ <[^>]*> f41f 0220 	addiu	v0,gp,-1024
[0-9a-f]+ <[^>]*> f01f 0220 	addiu	v0,gp,-2048
[0-9a-f]+ <[^>]*> f01e 0220 	addiu	v0,gp,-4096
[0-9a-f]+ <[^>]*> f01c 0220 	addiu	v0,gp,-8192
[0-9a-f]+ <[^>]*> f018 0220 	addiu	v0,gp,-16384
[0-9a-f]+ <[^>]*> f010 0220 	addiu	v0,gp,-32768
[0-9a-f]+ <[^>]*> f000 0220 	addiu	v0,gp,0
[0-9a-f]+ <[^>]*> f000 0221 	addiu	v0,gp,1
[0-9a-f]+ <[^>]*> f000 0222 	addiu	v0,gp,2
[0-9a-f]+ <[^>]*> f000 0224 	addiu	v0,gp,4
[0-9a-f]+ <[^>]*> f000 0228 	addiu	v0,gp,8
[0-9a-f]+ <[^>]*> f000 0230 	addiu	v0,gp,16
[0-9a-f]+ <[^>]*> f020 0220 	addiu	v0,gp,32
[0-9a-f]+ <[^>]*> f040 0220 	addiu	v0,gp,64
[0-9a-f]+ <[^>]*> f080 0220 	addiu	v0,gp,128
[0-9a-f]+ <[^>]*> f100 0220 	addiu	v0,gp,256
[0-9a-f]+ <[^>]*> f200 0220 	addiu	v0,gp,512
[0-9a-f]+ <[^>]*> f400 0220 	addiu	v0,gp,1024
[0-9a-f]+ <[^>]*> f001 0220 	addiu	v0,gp,2048
[0-9a-f]+ <[^>]*> f002 0220 	addiu	v0,gp,4096
[0-9a-f]+ <[^>]*> f004 0220 	addiu	v0,gp,8192
[0-9a-f]+ <[^>]*> f008 0220 	addiu	v0,gp,16384
[0-9a-f]+ <[^>]*> f7ef 023f 	addiu	v0,gp,32767
[0-9a-f]+ <[^>]*> f7ff 023f 	addiu	v0,gp,-1
[0-9a-f]+ <[^>]*> f7ff 023e 	addiu	v0,gp,-2
[0-9a-f]+ <[^>]*> f7ff 023c 	addiu	v0,gp,-4
[0-9a-f]+ <[^>]*> f7ff 0238 	addiu	v0,gp,-8
[0-9a-f]+ <[^>]*> f7ff 0230 	addiu	v0,gp,-16
[0-9a-f]+ <[^>]*> f7ff 0220 	addiu	v0,gp,-32
[0-9a-f]+ <[^>]*> f7df 0220 	addiu	v0,gp,-64
[0-9a-f]+ <[^>]*> f79f 0220 	addiu	v0,gp,-128
[0-9a-f]+ <[^>]*> f71f 0220 	addiu	v0,gp,-256
[0-9a-f]+ <[^>]*> f61f 0220 	addiu	v0,gp,-512
[0-9a-f]+ <[^>]*> f41f 0220 	addiu	v0,gp,-1024
[0-9a-f]+ <[^>]*> f01f 0220 	addiu	v0,gp,-2048
[0-9a-f]+ <[^>]*> f01e 0220 	addiu	v0,gp,-4096
[0-9a-f]+ <[^>]*> f01c 0220 	addiu	v0,gp,-8192
[0-9a-f]+ <[^>]*> f018 0220 	addiu	v0,gp,-16384
[0-9a-f]+ <[^>]*> f010 0220 	addiu	v0,gp,-32768
[0-9a-f]+ <[^>]*> f000 6a20 	lui	v0,0x0
[0-9a-f]+ <[^>]*> f000 6a21 	lui	v0,0x1
[0-9a-f]+ <[^>]*> f000 6a22 	lui	v0,0x2
[0-9a-f]+ <[^>]*> f000 6a24 	lui	v0,0x4
[0-9a-f]+ <[^>]*> f000 6a28 	lui	v0,0x8
[0-9a-f]+ <[^>]*> f000 6a30 	lui	v0,0x10
[0-9a-f]+ <[^>]*> f020 6a20 	lui	v0,0x20
[0-9a-f]+ <[^>]*> f040 6a20 	lui	v0,0x40
[0-9a-f]+ <[^>]*> f080 6a20 	lui	v0,0x80
[0-9a-f]+ <[^>]*> f100 6a20 	lui	v0,0x100
[0-9a-f]+ <[^>]*> f200 6a20 	lui	v0,0x200
[0-9a-f]+ <[^>]*> f400 6a20 	lui	v0,0x400
[0-9a-f]+ <[^>]*> f001 6a20 	lui	v0,0x800
[0-9a-f]+ <[^>]*> f002 6a20 	lui	v0,0x1000
[0-9a-f]+ <[^>]*> f004 6a20 	lui	v0,0x2000
[0-9a-f]+ <[^>]*> f008 6a20 	lui	v0,0x4000
[0-9a-f]+ <[^>]*> f7ef 6a3f 	lui	v0,0x7fff
[0-9a-f]+ <[^>]*> f010 6a20 	lui	v0,0x8000
[0-9a-f]+ <[^>]*> f7ff 6a3f 	lui	v0,0xffff
[0-9a-f]+ <[^>]*> f000 6a60 	andi	v0,0x0
[0-9a-f]+ <[^>]*> f000 6a61 	andi	v0,0x1
[0-9a-f]+ <[^>]*> f000 6a62 	andi	v0,0x2
[0-9a-f]+ <[^>]*> f000 6a64 	andi	v0,0x4
[0-9a-f]+ <[^>]*> f000 6a68 	andi	v0,0x8
[0-9a-f]+ <[^>]*> f000 6a70 	andi	v0,0x10
[0-9a-f]+ <[^>]*> f020 6a60 	andi	v0,0x20
[0-9a-f]+ <[^>]*> f040 6a60 	andi	v0,0x40
[0-9a-f]+ <[^>]*> f080 6a60 	andi	v0,0x80
[0-9a-f]+ <[^>]*> f100 6a60 	andi	v0,0x100
[0-9a-f]+ <[^>]*> f200 6a60 	andi	v0,0x200
[0-9a-f]+ <[^>]*> f400 6a60 	andi	v0,0x400
[0-9a-f]+ <[^>]*> f001 6a60 	andi	v0,0x800
[0-9a-f]+ <[^>]*> f002 6a60 	andi	v0,0x1000
[0-9a-f]+ <[^>]*> f004 6a60 	andi	v0,0x2000
[0-9a-f]+ <[^>]*> f008 6a60 	andi	v0,0x4000
[0-9a-f]+ <[^>]*> f7ef 6a7f 	andi	v0,0x7fff
[0-9a-f]+ <[^>]*> f010 6a60 	andi	v0,0x8000
[0-9a-f]+ <[^>]*> f7ff 6a7f 	andi	v0,0xffff
[0-9a-f]+ <[^>]*> f000 6a40 	ori	v0,0x0
[0-9a-f]+ <[^>]*> f000 6a41 	ori	v0,0x1
[0-9a-f]+ <[^>]*> f000 6a42 	ori	v0,0x2
[0-9a-f]+ <[^>]*> f000 6a44 	ori	v0,0x4
[0-9a-f]+ <[^>]*> f000 6a48 	ori	v0,0x8
[0-9a-f]+ <[^>]*> f000 6a50 	ori	v0,0x10
[0-9a-f]+ <[^>]*> f020 6a40 	ori	v0,0x20
[0-9a-f]+ <[^>]*> f040 6a40 	ori	v0,0x40
[0-9a-f]+ <[^>]*> f080 6a40 	ori	v0,0x80
[0-9a-f]+ <[^>]*> f100 6a40 	ori	v0,0x100
[0-9a-f]+ <[^>]*> f200 6a40 	ori	v0,0x200
[0-9a-f]+ <[^>]*> f400 6a40 	ori	v0,0x400
[0-9a-f]+ <[^>]*> f001 6a40 	ori	v0,0x800
[0-9a-f]+ <[^>]*> f002 6a40 	ori	v0,0x1000
[0-9a-f]+ <[^>]*> f004 6a40 	ori	v0,0x2000
[0-9a-f]+ <[^>]*> f008 6a40 	ori	v0,0x4000
[0-9a-f]+ <[^>]*> f7ef 6a5f 	ori	v0,0x7fff
[0-9a-f]+ <[^>]*> f010 6a40 	ori	v0,0x8000
[0-9a-f]+ <[^>]*> f7ff 6a5f 	ori	v0,0xffff
[0-9a-f]+ <[^>]*> f000 6a80 	xori	v0,0x0
[0-9a-f]+ <[^>]*> f000 6a81 	xori	v0,0x1
[0-9a-f]+ <[^>]*> f000 6a82 	xori	v0,0x2
[0-9a-f]+ <[^>]*> f000 6a84 	xori	v0,0x4
[0-9a-f]+ <[^>]*> f000 6a88 	xori	v0,0x8
[0-9a-f]+ <[^>]*> f000 6a90 	xori	v0,0x10
[0-9a-f]+ <[^>]*> f020 6a80 	xori	v0,0x20
[0-9a-f]+ <[^>]*> f040 6a80 	xori	v0,0x40
[0-9a-f]+ <[^>]*> f080 6a80 	xori	v0,0x80
[0-9a-f]+ <[^>]*> f100 6a80 	xori	v0,0x100
[0-9a-f]+ <[^>]*> f200 6a80 	xori	v0,0x200
[0-9a-f]+ <[^>]*> f400 6a80 	xori	v0,0x400
[0-9a-f]+ <[^>]*> f001 6a80 	xori	v0,0x800
[0-9a-f]+ <[^>]*> f002 6a80 	xori	v0,0x1000
[0-9a-f]+ <[^>]*> f004 6a80 	xori	v0,0x2000
[0-9a-f]+ <[^>]*> f008 6a80 	xori	v0,0x4000
[0-9a-f]+ <[^>]*> f7ef 6a9f 	xori	v0,0x7fff
[0-9a-f]+ <[^>]*> f010 6a80 	xori	v0,0x8000
[0-9a-f]+ <[^>]*> f7ff 6a9f 	xori	v0,0xffff
[0-9a-f]+ <[^>]*> f03f 3348 	ext	v0,v1,0x0,0x20
[0-9a-f]+ <[^>]*> f078 3348 	ext	v0,v1,0x1,0x19
[0-9a-f]+ <[^>]*> f0b0 3348 	ext	v0,v1,0x2,0x11
[0-9a-f]+ <[^>]*> f0ec 3348 	ext	v0,v1,0x3,0xd
[0-9a-f]+ <[^>]*> f128 3348 	ext	v0,v1,0x4,0x9
[0-9a-f]+ <[^>]*> f1a6 3348 	ext	v0,v1,0x6,0x7
[0-9a-f]+ <[^>]*> f224 3348 	ext	v0,v1,0x8,0x5
[0-9a-f]+ <[^>]*> f323 3348 	ext	v0,v1,0xc,0x4
[0-9a-f]+ <[^>]*> f422 3348 	ext	v0,v1,0x10,0x3
[0-9a-f]+ <[^>]*> f621 3348 	ext	v0,v1,0x18,0x2
[0-9a-f]+ <[^>]*> f7e0 3348 	ext	v0,v1,0x1f,0x1
[0-9a-f]+ <[^>]*> f03f 3344 	ins	v0,v1,0x0,0x20
[0-9a-f]+ <[^>]*> f079 3344 	ins	v0,v1,0x1,0x19
[0-9a-f]+ <[^>]*> f0b2 3344 	ins	v0,v1,0x2,0x11
[0-9a-f]+ <[^>]*> f0ef 3344 	ins	v0,v1,0x3,0xd
[0-9a-f]+ <[^>]*> f12c 3344 	ins	v0,v1,0x4,0x9
[0-9a-f]+ <[^>]*> f1ac 3344 	ins	v0,v1,0x6,0x7
[0-9a-f]+ <[^>]*> f22c 3344 	ins	v0,v1,0x8,0x5
[0-9a-f]+ <[^>]*> f32f 3344 	ins	v0,v1,0xc,0x4
[0-9a-f]+ <[^>]*> f432 3344 	ins	v0,v1,0x10,0x3
[0-9a-f]+ <[^>]*> f639 3344 	ins	v0,v1,0x18,0x2
[0-9a-f]+ <[^>]*> f7ff 3344 	ins	v0,v1,0x1f,0x1
[0-9a-f]+ <[^>]*> f01f 30c4 	ins	a2,zero,0x0,0x20
[0-9a-f]+ <[^>]*> f059 30c4 	ins	a2,zero,0x1,0x19
[0-9a-f]+ <[^>]*> f092 30c4 	ins	a2,zero,0x2,0x11
[0-9a-f]+ <[^>]*> f0cf 30c4 	ins	a2,zero,0x3,0xd
[0-9a-f]+ <[^>]*> f10c 30c4 	ins	a2,zero,0x4,0x9
[0-9a-f]+ <[^>]*> f18c 30c4 	ins	a2,zero,0x6,0x7
[0-9a-f]+ <[^>]*> f20c 30c4 	ins	a2,zero,0x8,0x5
[0-9a-f]+ <[^>]*> f30f 30c4 	ins	a2,zero,0xc,0x4
[0-9a-f]+ <[^>]*> f412 30c4 	ins	a2,zero,0x10,0x3
[0-9a-f]+ <[^>]*> f619 30c4 	ins	a2,zero,0x18,0x2
[0-9a-f]+ <[^>]*> f7df 30c4 	ins	a2,zero,0x1f,0x1
[0-9a-f]+ <[^>]*> f023 328a 	movn	v0,v1,a0
[0-9a-f]+ <[^>]*> f025 344a 	movn	a0,a1,v0
[0-9a-f]+ <[^>]*> f026 372a 	movn	a3,a2,s1
[0-9a-f]+ <[^>]*> f000 328a 	movn	v0,zero,a0
[0-9a-f]+ <[^>]*> f023 3286 	movz	v0,v1,a0
[0-9a-f]+ <[^>]*> f025 3446 	movz	a0,a1,v0
[0-9a-f]+ <[^>]*> f026 31e6 	movz	s1,a2,a3
[0-9a-f]+ <[^>]*> f000 3286 	movz	v0,zero,a0
[0-9a-f]+ <[^>]*> f023 321a 	movtn	v0,v1
[0-9a-f]+ <[^>]*> f025 341a 	movtn	a0,a1
[0-9a-f]+ <[^>]*> f026 371a 	movtn	a3,a2
[0-9a-f]+ <[^>]*> f000 321a 	movtn	v0,zero
[0-9a-f]+ <[^>]*> f023 3216 	movtz	v0,v1
[0-9a-f]+ <[^>]*> f025 3416 	movtz	a0,a1
[0-9a-f]+ <[^>]*> f026 3116 	movtz	s1,a2
[0-9a-f]+ <[^>]*> f000 3216 	movtz	v0,zero
[0-9a-f]+ <[^>]*> f0c0 3010 	ehb
[0-9a-f]+ <[^>]*> f140 3018 	pause
[0-9a-f]+ <[^>]*> f000 3014 	sync
[0-9a-f]+ <[^>]*> f040 3014 	sync	0x1
[0-9a-f]+ <[^>]*> f100 3014 	sync_wmb
[0-9a-f]+ <[^>]*> f340 3014 	sync	0xd
[0-9a-f]+ <[^>]*> f7c0 3014 	sync	0x1f
[0-9a-f]+ <[^>]*> f100 3014 	sync_wmb
[0-9a-f]+ <[^>]*> f400 3014 	sync_mb
[0-9a-f]+ <[^>]*> f440 3014 	sync_acquire
[0-9a-f]+ <[^>]*> f480 3014 	sync_release
[0-9a-f]+ <[^>]*> f4c0 3014 	sync_rmb
[0-9a-f]+ <[^>]*> f001 304c 	rdhwr	v0,hwr_synci_step
[0-9a-f]+ <[^>]*> f005 306c 	rdhwr	v1,\$5
[0-9a-f]+ <[^>]*> f01d 308c 	rdhwr	a0,\$29
[0-9a-f]+ <[^>]*> f01f 30ac 	rdhwr	a1,\$31
[0-9a-f]+ <[^>]*> f006 670c 	di
[0-9a-f]+ <[^>]*> f006 670c 	di
[0-9a-f]+ <[^>]*> f002 674c 	di	v0
[0-9a-f]+ <[^>]*> f007 670c 	ei
[0-9a-f]+ <[^>]*> f007 670c 	ei
[0-9a-f]+ <[^>]*> f003 674c 	ei	v0
[0-9a-f]+ <[^>]*> f000 6765 	mfc0	v1,c0_pagemask
[0-9a-f]+ <[^>]*> f000 67a9 	mfc0	a1,c0_count
[0-9a-f]+ <[^>]*> f060 67ed 	mfc0	a3,\$13,3
[0-9a-f]+ <[^>]*> f020 672f 	mfc0	s1,c0_ebase
[0-9a-f]+ <[^>]*> f0e0 6751 	mfc0	v0,\$17,7
[0-9a-f]+ <[^>]*> f000 67d5 	mfc0	a2,\$21
[0-9a-f]+ <[^>]*> f001 6765 	mtc0	v1,c0_pagemask
[0-9a-f]+ <[^>]*> f001 67a9 	mtc0	a1,c0_count
[0-9a-f]+ <[^>]*> f061 67ed 	mtc0	a3,\$13,3
[0-9a-f]+ <[^>]*> f021 672f 	mtc0	s1,c0_ebase
[0-9a-f]+ <[^>]*> f0e1 6751 	mtc0	v0,\$17,7
[0-9a-f]+ <[^>]*> f001 67d5 	mtc0	a2,\$21
	\.\.\.
