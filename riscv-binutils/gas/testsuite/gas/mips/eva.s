	.text
	.set	nomips16
	.set	noreorder
test_eva:
	lbue	$0,-256($2)
	lbue	$3,-256
	lbue	$4,255($5)
	lbue	$6,255
	lbue	$7,-257($8)
	lbue	$9,-257
	lbue	$10,256($11)
	lbue	$12,256
	lbue	$13,-512($14)
	lbue	$15,-512
	lbue	$16,511($17)
	lbue	$18,511
	lbue	$19,-1024($20)
	lbue	$21,-1024
	lbue	$22,1023($23)
	lbue	$24,1023
	lbue	$25,-2048($26)
	lbue	$27,-2048
	lbue	$28,2047($29)
	lbue	$30,2047
	lbue	$31,-4096($0)
	lbue	$2,-4096
	lbue	$3,4095($4)
	lbue	$5,4095
	lbue	$6,-32768($7)
	lbue	$8,-32768
	lbue	$9,32767($10)
	lbue	$11,32767
	lbue	$12,-32769($13)
	lbue	$14,-32769
	lbue	$15,32768($16)
	lbue	$17,32768
	lbue	$18,-2147483648($19)
	lbue	$20,-2147483648
	lbue	$21,2147483647($22)
	lbue	$23,2147483647
	lbue	$24,($25)
	lbue	$26,MYDATA
	lhue	$27,-256($28)
	lhue	$29,-256
	lhue	$30,255($31)
	lhue	$0,255
	lhue	$2,-257($3)
	lhue	$4,-257
	lhue	$5,256($6)
	lhue	$7,256
	lhue	$8,-512($9)
	lhue	$10,-512
	lhue	$11,511($12)
	lhue	$13,511
	lhue	$14,-1024($15)
	lhue	$16,-1024
	lhue	$17,1023($18)
	lhue	$19,1023
	lhue	$20,-2048($21)
	lhue	$22,-2048
	lhue	$23,2047($24)
	lhue	$25,2047
	lhue	$26,-4096($27)
	lhue	$28,-4096
	lhue	$29,4095($30)
	lhue	$31,4095
	lhue	$0,-32768($2)
	lhue	$3,-32768
	lhue	$4,32767($5)
	lhue	$6,32767
	lhue	$7,-32769($8)
	lhue	$9,-32769
	lhue	$10,32768($11)
	lhue	$12,32768
	lhue	$13,-2147483648($14)
	lhue	$15,-2147483648
	lhue	$16,2147483647($17)
	lhue	$18,2147483647
	lhue	$19,($20)
	lhue	$21,MYDATA
	lbe	$22,-256($23)
	lbe	$24,-256
	lbe	$25,255($26)
	lbe	$27,255
	lbe	$28,-257($29)
	lbe	$30,-257
	lbe	$31,256($0)
	lbe	$2,256
	lbe	$3,-512($4)
	lbe	$5,-512
	lbe	$6,511($7)
	lbe	$8,511
	lbe	$9,-1024($10)
	lbe	$11,-1024
	lbe	$12,1023($13)
	lbe	$14,1023
	lbe	$15,-2048($16)
	lbe	$17,-2048
	lbe	$18,2047($19)
	lbe	$20,2047
	lbe	$21,-4096($22)
	lbe	$23,-4096
	lbe	$24,4095($25)
	lbe	$26,4095
	lbe	$27,-32768($28)
	lbe	$29,-32768
	lbe	$30,32767($31)
	lbe	$0,32767
	lbe	$2,-32769($3)
	lbe	$4,-32769
	lbe	$5,32768($6)
	lbe	$7,32768
	lbe	$8,-2147483648($9)
	lbe	$10,-2147483648
	lbe	$11,2147483647($12)
	lbe	$13,2147483647
	lbe	$14,($15)
	lbe	$16,MYDATA
	lhe	$17,-256($18)
	lhe	$19,-256
	lhe	$20,255($21)
	lhe	$22,255
	lhe	$23,-257($24)
	lhe	$25,-257
	lhe	$26,256($27)
	lhe	$28,256
	lhe	$29,-512($30)
	lhe	$31,-512
	lhe	$0,511($2)
	lhe	$3,511
	lhe	$4,-1024($5)
	lhe	$6,-1024
	lhe	$7,1023($8)
	lhe	$9,1023
	lhe	$10,-2048($11)
	lhe	$12,-2048
	lhe	$13,2047($14)
	lhe	$15,2047
	lhe	$16,-4096($17)
	lhe	$18,-4096
	lhe	$19,4095($20)
	lhe	$21,4095
	lhe	$22,-32768($23)
	lhe	$24,-32768
	lhe	$25,32767($26)
	lhe	$27,32767
	lhe	$28,-32769($29)
	lhe	$30,-32769
	lhe	$31,32768($0)
	lhe	$2,32768
	lhe	$3,-2147483648($4)
	lhe	$5,-2147483648
	lhe	$6,2147483647($7)
	lhe	$8,2147483647
	lhe	$9,($10)
	lhe	$11,MYDATA
	lle	$12,-256($13)
	lle	$14,-256
	lle	$15,255($16)
	lle	$17,255
	lle	$18,-257($19)
	lle	$20,-257
	lle	$21,256($22)
	lle	$23,256
	lle	$24,-512($25)
	lle	$26,-512
	lle	$27,511($28)
	lle	$29,511
	lle	$30,-1024($31)
	lle	$0,-1024
	lle	$2,1023($3)
	lle	$4,1023
	lle	$5,-2048($6)
	lle	$7,-2048
	lle	$8,2047($9)
	lle	$10,2047
	lle	$11,-4096($12)
	lle	$13,-4096
	lle	$14,4095($15)
	lle	$16,4095
	lle	$17,-32768($18)
	lle	$19,-32768
	lle	$20,32767($21)
	lle	$22,32767
	lle	$23,-32769($24)
	lle	$25,-32769
	lle	$26,32768($27)
	lle	$28,32768
	lle	$29,-2147483648($30)
	lle	$31,-2147483648
	lle	$0,2147483647($2)
	lle	$3,2147483647
	lle	$4,($5)
	lle	$6,MYDATA
	lwe	$7,-256($8)
	lwe	$9,-256
	lwe	$10,255($11)
	lwe	$12,255
	lwe	$13,-257($14)
	lwe	$15,-257
	lwe	$16,256($17)
	lwe	$18,256
	lwe	$19,-512($20)
	lwe	$21,-512
	lwe	$22,511($23)
	lwe	$24,511
	lwe	$25,-1024($26)
	lwe	$27,-1024
	lwe	$28,1023($29)
	lwe	$30,1023
	lwe	$31,-2048($0)
	lwe	$2,-2048
	lwe	$3,2047($4)
	lwe	$5,2047
	lwe	$6,-4096($7)
	lwe	$8,-4096
	lwe	$9,4095($10)
	lwe	$11,4095
	lwe	$12,-32768($13)
	lwe	$14,-32768
	lwe	$15,32767($16)
	lwe	$17,32767
	lwe	$18,-32769($19)
	lwe	$20,-32769
	lwe	$21,32768($22)
	lwe	$23,32768
	lwe	$24,-2147483648($25)
	lwe	$26,-2147483648
	lwe	$27,2147483647($28)
	lwe	$29,2147483647
	lwe	$30,($31)
	lwe	$0,MYDATA
	.ifndef r6
	lwle	$2,-256($3)
	lwle	$4,-256
	lwle	$5,255($6)
	lwle	$7,255
	lwle	$8,-257($9)
	lwle	$10,-257
	lwle	$11,256($12)
	lwle	$13,256
	lwle	$14,-512($15)
	lwle	$16,-512
	lwle	$17,511($18)
	lwle	$19,511
	lwle	$20,-1024($21)
	lwle	$22,-1024
	lwle	$23,1023($24)
	lwle	$25,1023
	lwle	$26,-2048($27)
	lwle	$28,-2048
	lwle	$29,2047($30)
	lwle	$31,2047
	lwle	$0,-4096($2)
	lwle	$3,-4096
	lwle	$4,4095($5)
	lwle	$6,4095
	lwle	$7,-32768($8)
	lwle	$9,-32768
	lwle	$10,32767($11)
	lwle	$12,32767
	lwle	$13,-32769($14)
	lwle	$15,-32769
	lwle	$16,32768($17)
	lwle	$18,32768
	lwle	$19,-2147483648($20)
	lwle	$21,-2147483648
	lwle	$22,2147483647($23)
	lwle	$24,2147483647
	lwle	$25,($26)
	lwle	$27,MYDATA
	lwre	$28,-256($29)
	lwre	$30,-256
	lwre	$31,255($0)
	lwre	$2,255
	lwre	$3,-257($4)
	lwre	$5,-257
	lwre	$6,256($7)
	lwre	$8,256
	lwre	$9,-512($10)
	lwre	$11,-512
	lwre	$12,511($13)
	lwre	$14,511
	lwre	$15,-1024($16)
	lwre	$17,-1024
	lwre	$18,1023($19)
	lwre	$20,1023
	lwre	$21,-2048($22)
	lwre	$23,-2048
	lwre	$24,2047($25)
	lwre	$26,2047
	lwre	$27,-4096($28)
	lwre	$29,-4096
	lwre	$30,4095($31)
	lwre	$0,4095
	lwre	$2,-32768($3)
	lwre	$4,-32768
	lwre	$5,32767($6)
	lwre	$7,32767
	lwre	$8,-32769($9)
	lwre	$10,-32769
	lwre	$11,32768($12)
	lwre	$13,32768
	lwre	$14,-2147483648($15)
	lwre	$16,-2147483648
	lwre	$17,2147483647($18)
	lwre	$19,2147483647
	lwre	$20,($21)
	lwre	$22,MYDATA
	.endif
	sbe	$23,-256($24)
	sbe	$25,-256
	sbe	$26,255($27)
	sbe	$28,255
	sbe	$29,-257($30)
	sbe	$31,-257
	sbe	$0,256($2)
	sbe	$3,256
	sbe	$4,-512($5)
	sbe	$6,-512
	sbe	$7,511($8)
	sbe	$9,511
	sbe	$10,-1024($11)
	sbe	$12,-1024
	sbe	$13,1023($14)
	sbe	$15,1023
	sbe	$16,-2048($17)
	sbe	$18,-2048
	sbe	$19,2047($20)
	sbe	$21,2047
	sbe	$22,-4096($23)
	sbe	$24,-4096
	sbe	$25,4095($26)
	sbe	$27,4095
	sbe	$28,-32768($29)
	sbe	$30,-32768
	sbe	$31,32767($0)
	sbe	$2,32767
	sbe	$3,-32769($4)
	sbe	$5,-32769
	sbe	$6,32768($7)
	sbe	$8,32768
	sbe	$9,-2147483648($10)
	sbe	$11,-2147483648
	sbe	$12,2147483647($13)
	sbe	$14,2147483647
	sbe	$15,($16)
	sbe	$17,MYDATA
	sce	$18,-256($19)
	sce	$20,-256
	sce	$21,255($22)
	sce	$23,255
	sce	$24,-257($25)
	sce	$26,-257
	sce	$27,256($28)
	sce	$29,256
	sce	$30,-512($31)
	sce	$0,-512
	sce	$2,511($3)
	sce	$4,511
	sce	$5,-1024($6)
	sce	$7,-1024
	sce	$8,1023($9)
	sce	$10,1023
	sce	$11,-2048($12)
	sce	$13,-2048
	sce	$14,2047($15)
	sce	$16,2047
	sce	$17,-4096($18)
	sce	$19,-4096
	sce	$20,4095($21)
	sce	$22,4095
	sce	$23,-32768($24)
	sce	$25,-32768
	sce	$26,32767($27)
	sce	$28,32767
	sce	$29,-32769($30)
	sce	$31,-32769
	sce	$0,32768($2)
	sce	$3,32768
	sce	$4,-2147483648($5)
	sce	$6,-2147483648
	sce	$7,2147483647($8)
	sce	$9,2147483647
	sce	$10,($11)
	sce	$12,MYDATA
	she	$13,-256($14)
	she	$15,-256
	she	$16,255($17)
	she	$18,255
	she	$19,-257($20)
	she	$21,-257
	she	$22,256($23)
	she	$24,256
	she	$25,-512($26)
	she	$27,-512
	she	$28,511($29)
	she	$30,511
	she	$31,-1024($0)
	she	$2,-1024
	she	$3,1023($4)
	she	$5,1023
	she	$6,-2048($7)
	she	$8,-2048
	she	$9,2047($10)
	she	$11,2047
	she	$12,-4096($13)
	she	$14,-4096
	she	$15,4095($16)
	she	$17,4095
	she	$18,-32768($19)
	she	$20,-32768
	she	$21,32767($22)
	she	$23,32767
	she	$24,-32769($25)
	she	$26,-32769
	she	$27,32768($28)
	she	$29,32768
	she	$30,-2147483648($31)
	she	$0,-2147483648
	she	$2,2147483647($3)
	she	$4,2147483647
	she	$5,($6)
	she	$7,MYDATA
	swe	$8,-256($9)
	swe	$10,-256
	swe	$11,255($12)
	swe	$13,255
	swe	$14,-257($15)
	swe	$16,-257
	swe	$17,256($18)
	swe	$19,256
	swe	$20,-512($21)
	swe	$22,-512
	swe	$23,511($24)
	swe	$25,511
	swe	$26,-1024($27)
	swe	$28,-1024
	swe	$29,1023($30)
	swe	$31,1023
	swe	$0,-2048($2)
	swe	$3,-2048
	swe	$4,2047($5)
	swe	$6,2047
	swe	$7,-4096($8)
	swe	$9,-4096
	swe	$10,4095($11)
	swe	$12,4095
	swe	$13,-32768($14)
	swe	$15,-32768
	swe	$16,32767($17)
	swe	$18,32767
	swe	$19,-32769($20)
	swe	$21,-32769
	swe	$22,32768($23)
	swe	$24,32768
	swe	$25,-2147483648($26)
	swe	$27,-2147483648
	swe	$28,2147483647($29)
	swe	$30,2147483647
	swe	$31,($0)
	swe	$2,MYDATA
	.ifndef r6
	swle	$3,-256($4)
	swle	$5,-256
	swle	$6,255($7)
	swle	$8,255
	swle	$9,-257($10)
	swle	$11,-257
	swle	$12,256($13)
	swle	$14,256
	swle	$15,-512($16)
	swle	$17,-512
	swle	$18,511($19)
	swle	$20,511
	swle	$21,-1024($22)
	swle	$23,-1024
	swle	$24,1023($25)
	swle	$26,1023
	swle	$27,-2048($28)
	swle	$29,-2048
	swle	$30,2047($31)
	swle	$0,2047
	swle	$2,-4096($3)
	swle	$4,-4096
	swle	$5,4095($6)
	swle	$7,4095
	swle	$8,-32768($9)
	swle	$10,-32768
	swle	$11,32767($12)
	swle	$13,32767
	swle	$14,-32769($15)
	swle	$16,-32769
	swle	$17,32768($18)
	swle	$19,32768
	swle	$20,-2147483648($21)
	swle	$22,-2147483648
	swle	$23,2147483647($24)
	swle	$25,2147483647
	swle	$26,($27)
	swle	$28,MYDATA
	swre	$29,-256($30)
	swre	$31,-256
	swre	$0,255($2)
	swre	$3,255
	swre	$4,-257($5)
	swre	$6,-257
	swre	$7,256($8)
	swre	$9,256
	swre	$10,-512($11)
	swre	$12,-512
	swre	$13,511($14)
	swre	$15,511
	swre	$16,-1024($17)
	swre	$18,-1024
	swre	$19,1023($20)
	swre	$21,1023
	swre	$22,-2048($23)
	swre	$24,-2048
	swre	$25,2047($26)
	swre	$27,2047
	swre	$28,-4096($29)
	swre	$30,-4096
	swre	$31,4095($0)
	swre	$2,4095
	swre	$3,-32768($4)
	swre	$5,-32768
	swre	$6,32767($7)
	swre	$8,32767
	swre	$9,-32769($10)
	swre	$11,-32769
	swre	$12,32768($13)
	swre	$14,32768
	swre	$15,-2147483648($16)
	swre	$17,-2147483648
	swre	$18,2147483647($19)
	swre	$20,2147483647
	swre	$21,($22)
	swre	$23,MYDATA
	.endif
	cachee	24,-256($25)
	cachee	26,-256
	cachee	27,255($28)
	cachee	29,255
	cachee	30,-257($31)
	cachee	0,-257
	cachee	2,256($3)
	cachee	4,256
	cachee	5,-512($6)
	cachee	7,-512
	cachee	8,511($9)
	cachee	10,511
	cachee	11,-1024($12)
	cachee	13,-1024
	cachee	14,1023($15)
	cachee	16,1023
	cachee	17,-2048($18)
	cachee	19,-2048
	cachee	20,2047($21)
	cachee	22,2047
	cachee	23,-4096($24)
	cachee	25,-4096
	cachee	26,4095($27)
	cachee	28,4095
	cachee	29,-32768($30)
	cachee	31,-32768
	cachee	0,32767($2)
	cachee	3,32767
	cachee	4,-32769($5)
	cachee	6,-32769
	cachee	7,32768($8)
	cachee	9,32768
	cachee	10,-2147483648($11)
	cachee	12,-2147483648
	cachee	13,2147483647($14)
	cachee	15,2147483647
	cachee	16,($17)
	cachee	18,MYDATA
	prefe	19,-256($20)
	prefe	21,-256
	prefe	22,255($23)
	prefe	24,255
	prefe	25,-257($26)
	prefe	27,-257
	prefe	28,256($29)
	prefe	30,256
	prefe	31,-512($0)
	prefe	2,-512
	prefe	3,511($4)
	prefe	5,511
	prefe	6,-1024($7)
	prefe	8,-1024
	prefe	9,1023($10)
	prefe	11,1023
	prefe	12,-2048($13)
	prefe	14,-2048
	prefe	15,2047($16)
	prefe	17,2047
	prefe	18,-4096($19)
	prefe	20,-4096
	prefe	21,4095($22)
	prefe	23,4095
	prefe	24,-32768($25)
	prefe	26,-32768
	prefe	27,32767($28)
	prefe	29,32767
	prefe	30,-32769($31)
	prefe	0,-32769
	prefe	2,32768($3)
	prefe	4,32768
	prefe	5,-2147483648($6)
	prefe	7,-2147483648
	prefe	8,2147483647($9)
	prefe	10,2147483647
	prefe	11,($12)
	prefe	13,MYDATA
	prefe	5,%lo(foo)($6)

	.ifdef r6
	llwpe $2, $3, 0x1234
	llwpe $2, $0, 0xabcd($0)
	llwpe $0, $3, %lo(sync_mem)
	llwpe $2, $2, 0xffffffff01234567($0)
	llwpe $0, $0, sync_mem
	scwpe $2, $3, 0x1234
	scwpe $2, $0, 0xabcd($0)
	scwpe $0, $3, %lo(sync_mem)
	scwpe $2, $2, 0xffffffff01234567($0)
	scwpe $0, $0, sync_mem
	.endif
