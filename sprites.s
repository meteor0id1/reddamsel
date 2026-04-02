	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"sprites.c"
	.text
	.align	2
	.global	hideSprites
	.syntax unified
	.arm
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #512
	ldr	r3, .L6
	add	r2, r3, #1024
.L2:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L2
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.size	hideSprites, .-hideSprites
	.global	shadowOAM
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	shadowOAM, %object
	.size	shadowOAM, 1024
shadowOAM:
	.space	1024
	.ident	"GCC: (devkitARM) 15.2.0"
