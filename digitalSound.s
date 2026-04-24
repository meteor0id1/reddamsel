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
	.file	"digitalSound.c"
	.text
	.align	2
	.global	setupSounds
	.syntax unified
	.arm
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r1, #128
	ldr	r2, .L3
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, r0
	mov	r6, r1
	mov	r8, r2
	mov	r1, r7
	mov	r3, #910163968
	mov	r0, #1
	ldr	r2, .L7+8
	ldr	r4, .L7+12
	mov	lr, pc
	bx	r4
	mov	r5, #0
	mov	r2, #128
	mov	r1, #64512
	mov	r0, #1
	ldr	r4, .L7+16
	ldr	r3, .L7+20
	str	r0, [r4, #8]
	str	r8, [r4, #12]
	mov	r0, r6
	strh	r5, [r3, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	str	r6, [r4, #4]
	ldr	r3, .L7+24
	str	r7, [r4]
	mov	lr, pc
	bx	r3
	ldr	r6, .L7+28
	adr	r3, .L7
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r2, #0
	ldr	r3, .L7+32
	mov	lr, pc
	bx	r6
	ldr	r3, .L7+36
	mov	lr, pc
	bx	r3
	str	r5, [r4, #20]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L8:
	.align	3
.L7:
	.word	1443109011
	.word	1078844686
	.word	67109024
	.word	DMANow
	.word	.LANCHOR0
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	1058013184
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	ip, #67108864
	mov	r7, r0
	mov	r5, #0
	mov	r6, r1
	str	r5, [ip, #208]
	mov	r8, r2
	mov	r1, r7
	mov	r3, #910163968
	mov	r0, #2
	ldr	r2, .L11+8
	ldr	r4, .L11+12
	mov	lr, pc
	bx	r4
	mov	r2, #128
	mov	r1, #64512
	mov	r0, #1
	ldr	r4, .L11+16
	ldr	r3, .L11+20
	str	r0, [r4, #32]
	str	r7, [r4, #24]
	str	r8, [r4, #36]
	mov	r0, r6
	strh	r5, [r3, #6]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	str	r6, [r4, #28]
	ldr	r3, .L11+24
	mov	lr, pc
	bx	r3
	ldr	r6, .L11+28
	adr	r3, .L11
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r2, #0
	ldr	r3, .L11+32
	mov	lr, pc
	bx	r6
	ldr	r3, .L11+36
	mov	lr, pc
	bx	r3
	str	r5, [r4, #44]
	str	r0, [r4, #40]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L12:
	.align	3
.L11:
	.word	1443109011
	.word	1078844686
	.word	67109028
	.word	DMANow
	.word	.LANCHOR0
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	1058013184
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	pauseSounds
	.syntax unified
	.arm
	.type	pauseSounds, %function
pauseSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L14
	ldr	r2, .L14+4
	str	r3, [r1, #8]
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
	.word	67109120
	.size	pauseSounds, .-pauseSounds
	.align	2
	.global	unpauseSounds
	.syntax unified
	.arm
	.type	unpauseSounds, %function
unpauseSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #1
	mov	r2, #128
	ldr	r1, .L17
	ldr	r3, .L17+4
	str	r0, [r1, #8]
	strh	r2, [r3, #2]	@ movhi
	str	r0, [r1, #32]
	strh	r2, [r3, #6]	@ movhi
	bx	lr
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.word	67109120
	.size	unpauseSounds, .-unpauseSounds
	.align	2
	.global	stopSounds
	.syntax unified
	.arm
	.type	stopSounds, %function
stopSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r2, #67108864
	ldr	r0, .L20
	ldr	r1, .L20+4
	str	r3, [r0, #8]
	strh	r3, [r1, #2]	@ movhi
	str	r3, [r0, #32]
	str	r3, [r2, #196]
	strh	r3, [r1, #6]	@ movhi
	str	r3, [r2, #208]
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.word	67109120
	.size	stopSounds, .-stopSounds
	.global	soundB
	.global	soundA
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	soundA, %object
	.size	soundA, 24
soundA:
	.space	24
	.type	soundB, %object
	.size	soundB, 24
soundB:
	.space	24
	.global	__aeabi_d2iz
	.global	__aeabi_dmul
	.global	__aeabi_i2d
	.ident	"GCC: (devkitARM) 15.2.0"
