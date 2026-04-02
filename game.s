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
	.file	"game.c"
	.text
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
	ldr	r3, .L3
	add	r0, r0, r1, lsl #8
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	bx	lr
.L4:
	.align	2
.L3:
	.word	testmapcmBitmap
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
	cmp	r3, #255
	bls	.L8
	mov	r0, #1
	bx	lr
.L8:
	ldr	r3, .L9
	add	r0, r0, r1, lsl #8
	ldrb	r0, [r3, r0]	@ zero_extendqisi2
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L10:
	.align	2
.L9:
	.word	testmapcmBitmap
	.size	mapCollide, .-mapCollide
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #8
	mov	ip, #1280
	mov	r0, #4
	ldr	r3, .L13
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #1920
	str	ip, [r3, #4]
	str	r0, [r3, #16]
	mov	ip, #7
	mov	r0, #10
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	mov	r1, #1
	str	lr, [r3]
	strb	r2, [r3, #36]
	add	lr, r3, #56
	strh	r2, [r3, #52]	@ movhi
	str	lr, [r3, #44]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #40]
	str	ip, [r3, #20]
	str	r0, [r3, #32]
	str	r1, [r3, #48]
	ldr	lr, [sp], #4
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	push	{r4, r5, r6, r7, lr}
	mov	r0, #1280
	mov	r7, #960
	mov	r2, #0
	mov	lr, #4
	mov	ip, #8
	mov	r6, #10
	mov	r4, r1
	ldr	r3, .L19
	sub	r5, r3, #4
.L16:
	strb	r1, [r3, #53]
	add	r1, r1, #1
	cmp	r1, #4
	stm	r3, {r0, r7}
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r6, [r3, #32]
	strb	r2, [r3, #36]
	str	r2, [r3, #40]
	str	r5, [r3, #44]
	str	r4, [r3, #48]
	strb	r2, [r3, #52]
	add	r0, r0, #640
	add	r3, r3, #56
	bne	.L16
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0+60
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #8
	mov	ip, #1280
	mov	r0, #4
	str	lr, [sp, #-4]!
	ldr	r3, .L23
	mov	r2, #0
	mov	lr, #1920
	str	ip, [r3, #4]
	str	r0, [r3, #16]
	mov	ip, #7
	mov	r0, #10
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	mov	r1, #1
	str	lr, [r3]
	strb	r2, [r3, #36]
	add	lr, r3, #56
	strh	r2, [r3, #52]	@ movhi
	str	lr, [r3, #44]
	ldr	lr, [sp], #4
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #40]
	str	ip, [r3, #20]
	str	r0, [r3, #32]
	str	r1, [r3, #48]
	b	initEnemies
.L24:
	.align	2
.L23:
	.word	.LANCHOR0
	.size	initGame, .-initGame
	.align	2
	.global	updateCamera
	.syntax unified
	.arm
	.type	updateCamera, %function
updateCamera:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L32
	ldm	r1, {r2, r3}
	asr	r2, r2, #4
	subs	r2, r2, #120
	movmi	r2, #0
	asr	r3, r3, #4
	movmi	ip, r2
	sub	r3, r3, #80
	bmi	.L26
	cmp	r2, #16
	movgt	r2, #16
	movgt	ip, r2
	lslle	ip, r2, #16
	lsrle	ip, ip, #16
.L26:
	cmp	r3, #0
	movlt	r3, #0
	str	r2, [r1, #228]
	movlt	r0, r3
	blt	.L27
	cmp	r3, #96
	movgt	r3, #96
	movgt	r0, r3
	lslle	r0, r3, #16
	lsrle	r0, r0, #16
.L27:
	mov	r2, #67108864
	str	r3, [r1, #232]
	strh	ip, [r2, #20]	@ movhi
	strh	r0, [r2, #22]	@ movhi
	strh	ip, [r2, #24]	@ movhi
	strh	r0, [r2, #26]	@ movhi
	strh	ip, [r2, #28]	@ movhi
	strh	r0, [r2, #30]	@ movhi
	bx	lr
.L33:
	.align	2
.L32:
	.word	.LANCHOR0
	.size	updateCamera, .-updateCamera
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Player position: (%d, %d), velocity: (%d, %d), stat"
	.ascii	"e: %d, frame: %d\012\000"
	.text
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L84+8
	ldrh	r5, [r2]
	ldr	r4, .L84+12
	tst	r5, #64
	sub	sp, sp, #28
	mvneq	r2, #11
	str	r3, [r4, #8]
	str	r3, [r4, #12]
	moveq	r3, #3
	streq	r2, [r4, #12]
	strbeq	r3, [r4, #36]
	tst	r5, #128
	moveq	r2, #2
	ldreq	r3, [r4, #12]
	addeq	r3, r3, #12
	strbeq	r2, [r4, #36]
	streq	r3, [r4, #12]
	ands	r3, r5, #32
	mvneq	r2, #11
	strbeq	r3, [r4, #36]
	streq	r2, [r4, #8]
	tst	r5, #16
	moveq	r2, #1
	strbeq	r2, [r4, #36]
	ldr	r2, .L84+16
	ldreq	r3, [r4, #8]
	ldrh	r2, [r2]
	addeq	r3, r3, #12
	streq	r3, [r4, #8]
	tst	r2, #512
	ldrb	r3, [r4, #52]	@ zero_extendqisi2
	beq	.L39
	ands	r5, r5, #512
	beq	.L81
.L39:
	cmp	r3, #2
	ldr	r5, [r4, #40]
	beq	.L43
	str	r3, [sp, #20]
	ldr	r6, [r4, #8]
	ldr	r0, [r4, #12]
.L44:
	ldm	r4, {r1, ip}
	add	r3, r4, #16
	ldm	r3, {r3, r7}
	add	lr, r1, r6
	add	lr, r3, lr, asr #4
	add	r2, r7, ip, asr #4
	orr	r8, lr, r2
	cmp	r8, #255
	asr	fp, ip, #4
	bls	.L82
.L49:
	mov	r6, #0
	str	r6, [r4, #8]
.L50:
	add	ip, ip, r0
	add	r3, r3, r1, asr #4
	add	ip, r7, ip, asr #4
	orr	r2, r3, ip
	cmp	r2, #255
	asr	r1, r1, #4
	bls	.L83
.L51:
	mov	r0, #0
	str	r0, [r4, #12]
.L52:
	ldr	r3, [sp, #20]
	str	r5, [sp, #8]
	str	r3, [sp, #4]
	str	r0, [sp]
	mov	r3, r6
	ldr	r0, .L84+20
	ldr	r5, .L84+24
	mov	r2, fp
	mov	lr, pc
	bx	r5
	ldr	r0, [r4, #8]
	cmp	r0, #0
	ldr	r7, [r4, #4]
	ldrb	r6, [r4, #52]	@ zero_extendqisi2
	ldr	r5, [r4, #12]
	beq	.L53
	cmp	r5, #0
	ldr	r10, [r4]
	beq	.L54
	ldr	fp, .L84+28
	mov	lr, pc
	bx	fp
	ldr	ip, .L84+32
	adr	r3, .L84
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r10
	mov	r9, r1
	mov	lr, pc
	bx	fp
	mov	r10, fp
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	ldr	fp, .L84+36
	mov	lr, pc
	bx	fp
	ldr	r3, .L84+40
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	mov	r0, r5
	mov	lr, pc
	bx	r10
	adr	r3, .L84
	ldmia	r3, {r2-r3}
	ldr	ip, .L84+32
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r7
	mov	r9, r1
	mov	lr, pc
	bx	r10
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	fp
	ldr	r3, .L84+40
	mov	lr, pc
	bx	r3
	cmp	r6, #2
	str	r0, [r4, #4]
	beq	.L34
.L56:
	mov	r2, #1
	mov	r3, #6
	ldr	r1, .L84+44
	strb	r2, [r4, #52]
	str	r1, [r4, #44]
	str	r3, [r4, #48]
.L57:
	ldr	r3, [r4, #32]
	sub	r3, r3, #1
	cmp	r3, #0
	strgt	r3, [r4, #32]
	bgt	.L34
	mov	r2, #6
	ldr	r0, [r4, #40]
	ldr	r3, .L84+48
	ldr	r1, [r4, #48]
	str	r2, [r4, #32]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #40]
.L34:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L53:
	add	r3, r7, r5
	cmp	r6, #2
	str	r3, [r4, #4]
	beq	.L34
	cmp	r5, #0
	bne	.L56
	mov	r3, #1
	ldr	r2, .L84+52
	strb	r5, [r4, #52]
	str	r2, [r4, #44]
	str	r5, [r4, #40]
	str	r3, [r4, #48]
	b	.L57
.L81:
	cmp	r3, #2
	beq	.L34
	mov	r1, #2
	mov	r2, #6
	mov	r3, #5
	ldr	r0, .L84+56
	str	r5, [r4, #40]
	str	r0, [r4, #44]
	strb	r1, [r4, #52]
	str	r2, [r4, #48]
	str	r3, [r4, #32]
.L42:
	ldrb	r3, [r4, #52]	@ zero_extendqisi2
	str	r3, [sp, #20]
.L48:
	ldr	r0, [r4, #8]
	ldr	r8, .L84+28
	mov	lr, pc
	bx	r8
	ldr	r9, .L84+60
	mov	r2, #0
	ldr	r3, .L84+64
	mov	lr, pc
	bx	r9
	ldr	r7, .L84+40
	mov	lr, pc
	bx	r7
	mov	r6, r0
	ldr	r0, [r4, #12]
	str	r6, [r4, #8]
	mov	lr, pc
	bx	r8
	mov	r2, #0
	ldr	r3, .L84+64
	mov	lr, pc
	bx	r9
	mov	lr, pc
	bx	r7
	str	r0, [r4, #12]
	b	.L44
.L83:
	ldr	lr, .L84+68
	add	r2, r3, ip, lsl #8
	ldrb	r2, [lr, r2]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L51
	ldr	r2, [r4, #24]
	add	r2, r3, r2
	sub	r2, r2, #1
	cmp	r2, #255
	bhi	.L51
	add	r7, r2, ip, lsl #8
	ldrb	r7, [lr, r7]	@ zero_extendqisi2
	cmp	r7, #0
	bne	.L51
	ldr	r7, [r4, #28]
	add	ip, ip, r7
	sub	ip, ip, #1
	cmp	ip, #255
	bhi	.L51
	add	r3, r3, ip, lsl #8
	ldrb	r3, [lr, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L51
	add	r2, r2, ip, lsl #8
	ldrb	r3, [lr, r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L52
	b	.L51
.L82:
	ldr	r9, .L84+68
	add	r8, lr, r2, lsl #8
	ldrb	r8, [r9, r8]	@ zero_extendqisi2
	cmp	r8, #0
	bne	.L49
	ldr	r8, [r4, #24]
	add	r8, lr, r8
	sub	r8, r8, #1
	cmp	r8, #255
	bhi	.L49
	add	r10, r8, r2, lsl #8
	ldrb	r10, [r9, r10]	@ zero_extendqisi2
	cmp	r10, #0
	bne	.L49
	ldr	r10, [r4, #28]
	add	r2, r2, r10
	sub	r2, r2, #1
	cmp	r2, #255
	bhi	.L49
	add	lr, lr, r2, lsl #8
	ldrb	lr, [r9, lr]	@ zero_extendqisi2
	cmp	lr, #0
	bne	.L49
	add	r2, r8, r2, lsl #8
	ldrb	r2, [r9, r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L50
	b	.L49
.L54:
	add	r0, r0, r10
	cmp	r6, #2
	str	r0, [r4]
	bne	.L56
	b	.L34
.L43:
	ldr	r3, [r4, #32]
	sub	r3, r3, #1
	cmp	r3, #0
	movle	r3, #6
	ldr	r2, [r4, #48]
	addle	r5, r5, #1
	strle	r5, [r4, #40]
	cmp	r5, r2
	str	r3, [r4, #32]
	blt	.L42
	mov	r3, #0
	mov	r2, #1
	ldr	r1, .L84+52
	mov	r5, r3
	str	r1, [r4, #44]
	strb	r3, [r4, #52]
	str	r2, [r4, #48]
	str	r3, [r4, #40]
	str	r3, [sp, #20]
	b	.L48
.L85:
	.align	3
.L84:
	.word	1717986918
	.word	1073112678
	.word	buttons
	.word	.LANCHOR0
	.word	oldButtons
	.word	.LC0
	.word	mgba_printf
	.word	__aeabi_i2d
	.word	__aeabi_ddiv
	.word	__aeabi_dadd
	.word	__aeabi_d2iz
	.word	.LANCHOR1+24
	.word	__aeabi_idivmod
	.word	.LANCHOR0+56
	.word	.LANCHOR1
	.word	__aeabi_dmul
	.word	1073217536
	.word	testmapcmBitmap
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	pop	{r4, lr}
	b	updateCamera
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L94
	ldr	r1, .L94+4
	ldrb	r3, [r2, #53]	@ zero_extendqisi2
	ldr	r0, [r2]
	lsl	ip, r3, #3
	add	lr, r1, r3, lsl #3
	ldr	r3, [r2, #228]
	ldr	r4, [r2, #4]
	rsb	r3, r3, r0, asr #4
	ldr	r0, [r2, #232]
	rsb	r0, r0, r4, asr #4
	strh	r0, [r1, ip]	@ movhi
	ldrb	r0, [r2, #36]	@ zero_extendqisi2
	lsl	r3, r3, #16
	ldr	r4, [r2, #40]
	lsr	r3, r3, #16
	cmp	r0, #1
	ldr	r2, [r2, #44]
	orreq	r3, r3, #20480
	ldr	r2, [r2, r4, lsl #2]
	strheq	r3, [lr, #2]	@ movhi
	beq	.L90
	orr	r3, r3, #16384
	cmp	r0, #0
	strh	r3, [lr, #2]	@ movhi
	bne	.L90
.L93:
	ldr	r3, .L94+8
	lsl	r2, r2, #1
	and	r3, r2, r3
	add	r1, r1, ip
	strh	r3, [r1, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L90:
	sub	r0, r0, #1
	add	r2, r2, r0, lsl #5
	b	.L93
.L95:
	.align	2
.L94:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	1022
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawPlayer
	ldr	r3, .L98
	mov	lr, pc
	bx	r3
	ldr	r4, .L98+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L98+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L99:
	.align	2
.L98:
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.global	vOff
	.global	hOff
	.global	enemies
	.global	player
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	dodgeFrames, %object
	.size	dodgeFrames, 24
dodgeFrames:
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.type	walkFrames, %object
	.size	walkFrames, 24
walkFrames:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	player, %object
	.size	player, 56
player:
	.space	56
	.type	idleFrames, %object
	.size	idleFrames, 4
idleFrames:
	.space	4
	.type	enemies, %object
	.size	enemies, 168
enemies:
	.space	168
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.global	__aeabi_idivmod
	.global	__aeabi_dadd
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.global	__aeabi_dmul
	.global	__aeabi_i2d
	.ident	"GCC: (devkitARM) 15.2.0"
