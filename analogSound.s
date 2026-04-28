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
	.file	"analogSound.c"
	.text
	.align	2
	.global	initSound
	.syntax unified
	.arm
	.type	initSound, %function
initSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mvn	r1, #170
	mov	r2, #2
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
	.size	initSound, .-initSound
	.align	2
	.global	playNoteWithDuration
	.syntax unified
	.arm
	.type	playNoteWithDuration, %function
playNoteWithDuration:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0]
	cmp	r3, #0
	beq	.L4
	ldrb	r2, [r0, #2]	@ zero_extendqisi2
	ldr	r3, .L6
	lsl	r2, r2, #8
	smull	ip, r2, r3, r2
	lsl	r1, r1, #6
	asr	r3, r2, #6
	and	r1, r1, #255
	rsb	r3, r3, #64
	orr	r3, r3, r1
	mvn	r3, r3, lsl #20
	mvn	r3, r3, lsr #20
	mov	ip, #67108864
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [ip, #104]	@ movhi
	ldrh	r3, [r0]
	orr	r3, r3, #49152
	strh	r3, [ip, #108]	@ movhi
	bx	lr
.L4:
	mov	r2, #67108864
	strh	r3, [r2, #104]	@ movhi
	strh	r3, [r2, #108]	@ movhi
	bx	lr
.L7:
	.align	2
.L6:
	.word	274877907
	.size	playNoteWithDuration, .-playNoteWithDuration
	.align	2
	.global	playChannel1
	.syntax unified
	.arm
	.type	playChannel1, %function
playChannel1:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldrb	r4, [sp, #12]	@ zero_extendqisi2
	ldrb	lr, [sp, #20]	@ zero_extendqisi2
	subs	r4, r4, #0
	mov	r5, r0
	ldr	r0, .L12
	movne	r4, #1
	cmp	lr, #0
	ldr	ip, .L12+4
	movne	ip, r0
	mov	lr, #67108864
	lsl	r3, r3, #4
	ldrb	r0, [sp, #24]	@ zero_extendqisi2
	and	r3, r3, #112
	and	r2, r2, #7
	orr	r2, r2, r3
	ldrb	r3, [sp, #16]	@ zero_extendqisi2
	lsl	r0, r0, #6
	and	r0, r0, #255
	and	r1, r1, #63
	lsl	r3, r3, #8
	orr	r1, r1, r0
	and	r3, r3, #1792
	orr	r1, r1, r3
	orr	r3, ip, r1
	lsl	r3, r3, #16
	orr	r2, r2, r4, lsl #3
	orr	r0, r5, #49152
	lsr	r3, r3, #16
	strh	r3, [lr, #98]	@ movhi
	strh	r0, [lr, #100]	@ movhi
	strh	r2, [lr, #96]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	-2048
	.word	-4096
	.size	playChannel1, .-playChannel1
	.align	2
	.global	playDrumSound
	.syntax unified
	.arm
	.type	playDrumSound, %function
playDrumSound:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	r2, r2, #0
	movne	r2, #1
	str	lr, [sp, #-4]!
	mov	lr, #67108864
	ldrb	ip, [sp, #4]	@ zero_extendqisi2
	lsl	r1, r1, #4
	lsl	ip, ip, #8
	and	r1, r1, #255
	and	r0, r0, #7
	and	ip, ip, #1792
	orr	r0, r0, r1
	and	r3, r3, #63
	orr	r3, r3, ip
	orr	r0, r0, r2, lsl #3
	orr	r3, r3, #61440
	orr	r0, r0, #49152
	strh	r3, [lr, #120]	@ movhi
	strh	r0, [lr, #124]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
	.size	playDrumSound, .-playDrumSound
	.align	2
	.global	playAnalogSound
	.syntax unified
	.arm
	.type	playAnalogSound, %function
playAnalogSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L28
	cmp	r0, #7
	bhi	.L16
	ldrb	r0, [r3, r0]
	add	pc, pc, r0, lsl #2
.Lrtx19:
	nop
	.section	.rodata
.L19:
	.byte	(.L26-.Lrtx19-4)/4
	.byte	(.L25-.Lrtx19-4)/4
	.byte	(.L23-.Lrtx19-4)/4
	.byte	(.L23-.Lrtx19-4)/4
	.byte	(.L22-.Lrtx19-4)/4
	.byte	(.L21-.Lrtx19-4)/4
	.byte	(.L20-.Lrtx19-4)/4
	.byte	(.L18-.Lrtx19-4)/4
	.text
	.p2align 2
.L18:
	mov	r3, #67108864
	mov	r2, #27
	ldr	r0, .L28+4
	ldr	r1, .L28+8
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
.L16:
	bx	lr
.L23:
	mov	r3, #67108864
	ldr	r1, .L28+12
	ldr	r2, .L28+16
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L22:
	mov	r3, #67108864
	ldr	r1, .L28+20
	ldr	r2, .L28+24
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L21:
	mov	r3, #67108864
	mov	r2, #18
	ldr	r0, .L28+4
	ldr	r1, .L28+28
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L20:
	mov	r3, #67108864
	mov	r2, #1
	ldr	r0, .L28+32
	ldr	r1, .L28+8
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L26:
	mov	r3, #67108864
	mov	r2, #49152
	ldr	r1, .L28+36
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L25:
	mov	r3, #67108864
	mov	r2, #28
	ldr	r0, .L28+40
	ldr	r1, .L28+44
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L29:
	.align	2
.L28:
	.word	.L19
	.word	-3944
	.word	-14586
	.word	-3832
	.word	-16232
	.word	-3302
	.word	-16272
	.word	-14670
	.word	-3940
	.word	-3579
	.word	-3434
	.word	-14601
	.size	playAnalogSound, .-playAnalogSound
	.ident	"GCC: (devkitARM) 15.2.0"
