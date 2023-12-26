	.file	"alu.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	alu
	.type	alu, @function
alu:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	mv	a5,a0
	mv	a3,a1
	mv	a4,a2
	sw	a5,-20(s0)
	mv	a5,a3
	sw	a5,-24(s0)
	mv	a5,a4
	sb	a5,-25(s0)
	lbu	a5,-25(s0)
	andi	a4,a5,0xff
	li	a5,43
	bne	a4,a5,.L2
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	j	.L3
.L2:
	lbu	a5,-25(s0)
	andi	a4,a5,0xff
	li	a5,45
	bne	a4,a5,.L4
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	j	.L3
.L4:
	lbu	a5,-25(s0)
	andi	a4,a5,0xff
	li	a5,42
	bne	a4,a5,.L5
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	mulw	a5,a4,a5
	sext.w	a5,a5
	j	.L3
.L5:
	lbu	a5,-25(s0)
	andi	a4,a5,0xff
	li	a5,47
	bne	a4,a5,.L6
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	divw	a5,a4,a5
	sext.w	a5,a5
	j	.L3
.L6:
	lbu	a5,-25(s0)
	andi	a4,a5,0xff
	li	a5,124
	bne	a4,a5,.L7
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	or	a5,a4,a5
	sext.w	a5,a5
	j	.L3
.L7:
	lbu	a5,-25(s0)
	andi	a4,a5,0xff
	li	a5,38
	bne	a4,a5,.L8
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	and	a5,a4,a5
	sext.w	a5,a5
	j	.L3
.L8:
	li	a5,-1
.L3:
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	alu, .-alu
	.section	.rodata
	.align	3
.LC0:
	.string	"Enter first operant "
	.align	3
.LC1:
	.string	"%d"
	.align	3
.LC2:
	.string	"Enter second operant "
	.align	3
.LC3:
	.string	"Enter the operation (+, -, *, /, |, &) "
	.align	3
.LC4:
	.string	" %c"
	.align	3
.LC5:
	.string	"Result: %d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	sw	zero,-20(s0)
.L10:
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	addi	a5,s0,-24
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	scanf
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	printf
	addi	a5,s0,-28
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	scanf
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	addi	a5,s0,-29
	mv	a1,a5
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	scanf
	lw	a5,-24(s0)
	lw	a4,-28(s0)
	lbu	a3,-29(s0)
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	alu
	mv	a5,a0
	mv	a1,a5
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	printf
	j	.L10
	.size	main, .-main
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"
