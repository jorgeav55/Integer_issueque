	addi s0, zero, 35
	addi s1, zero, 15
	xori s2, s1, 0xAA
	ori s3, s0, 0xC
	andi s4, s2, 0xF0
	slli s5, s3, 0x1F
	srli s6, s5, 2
	slti s8, s7, 0xA1
	sltiu s9, s7, 0xA1
	mul t6, s2, s4
	mul t5, s2, t6
	mul t4, t6, t5
	add s10, s6, s4
	sub s11, s8, s9
	xor s0, s10, s11
	or s1, s0, s11
	and s2, s1, s0
	sll s3, s2, s3
	srl s4, s3, s2