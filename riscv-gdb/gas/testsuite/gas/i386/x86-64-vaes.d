#objdump: -dw
#name: x86-64 VAES

.*:     file format .*

Disassembly of section .text:

0+ <_start>:
[ 	]*[a-f0-9]+:	c4 e2 4d dc d4       	vaesenc %ymm4,%ymm6,%ymm2
[ 	]*[a-f0-9]+:	c4 e2 4d dc 39       	vaesenc \(%rcx\),%ymm6,%ymm7
[ 	]*[a-f0-9]+:	c4 e2 4d dd d4       	vaesenclast %ymm4,%ymm6,%ymm2
[ 	]*[a-f0-9]+:	c4 e2 4d dd 39       	vaesenclast \(%rcx\),%ymm6,%ymm7
[ 	]*[a-f0-9]+:	c4 e2 4d de d4       	vaesdec %ymm4,%ymm6,%ymm2
[ 	]*[a-f0-9]+:	c4 e2 4d de 39       	vaesdec \(%rcx\),%ymm6,%ymm7
[ 	]*[a-f0-9]+:	c4 e2 4d df d4       	vaesdeclast %ymm4,%ymm6,%ymm2
[ 	]*[a-f0-9]+:	c4 e2 4d df 39       	vaesdeclast \(%rcx\),%ymm6,%ymm7
[ 	]*[a-f0-9]+:	c4 e2 4d dc d4       	vaesenc %ymm4,%ymm6,%ymm2
[ 	]*[a-f0-9]+:	c4 e2 4d dc 39       	vaesenc \(%rcx\),%ymm6,%ymm7
[ 	]*[a-f0-9]+:	c4 e2 4d dc 39       	vaesenc \(%rcx\),%ymm6,%ymm7
[ 	]*[a-f0-9]+:	c4 e2 4d dd d4       	vaesenclast %ymm4,%ymm6,%ymm2
[ 	]*[a-f0-9]+:	c4 e2 4d dd 39       	vaesenclast \(%rcx\),%ymm6,%ymm7
[ 	]*[a-f0-9]+:	c4 e2 4d dd 39       	vaesenclast \(%rcx\),%ymm6,%ymm7
[ 	]*[a-f0-9]+:	c4 e2 4d de d4       	vaesdec %ymm4,%ymm6,%ymm2
[ 	]*[a-f0-9]+:	c4 e2 4d de 39       	vaesdec \(%rcx\),%ymm6,%ymm7
[ 	]*[a-f0-9]+:	c4 e2 4d de 39       	vaesdec \(%rcx\),%ymm6,%ymm7
[ 	]*[a-f0-9]+:	c4 e2 4d df d4       	vaesdeclast %ymm4,%ymm6,%ymm2
[ 	]*[a-f0-9]+:	c4 e2 4d df 39       	vaesdeclast \(%rcx\),%ymm6,%ymm7
[ 	]*[a-f0-9]+:	c4 e2 4d df 39       	vaesdeclast \(%rcx\),%ymm6,%ymm7
#pass
