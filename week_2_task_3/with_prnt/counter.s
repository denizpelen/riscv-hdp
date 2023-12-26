	.file	"counter.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	delay
	.type	delay, @function
delay:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	mv	a5,a0
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	call	clock
	sd	a0,-32(s0)
	nop
.L2:
	call	clock
	mv	a3,a0
	lw	a4,-20(s0)
	ld	a5,-32(s0)
	add	a5,a4,a5
	bltu	a3,a5,.L2
	nop
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	delay, .-delay
	.section	.rodata
	.align	3
.LC0:
	.string	"Count value is: %d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a5,2
	sw	a5,-20(s0)
.L5:
	lw	a5,-20(s0)
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,16
	bne	a4,a5,.L4
	li	a5,2
	sw	a5,-20(s0)
.L4:
	li	a0,500
	call	delay
	j	.L5
	.size	main, .-main
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"
