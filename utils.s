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
	.file	"utils.c"
	.text
	.align	2
	.global	clearBackground
	.syntax unified
	.arm
	.type	clearBackground, %function
clearBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r3, r0, #49152
	lsl	r3, r3, #11
	orr	r1, r1, r1, lsl #16
	add	r2, r3, #2048
.L2:
	str	r1, [r3]
	str	r1, [r3, #4]
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L2
	bx	lr
	.size	clearBackground, .-clearBackground
	.align	2
	.global	clipSpritesOffScreen
	.syntax unified
	.arm
	.type	clipSpritesOffScreen, %function
clipSpritesOffScreen:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r3, r3, #0
	cmp	r1, #239
	cmple	r3, r1
	blt	.L9
	mov	r0, #1
	bx	lr
.L9:
	ldr	r3, [sp]
	rsb	r3, r3, #0
	cmp	r2, #159
	cmple	r3, r2
	movge	r0, #1
	movlt	r0, #0
	bx	lr
	.size	clipSpritesOffScreen, .-clipSpritesOffScreen
	.align	2
	.global	setCollisionMap
	.syntax unified
	.arm
	.type	setCollisionMap, %function
setCollisionMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	cmpgt	r1, #0
	ldrgt	r3, .L12
	strgt	r0, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.size	setCollisionMap, .-setCollisionMap
	.align	2
	.global	colorAt
	.syntax unified
	.arm
	.type	colorAt, %function
colorAt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L15
	add	r0, r0, r1, lsl #9
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	bx	lr
.L16:
	.align	2
.L15:
	.word	level1CMBitmap
	.size	colorAt, .-colorAt
	.align	2
	.global	mapCollide
	.syntax unified
	.arm
	.type	mapCollide, %function
mapCollide:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	orr	r3, r0, r1
	cmp	r3, #512
	bcc	.L21
	mov	r0, #1
	bx	lr
.L21:
	ldr	r3, .L22
	add	r0, r0, r1, lsl #9
	ldrb	r3, [r3, r0]	@ zero_extendqisi2
	cmp	r3, #31
	bhi	.L20
	mov	r1, #1
	ands	r2, r2, r1, lsl r3
	movne	r0, r1
	moveq	r0, #0
	bx	lr
.L20:
	mov	r0, #0
	bx	lr
.L23:
	.align	2
.L22:
	.word	level1CMBitmap
	.size	mapCollide, .-mapCollide
	.align	2
	.global	hitboxCollide
	.syntax unified
	.arm
	.type	hitboxCollide, %function
hitboxCollide:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #4]
	ldr	ip, [sp, #12]
	add	ip, lr, ip
	cmp	ip, r0
	ble	.L28
	add	r0, r0, r2
	cmp	r0, lr
	bgt	.L30
.L28:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L30:
	ldr	r2, [sp, #8]
	ldr	r0, [sp, #16]
	add	r2, r2, r0
	cmp	r2, r1
	ble	.L28
	add	r0, r1, r3
	ldr	r3, [sp, #8]
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	hitboxCollide, .-hitboxCollide
	.align	2
	.global	resetOff
	.syntax unified
	.arm
	.type	resetOff, %function
resetOff:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #0
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	strh	r2, [r3, #24]	@ movhi
	strh	r2, [r3, #26]	@ movhi
	strh	r2, [r3, #28]	@ movhi
	strh	r2, [r3, #30]	@ movhi
	bx	lr
	.size	resetOff, .-resetOff
	.global	currentCollisionMap
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	currentCollisionMap, %object
	.size	currentCollisionMap, 4
currentCollisionMap:
	.word	level1CMBitmap
	.ident	"GCC: (devkitARM) 15.2.0"
