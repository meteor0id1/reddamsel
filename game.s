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
	.global	initPlayer
	.syntax unified
	.arm
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r1, #8
	mov	ip, #7360
	mov	r0, #4
	ldr	r3, .L4
	str	lr, [sp, #-4]!
	mov	lr, #1280
	strb	r2, [r3, #36]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #40]
	mov	r2, #256
	str	ip, [r3, #4]
	str	r0, [r3, #16]
	mov	ip, #7
	mov	r0, #5
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	mov	r1, #1
	str	lr, [r3]
	strh	r2, [r3, #52]	@ movhi
	add	lr, r3, #56
	str	lr, [r3, #44]
	str	ip, [r3, #20]
	str	r0, [r3, #32]
	str	r1, [r3, #48]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initSword
	.syntax unified
	.arm
	.type	initSword, %function
initSword:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	ldr	r2, .L8+4
	push	{r4, r5}
	str	r2, [r3, #96]
	mov	r2, #0
	mov	r0, #0
	mov	r1, #0
	mov	r4, #0
	mov	r5, #5
	mov	ip, #5
	strb	r2, [r3, #104]
	str	r4, [r3, #88]
	str	r5, [r3, #92]
	str	r0, [r3, #64]
	str	r1, [r3, #68]
	str	r0, [r3, #72]
	str	r1, [r3, #76]
	str	r0, [r3, #80]
	str	r1, [r3, #84]
	str	ip, [r3, #100]
	pop	{r4, r5}
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	initSword, .-initSword
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r1, #2
	mov	r2, #0
	mov	r6, #4
	mov	r5, #8
	mov	r8, #10
	mov	r4, #1
	ldr	r3, .L14
	ldr	r0, .L14+4
	add	r7, r3, #320
.L11:
	ldr	lr, [r0]
	ldr	ip, [r0, #4]
	strb	r1, [r3, #76]
	add	r1, r1, #1
	and	r1, r1, #255
	lsl	lr, lr, #4
	lsl	ip, ip, #4
	cmp	r1, #6
	str	lr, [r3, #4]
	str	ip, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r6, [r3, #20]
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	str	r5, [r3, #32]
	str	r8, [r3, #44]
	strb	r2, [r3, #36]
	strb	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r7, [r3, #56]
	str	r4, [r3, #60]
	strb	r2, [r3, #64]
	str	r4, [r3, #68]
	str	r2, [r3, #72]
	add	r0, r0, #32
	str	r4, [r3], #80
	bne	.L11
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LANCHOR0+108
	.word	.LANCHOR2
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r2, #6
	mov	r0, #0
	mov	r1, #0
	mov	r6, #0
	mov	r7, #2
	mov	r8, #4
	mov	lr, #0
	mov	r4, #0
	mov	r5, #4
	ldr	r3, .L20
.L17:
	add	ip, r2, #1
	strb	r2, [r3, #44]
	and	r2, ip, #255
	cmp	r2, #22
	stm	r3, {r0-r1}
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r6, [r3, #16]
	str	r7, [r3, #20]
	str	r4, [r3, #24]
	str	r5, [r3, #28]
	str	r8, [r3, #32]
	strb	lr, [r3, #36]
	add	r3, r3, #48
	bne	.L17
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0+432
	.size	initBullets, .-initBullets
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1280
	mov	r1, #7360
	mov	r2, #8
	mov	r3, #5
	push	{r4, r5, r6, lr}
	ldr	r4, .L24
	stm	r4, {r0, r1}
	mov	r1, #1
	str	r2, [r4, #24]
	str	r2, [r4, #28]
	add	r2, r4, #56
	mov	r5, #0
	mov	r0, #4
	str	r3, [r4, #32]
	str	r2, [r4, #44]
	str	r3, [r4, #92]
	mov	r2, #7
	str	r3, [r4, #100]
	mov	r3, #256
	str	r1, [r4, #48]
	ldr	r1, .L24+4
	str	r0, [r4, #16]
	str	r1, [r4, #96]
	str	r2, [r4, #20]
	strh	r3, [r4, #52]	@ movhi
	str	r5, [r4, #8]
	str	r5, [r4, #12]
	strb	r5, [r4, #36]
	str	r5, [r4, #40]
	str	r5, [r4, #64]
	str	r5, [r4, #68]
	str	r5, [r4, #72]
	str	r5, [r4, #76]
	str	r5, [r4, #80]
	str	r5, [r4, #84]
	str	r5, [r4, #88]
	strb	r5, [r4, #104]
	bl	initEnemies
	bl	initBullets
	str	r5, [r4, #1200]
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	initGame, .-initGame
	.align	2
	.global	updateEnvironment
	.syntax unified
	.arm
	.type	updateEnvironment, %function
updateEnvironment:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L27
	ldr	r2, [r0, #1200]
	cmp	r2, #0
	movge	r3, r2
	mov	ip, #83886080
	addlt	r3, r2, #15
	asr	r3, r3, #4
	add	r2, r2, #1
	str	r2, [r0, #1200]
	rsbs	r2, r3, #0
	ldr	r1, .L27+4
	and	r2, r2, #7
	and	r3, r3, #7
	rsbpl	r3, r2, #0
	add	r3, r1, r3, lsl #2
	ldr	r3, [r3, #128]
	strh	r3, [ip, #22]	@ movhi
	bx	lr
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.word	.LANCHOR2
	.size	updateEnvironment, .-updateEnvironment
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
	ldr	r1, .L36
	ldm	r1, {r2, r3}
	asr	r2, r2, #4
	subs	r2, r2, #120
	movmi	r2, #0
	asr	r3, r3, #4
	movmi	ip, r2
	sub	r3, r3, #80
	bmi	.L30
	cmp	r2, #272
	movgt	r2, #272
	movgt	ip, r2
	lslle	ip, r2, #16
	lsrle	ip, ip, #16
.L30:
	cmp	r3, #0
	movlt	r3, #0
	str	r2, [r1, #1204]
	movlt	r0, r3
	blt	.L31
	cmp	r3, #352
	movgt	r3, #352
	movgt	r0, r3
	lslle	r0, r3, #16
	lsrle	r0, r0, #16
.L31:
	mov	r2, #67108864
	str	r3, [r1, #1208]
	strh	ip, [r2, #20]	@ movhi
	strh	r0, [r2, #22]	@ movhi
	strh	ip, [r2, #24]	@ movhi
	strh	r0, [r2, #26]	@ movhi
	strh	ip, [r2, #28]	@ movhi
	strh	r0, [r2, #30]	@ movhi
	bx	lr
.L37:
	.align	2
.L36:
	.word	.LANCHOR0
	.size	updateCamera, .-updateCamera
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L108+8
	ldr	r3, [r4, #32]
	sub	r3, r3, #1
	cmp	r3, #0
	sub	sp, sp, #12
	ldrb	r1, [r4, #52]	@ zero_extendqisi2
	str	r3, [r4, #32]
	ble	.L105
.L39:
	cmp	r1, #3
	beq	.L38
.L44:
	mov	r2, #0
	ldr	r3, .L108+12
	ldrh	r3, [r3]
	tst	r3, #64
	mvneq	r0, #9
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	moveq	r2, #3
	streq	r0, [r4, #12]
	strbeq	r2, [r4, #36]
	tst	r3, #128
	moveq	r0, #2
	ldreq	r2, [r4, #12]
	addeq	r2, r2, #10
	strbeq	r0, [r4, #36]
	streq	r2, [r4, #12]
	ands	r2, r3, #32
	mvneq	r0, #9
	strbeq	r2, [r4, #36]
	streq	r0, [r4, #8]
	tst	r3, #16
	moveq	r0, #1
	ldreq	r2, [r4, #8]
	addeq	r2, r2, #10
	streq	r2, [r4, #8]
	ldr	r2, .L108+16
	ldrh	r2, [r2]
	strbeq	r0, [r4, #36]
	tst	r2, #512
	and	r2, r2, #1
	beq	.L50
	subs	r0, r1, #2
	movne	r0, #1
	bics	r0, r0, r3, lsr #9
	bne	.L106
.L50:
	cmp	r2, #0
	bne	.L107
.L52:
	cmp	r1, #2
	beq	.L53
	ldr	r3, [r4, #8]
.L51:
	ldr	r1, [r4]
	add	r6, r4, #20
	ldr	r2, [r4, #4]
	ldr	r5, [r4, #16]
	ldm	r6, {r6, r8}
	add	r3, r3, r1
	add	r5, r5, r3, asr #4
	add	r6, r6, r2, asr #4
	mov	r1, r6
	mov	r2, #10
	mov	r0, r5
	ldr	r7, .L108+20
	ldr	r9, [r4, #28]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L54
.L56:
	mov	r3, #0
	str	r3, [r4, #8]
.L55:
	ldr	r1, [r4, #12]
	ldr	r3, [r4, #4]
	ldr	r2, [r4]
	ldr	r5, [r4, #16]
	add	r3, r3, r1
	ldr	r1, [r4, #20]
	add	r5, r5, r2, asr #4
	add	r1, r1, r3, asr #4
	mov	r2, #10
	mov	r0, r5
	mov	r8, r1
	ldr	r6, [r4, #24]
	ldr	r9, [r4, #28]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L57
.L59:
	mov	r3, #0
	str	r3, [r4, #12]
.L58:
	ldr	r2, [r4]
	ldr	r5, [r4, #16]
	ldr	r3, [r4, #4]
	ldr	r6, [r4, #20]
	add	r5, r5, r2, asr #4
	add	r6, r6, r3, asr #4
	mov	r1, r6
	mov	r0, r5
	ldr	r7, .L108+24
	add	r8, r4, #24
	ldm	r8, {r8, r9}
	mov	lr, pc
	bx	r7
	cmp	r0, #2
	beq	.L61
	add	r3, r8, r5
	sub	r8, r3, #1
	mov	r1, r6
	mov	r0, r8
	mov	lr, pc
	bx	r7
	cmp	r0, #2
	beq	.L61
	add	r6, r9, r6
	mov	r0, r5
	sub	r1, r6, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #2
	beq	.L61
	mov	r0, r8
	sub	r1, r6, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #2
	beq	.L61
	ldr	r0, [r4, #8]
	cmp	r0, #0
	ldr	r6, [r4, #4]
	ldr	r7, [r4, #12]
	ldrb	r5, [r4, #52]	@ zero_extendqisi2
	beq	.L62
	cmp	r7, #0
	ldr	r10, [r4]
	beq	.L63
	ldr	fp, .L108+28
	mov	lr, pc
	bx	fp
	ldr	ip, .L108+32
	adr	r3, .L108
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r10
	mov	r9, r1
	mov	lr, pc
	bx	fp
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	ldr	r9, .L108+36
	mov	lr, pc
	bx	r9
	mov	r10, fp
	ldr	fp, .L108+40
	mov	lr, pc
	bx	fp
	str	r0, [r4]
	mov	r0, r7
	mov	lr, pc
	bx	r10
	adr	r3, .L108
	ldmia	r3, {r2-r3}
	ldr	ip, .L108+32
	mov	lr, pc
	bx	ip
	mov	r7, r0
	mov	r0, r6
	mov	r8, r1
	mov	lr, pc
	bx	r10
	mov	r2, r0
	mov	r3, r1
	mov	r0, r7
	mov	r1, r8
	mov	lr, pc
	bx	r9
	mov	lr, pc
	bx	fp
	cmp	r5, #2
	str	r0, [r4, #4]
	beq	.L38
.L64:
	mov	r2, #1
	mov	r3, #5
	ldr	r1, .L108+44
	strb	r2, [r4, #52]
	str	r1, [r4, #44]
	str	r3, [r4, #48]
.L38:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L107:
	ands	r3, r3, #1
	bne	.L52
	cmp	r1, #2
	beq	.L53
	ldr	r2, .L108+48
	str	r2, [r4, #96]
	add	r2, r2, #40
	mov	r1, #6
	mov	r0, #3
	mov	ip, #5
	str	r3, [r4, #40]
	str	r2, [r4, #44]
	mov	r3, #1
	mov	r2, #4
	str	ip, [r4, #100]
	strb	r0, [r4, #52]
	str	r2, [r4, #48]
	str	r1, [r4, #32]
	str	r3, [r4, #64]
	str	r1, [r4, #92]
	b	.L38
.L61:
	mov	r3, #1
	str	r3, [r4, #1212]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L105:
	mov	r2, #6
	ldr	r3, [r4, #40]
	ldr	r0, [r4, #48]
	add	r3, r3, #1
	cmp	r3, r0
	str	r3, [r4, #40]
	str	r2, [r4, #32]
	blt	.L39
	sub	r3, r1, #2
	cmp	r3, #1
	movls	r2, #1
	mov	r3, #0
	addls	r1, r4, #56
	strls	r1, [r4, #44]
	strbls	r3, [r4, #52]
	movls	r1, r3
	strls	r2, [r4, #48]
	strls	r3, [r4, #64]
	str	r3, [r4, #40]
	b	.L44
.L106:
	mov	r0, #2
	mov	r1, #5
	mov	r2, #0
	mov	r3, #6
	ldr	ip, .L108+52
	strb	r0, [r4, #52]
	str	ip, [r4, #44]
	str	r1, [r4, #48]
	str	r2, [r4, #40]
	str	r3, [r4, #32]
.L53:
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	add	r3, r3, r3, lsl #1
	add	r2, r2, r2, lsl #1
	add	r3, r3, r3, lsr #31
	add	r2, r2, r2, lsr #31
	asr	r3, r3, #1
	asr	r2, r2, #1
	str	r3, [r4, #8]
	str	r2, [r4, #12]
	b	.L51
.L57:
	add	r6, r6, r5
	mov	r2, #10
	mov	r1, r8
	sub	r0, r6, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L59
	add	r1, r9, r8
	sub	r1, r1, #1
	mov	r0, r5
	mov	r2, #10
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldr	r1, [sp, #4]
	bne	.L59
	mov	r2, #10
	sub	r0, r6, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L59
	b	.L58
.L54:
	add	r3, r8, r5
	mov	r2, #10
	mov	r1, r6
	sub	r0, r3, #1
	sub	r8, r3, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L56
	add	r6, r9, r6
	mov	r0, r5
	mov	r2, #10
	sub	r1, r6, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L56
	mov	r2, #10
	mov	r0, r8
	sub	r1, r6, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L56
	b	.L55
.L62:
	add	r3, r6, r7
	cmp	r5, #2
	str	r3, [r4, #4]
	beq	.L38
	cmp	r7, #0
	bne	.L64
	mov	r3, #1
	ldr	r2, .L108+56
	strb	r7, [r4, #52]
	str	r2, [r4, #44]
	str	r7, [r4, #40]
	str	r3, [r4, #48]
	b	.L38
.L63:
	add	r0, r0, r10
	cmp	r5, #2
	str	r0, [r4]
	bne	.L64
	b	.L38
.L109:
	.align	3
.L108:
	.word	1717986918
	.word	1073112678
	.word	.LANCHOR0
	.word	buttons
	.word	oldButtons
	.word	mapCollide
	.word	colorAt
	.word	__aeabi_i2d
	.word	__aeabi_ddiv
	.word	__aeabi_dadd
	.word	__aeabi_d2iz
	.word	.LANCHOR1+56
	.word	.LANCHOR1
	.word	.LANCHOR1+16
	.word	.LANCHOR0+56
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	attack
	.syntax unified
	.arm
	.type	attack, %function
attack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L116
	ldrb	r2, [r3, #52]	@ zero_extendqisi2
	sub	r2, r2, #2
	cmp	r2, #1
	bxls	lr
	ldr	r2, .L116+4
	str	lr, [sp, #-4]!
	str	r2, [r3, #96]
	add	r2, r2, #40
	str	r2, [r3, #44]
	mov	r2, #1
	mov	lr, #3
	mov	r1, #6
	mov	ip, #4
	mov	r0, #0
	str	r2, [r3, #64]
	mov	r2, #5
	strb	lr, [r3, #52]
	str	ip, [r3, #48]
	str	r0, [r3, #40]
	str	r1, [r3, #32]
	str	r1, [r3, #92]
	str	r2, [r3, #100]
	ldr	lr, [sp], #4
	bx	lr
.L117:
	.align	2
.L116:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	attack, .-attack
	.align	2
	.global	spawnBullet
	.syntax unified
	.arm
	.type	spawnBullet, %function
spawnBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	ip, r3
	push	{r4, r5, lr}
	mov	r5, r1
	ldr	r1, .L128
	mov	r4, r2
	add	r2, r1, #432
.L124:
	ldr	lr, [r2, r3, lsl #2]
	cmp	lr, #0
	add	r3, r3, #12
	beq	.L127
	add	ip, ip, #1
	cmp	ip, #16
	bne	.L124
.L118:
	pop	{r4, r5, lr}
	bx	lr
.L127:
	mov	r2, #1
	add	ip, ip, ip, lsl #1
	add	r3, r1, ip, lsl #4
	cmp	r4, #0
	add	r1, r0, #96
	str	r1, [r3, #436]
	str	r2, [r3, #432]
	mov	r1, #180
	mvneq	r2, #7
	add	r0, r5, #96
	str	lr, [r3, #444]
	str	r0, [r3, #440]
	str	lr, [r3, #448]
	strb	r4, [r3, #468]
	str	r1, [r3, #472]
	streq	r2, [r3, #444]
	beq	.L118
	cmp	r4, #1
	moveq	r2, #8
	streq	r2, [r3, #444]
	beq	.L118
	cmp	r4, #3
	mvneq	r2, #7
	movne	r2, #8
	pop	{r4, r5, lr}
	str	r2, [r3, #448]
	bx	lr
.L129:
	.align	2
.L128:
	.word	.LANCHOR0
	.size	spawnBullet, .-spawnBullet
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, r0
	mov	lr, #0
	ldrb	r2, [r0, #64]	@ zero_extendqisi2
	cmp	r2, #3
	sub	sp, sp, #16
	ldr	r1, [r3, #8]
	str	lr, [r0, #12]
	str	lr, [r0, #16]
	ldr	r0, [r0, #4]
	beq	.L147
	ldr	r2, .L151
	sub	r2, r3, r2
	asr	r2, r2, #4
	add	ip, r2, r2, lsl #1
	add	ip, ip, ip, lsl #4
	add	ip, ip, ip, lsl #8
	add	ip, ip, ip, lsl #16
	ldr	r5, [r3, #68]
	add	r2, r2, ip, lsl #2
	ldr	r4, .L151+4
	add	r2, r5, r2, lsl #2
	ldr	ip, [r4, r2, lsl #3]
	sub	ip, ip, r0, asr #4
	add	r6, ip, #2
	cmp	r6, #4
	bls	.L148
.L133:
	cmp	ip, #0
	movge	r2, #6
	mvnlt	r2, #5
	mvn	ip, ip
	str	r2, [r3, #12]
	lsr	ip, ip, #31
.L138:
	mov	lr, #1
	mov	r2, #5
	strb	ip, [r3, #48]
	ldr	ip, .L151+8
	strb	lr, [r3, #64]
	str	ip, [r3, #56]
	str	r2, [r3, #60]
.L132:
	ldr	r2, [r3, #44]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #44]
	ble	.L140
	ldr	ip, [r3, #12]
	ldr	r2, [r3, #16]
	add	r0, r0, ip
	add	r1, r1, r2
.L135:
	stmib	r3, {r0, r1}
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L148:
	add	r4, r4, r2, lsl #3
	ldr	r2, [r4, #4]
	sub	r2, r2, r1, asr #4
	add	r4, r2, #2
	cmp	r4, #4
	bls	.L149
	cmp	ip, #0
	bne	.L133
	cmp	r2, #0
	movge	r2, #6
	mvnlt	r2, #5
	movge	ip, #2
	movlt	ip, #3
	str	r2, [r3, #16]
	b	.L138
.L140:
	mov	ip, #6
	ldr	r2, [r3, #52]
	ldr	lr, [r3, #60]
	add	r2, r2, #1
	str	r2, [r3, #52]
	cmp	r2, lr
	ldr	r2, [r3, #12]
	add	r0, r0, r2
	ldr	r2, [r3, #16]
	str	ip, [r3, #44]
	add	r1, r1, r2
	blt	.L135
	ldrb	r2, [r3, #64]	@ zero_extendqisi2
	cmp	r2, #3
	beq	.L150
.L142:
	mov	r2, #0
	stmib	r3, {r0, r1}
	str	r2, [r3, #52]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L147:
	mov	r2, #7
	ldr	lr, [r3, #72]
	ldr	ip, .L151+12
	cmp	lr, #0
	str	ip, [r3, #56]
	str	r2, [r3, #60]
	bne	.L132
	ldr	r2, [r3, #52]
	cmp	r2, #2
	ble	.L132
	ldrb	r2, [r3, #48]	@ zero_extendqisi2
	str	r1, [sp, #12]
	str	r0, [sp, #8]
	str	r3, [sp, #4]
	bl	spawnBullet
	mov	r2, #1
	ldr	r3, [sp, #4]
	add	r0, sp, #8
	str	r2, [r3, #72]
	ldm	r0, {r0, r1}
	b	.L132
.L149:
	add	r2, r5, #1
	and	r2, r2, #3
	str	r2, [r3, #68]
	mov	r2, #3
	mov	r4, #4
	mov	ip, #7
	strb	r2, [r3, #64]
	ldr	r2, .L151+12
	stmib	r3, {r0, r1}
	str	lr, [r3, #52]
	str	lr, [r3, #72]
	str	r4, [r3, #44]
	str	ip, [r3, #60]
	str	r2, [r3, #56]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L150:
	ldr	ip, .L151+16
	mov	r2, #0
	str	ip, [r3, #56]
	mov	ip, #1
	strb	r2, [r3, #64]
	str	r2, [r3, #72]
	str	ip, [r3, #60]
	b	.L142
.L152:
	.align	2
.L151:
	.word	.LANCHOR0+108
	.word	.LANCHOR2
	.word	.LANCHOR1+108
	.word	.LANCHOR1+80
	.word	.LANCHOR0+428
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L161
	add	r5, r4, #320
.L155:
	ldr	r3, [r4]
	cmp	r3, #0
	movne	r0, r4
	blne	updateEnemy
.L154:
	add	r4, r4, #80
	cmp	r4, r5
	bne	.L155
	pop	{r4, r5, r6, lr}
	bx	lr
.L162:
	.align	2
.L161:
	.word	.LANCHOR0+108
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #0
	ldr	r4, .L174
	ldr	r7, .L174+4
	add	r6, r4, #768
.L171:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L165
	ldr	r3, [r4, #40]
	add	r1, r4, #8
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #16]
	sub	r3, r3, #1
	add	r2, r2, ip
	add	r1, r1, r0
	cmp	r3, #0
	str	r2, [r4, #4]
	str	r1, [r4, #8]
	str	r3, [r4, #40]
	ble	.L169
	ldr	r9, [r4, #20]
	ldr	r5, [r4, #28]
	add	r9, r9, r2, asr #4
	add	r5, r9, r5
	sub	r5, r5, #1
	cmp	r5, #512
	movlt	r3, #0
	movge	r3, #1
	orrs	r3, r3, r9, lsr #31
	bne	.L169
	ldr	fp, [r4, #24]
	ldr	r10, [r4, #32]
	add	fp, fp, r1, asr #4
	add	r10, fp, r10
	sub	r10, r10, #1
	cmp	r10, #512
	movlt	r3, #0
	movge	r3, #1
	orrs	r3, r3, fp, lsr #31
	bne	.L169
	mov	r2, #2
	mov	r1, fp
	mov	r0, r9
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L168
.L169:
	str	r8, [r4]
.L165:
	add	r4, r4, #48
	cmp	r4, r6
	bne	.L171
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L168:
	mov	r1, fp
	mov	r2, #2
	mov	r0, r5
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L169
	mov	r0, r9
	mov	r2, #2
	mov	r1, r10
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L169
	mov	r1, r10
	mov	r0, r5
	mov	r2, #2
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L169
	b	.L165
.L175:
	.align	2
.L174:
	.word	.LANCHOR0+432
	.word	mapCollide
	.size	updateBullets, .-updateBullets
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"Player hit by bullet!\000"
	.align	2
.LC2:
	.ascii	"Enemy hit!\000"
	.align	2
.LC3:
	.ascii	"Player hit!\000"
	.text
	.align	2
	.global	checkEntityCollisions
	.syntax unified
	.arm
	.type	checkEntityCollisions, %function
checkEntityCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L217
	ldr	r0, .L217+4
	ldm	r5, {r6, r9}
	ldrb	r3, [r5, #36]	@ zero_extendqisi2
	sub	sp, sp, #44
	asr	r6, r6, #4
	asr	r9, r9, #4
	cmp	r3, #3
	bhi	.L177
	ldrb	r3, [r0, r3]
	add	pc, pc, r3, lsl #2
.Lrtx179:
	nop
	.section	.rodata
.L179:
	.byte	(.L182-.Lrtx179-4)/4
	.byte	(.L181-.Lrtx179-4)/4
	.byte	(.L180-.Lrtx179-4)/4
	.byte	(.L178-.Lrtx179-4)/4
	.text
	.p2align 2
.L180:
	mov	r3, #8
	mov	r2, r6
	mov	r1, #16
	str	r3, [sp, #24]
	add	fp, r9, #12
.L177:
	ldrb	r3, [r5, #52]	@ zero_extendqisi2
	sub	r3, r3, #2
	tst	r3, #253
	ldr	r3, [r5, #16]
	add	r6, r6, r3
	ldr	r3, [r5, #20]
	ldr	r0, [r5, #28]
	add	r9, r9, r3
	ldr	r3, [r5, #24]
	add	r0, r9, r0
	str	r0, [sp, #20]
	add	r3, r6, r3
	beq	.L183
	ldr	r4, .L217+8
	ldr	r8, .L217+12
	ldr	r10, .L217+16
	str	r2, [sp, #28]
	str	r1, [sp, #32]
	str	r3, [sp, #36]
	add	r7, r4, #768
	b	.L187
.L185:
	add	r4, r4, #48
	cmp	r4, r7
	beq	.L214
.L187:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L185
	ldr	r1, [r4, #32]
	ldr	r0, [r4, #8]
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #4]
	str	r1, [sp, #12]
	add	r3, r3, r0, asr #4
	ldr	r1, [r4, #28]
	str	r3, [sp, #4]
	ldr	r3, [r4, #20]
	add	r3, r3, r2, asr #4
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r5, #24
	mov	r1, r9
	mov	r0, r6
	ldm	r2, {r2, r3}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L185
	mov	r3, #0
	str	r3, [r4]
	ldr	r3, [r5, #1216]
	sub	r3, r3, #1
	mov	r0, #15
	str	r3, [r5, #1216]
	ldr	r3, .L217+20
	mov	lr, pc
	bx	r3
	add	r4, r4, #48
	ldr	r0, .L217+24
	mov	lr, pc
	bx	r10
	cmp	r4, r7
	bne	.L187
.L214:
	add	r1, sp, #32
	ldr	r2, [sp, #28]
	ldm	r1, {r1, r3}
.L183:
	mov	r7, #0
	ldr	r4, .L217+28
	add	r8, r2, r1
.L191:
	ldr	r1, [r4]
	cmp	r1, #0
	beq	.L188
	ldmib	r4, {r0, lr}
	ldr	r1, [r4, #20]
	ldr	ip, [r4, #28]
	add	r1, r1, r0, asr #4
	add	ip, r1, ip
	cmp	ip, r2
	ble	.L189
	cmp	r1, r8
	bge	.L189
	ldr	r0, [r4, #24]
	ldr	r10, [r4, #32]
	add	r0, r0, lr, asr #4
	add	r10, r0, r10
	cmp	r10, fp
	bgt	.L215
.L189:
	ldrb	r0, [r5, #52]	@ zero_extendqisi2
	sub	r0, r0, #2
	and	r0, r0, #253
	cmp	r0, #0
	cmpne	r1, r3
	movlt	r1, #1
	movge	r1, #0
	cmp	ip, r6
	movle	r1, #0
	andgt	r1, r1, #1
	cmp	r1, #0
	bne	.L216
.L188:
	add	r7, r7, #1
	cmp	r7, #4
	add	r4, r4, #80
	bne	.L191
.L176:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L215:
	ldr	r10, [sp, #24]
	add	r10, fp, r10
	cmp	r0, r10
	bge	.L189
	ldr	r0, [r5, #64]
	cmp	r0, #0
	beq	.L189
	ldr	r0, .L217+32
	ldr	r3, .L217+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L217+20
	mov	r0, #4
	mov	lr, pc
	bx	r3
	mov	r3, #0
	add	r7, r7, r7, lsl #2
	add	r5, r5, r7, lsl #4
	str	r3, [r5, #108]
	b	.L176
.L178:
	mov	r3, #8
	mov	r2, r6
	mov	r1, #16
	str	r3, [sp, #24]
	sub	fp, r9, #4
	b	.L177
.L181:
	mov	r3, #16
	mov	fp, r9
	mov	r1, #8
	str	r3, [sp, #24]
	add	r2, r6, #12
	b	.L177
.L182:
	mov	r3, #16
	mov	fp, r9
	mov	r1, #8
	str	r3, [sp, #24]
	sub	r2, r6, #4
	b	.L177
.L216:
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #32]
	add	r0, r0, lr, asr #4
	add	r1, r0, r1
	ldr	ip, [sp, #20]
	cmp	r1, r9
	movle	r1, #0
	movgt	r1, #1
	cmp	r0, ip
	movge	r1, #0
	cmp	r1, #0
	beq	.L188
	ldr	r0, .L217+36
	ldr	r1, .L217+16
	str	r3, [sp, #32]
	str	r2, [sp, #28]
	mov	lr, pc
	bx	r1
	ldr	r1, .L217+20
	mov	r0, #15
	mov	lr, pc
	bx	r1
	ldr	r1, [r5, #1216]
	add	r2, sp, #28
	sub	r1, r1, #1
	str	r1, [r5, #1216]
	ldm	r2, {r2, r3}
	b	.L188
.L218:
	.align	2
.L217:
	.word	.LANCHOR0
	.word	.L179
	.word	.LANCHOR0+432
	.word	hitboxCollide
	.word	mgba_printf
	.word	playAnalogSound
	.word	.LC1
	.word	.LANCHOR0+108
	.word	.LC2
	.word	.LC3
	.size	checkEntityCollisions, .-checkEntityCollisions
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r4, .L227
	add	r5, r4, #320
.L221:
	ldr	r3, [r4]
	cmp	r3, #0
	movne	r0, r4
	blne	updateEnemy
.L220:
	add	r4, r4, #80
	cmp	r4, r5
	bne	.L221
	bl	updateBullets
	bl	updateCamera
	bl	checkEntityCollisions
	ldr	r0, .L227+4
	ldr	r2, [r0, #1200]
	cmp	r2, #0
	movge	r3, r2
	mov	ip, #83886080
	addlt	r3, r2, #15
	asr	r3, r3, #4
	add	r2, r2, #1
	str	r2, [r0, #1200]
	rsbs	r2, r3, #0
	ldr	r1, .L227+8
	and	r2, r2, #7
	and	r3, r3, #7
	rsbpl	r3, r2, #0
	add	r3, r1, r3, lsl #2
	ldr	r3, [r3, #128]
	pop	{r4, r5, r6, lr}
	strh	r3, [ip, #22]	@ movhi
	bx	lr
.L228:
	.align	2
.L227:
	.word	.LANCHOR0+108
	.word	.LANCHOR0
	.word	.LANCHOR2
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L251
	ldr	ip, [r2, #1208]
	ldr	lr, [r2, #1204]
	ldr	r7, [r2, #40]
	ldr	r3, [r2, #44]
	ldr	r8, [r2, #4]
	ldr	r9, [r2]
	lsl	ip, ip, #16
	lsl	lr, lr, #16
	ldrb	r4, [r2, #53]	@ zero_extendqisi2
	ldr	r3, [r3, r7, lsl #2]
	ldrb	r0, [r2, #36]	@ zero_extendqisi2
	lsr	ip, ip, #16
	lsr	lr, lr, #16
	ldr	r5, .L251+4
	rsb	r6, ip, r8, asr #4
	rsb	r1, lr, r9, asr #4
	and	r6, r6, #255
	lsl	r10, r4, #3
	lsl	r3, r3, #16
	lsl	r1, r1, #23
	cmp	r0, #1
	sub	sp, sp, #12
	lsr	r3, r3, #16
	strh	r6, [r5, r10]	@ movhi
	lsr	r1, r1, #23
	ldr	r6, [r2, #64]
	add	r4, r5, r4, lsl #3
	beq	.L249
	orr	r1, r1, #16384
	cmp	r0, #0
	strh	r1, [r4, #2]	@ movhi
	bne	.L233
	lsl	r3, r3, #22
	lsr	r3, r3, #22
	orr	r3, r3, #2048
	cmp	r6, #0
	strh	r3, [r4, #4]	@ movhi
	beq	.L234
	ldr	r1, [r2, #96]
	ldr	r1, [r1, r7, lsl #2]
	ldr	r3, .L251+8
	lsl	r1, r1, #22
	add	r3, r3, r7, lsl #3
	lsr	r1, r1, #22
	str	r1, [sp, #4]
	ldr	r1, [r3, #160]
	ldr	r3, [r3, #164]
	add	r3, r3, r8, asr #4
	str	r3, [sp]
	add	fp, r1, r9, asr #4
.L237:
	ldr	r1, [sp]
	sub	r3, fp, lr
	sub	r1, r1, ip
	lsl	r3, r3, #23
	ldrb	r2, [r2, #104]	@ zero_extendqisi2
	orr	r0, r0, r3, lsr #23
	and	r3, r1, #255
	ldr	r1, [sp, #4]
	add	ip, r5, r2, lsl #3
	orr	r0, r0, #16384
	orr	r1, r1, #2048
	lsl	r2, r2, #3
	strh	r0, [ip, #2]	@ movhi
	strh	r3, [r5, r2]	@ movhi
	strh	r1, [ip, #4]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L249:
	lsl	r3, r3, #22
	lsr	r3, r3, #22
	orr	r1, r1, #20480
	orr	r3, r3, #2048
	cmp	r6, #0
	strh	r1, [r4, #2]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	bne	.L231
.L234:
	mov	r1, #512
	ldrb	r3, [r2, #104]	@ zero_extendqisi2
	lsl	r3, r3, #3
	strh	r1, [r5, r3]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L231:
	ldr	r1, [r2, #96]
	ldr	r1, [r1, r7, lsl #2]
	ldr	r3, .L251+8
	lsl	r1, r1, #22
	add	r3, r3, r7, lsl #3
	lsr	r1, r1, #22
	str	r1, [sp, #4]
	ldr	r1, [r3, #160]
	ldr	r3, [r3, #164]
	add	r3, r3, r8, asr #4
	mov	r0, #4096
	str	r3, [sp]
	rsb	fp, r1, r9, asr #4
	b	.L237
.L233:
	ldr	r1, .L251+12
	cmp	r6, #0
	sub	r6, r0, #1
	add	r3, r3, r6, lsl #7
	and	r3, r3, r1
	orr	r3, r3, #2048
	strh	r3, [r4, #4]	@ movhi
	beq	.L234
	cmp	r0, #3
	beq	.L236
	bhi	.L250
	ldr	r0, [r2, #96]
	ldr	r0, [r0, r7, lsl #2]
	ldr	r3, .L251+8
	add	r0, r0, #128
	and	r1, r0, r1
	add	r3, r3, r7, lsl #3
	str	r1, [sp, #4]
	ldr	r1, [r3, #192]
	ldr	r3, [r3, #196]
	add	r3, r3, r8, asr #4
	mov	r0, #0
	str	r3, [sp]
	add	fp, r1, r9, asr #4
	b	.L237
.L236:
	ldr	r0, [r2, #96]
	ldr	r0, [r0, r7, lsl #2]
	ldr	r3, .L251+8
	add	r0, r0, #256
	and	r1, r0, r1
	add	r3, r3, r7, lsl #3
	str	r1, [sp, #4]
	ldr	r1, [r3, #224]
	ldr	r3, [r3, #228]
	add	r3, r3, r8, asr #4
	mov	r0, #0
	str	r3, [sp]
	add	fp, r1, r9, asr #4
	b	.L237
.L250:
	mov	r0, #0
	b	.L237
.L252:
	.align	2
.L251:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	.LANCHOR2
	.word	1023
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L262
	ldr	r6, .L262+4
	ldr	r8, .L262+8
	sub	sp, sp, #8
	add	r7, r4, #320
	sub	r5, r4, #108
.L259:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L256
	mov	r3, #16
	ldr	r1, [r4, #8]
	ldr	r2, [r5, #1208]
	ldr	r0, [r4, #4]
	rsb	r2, r2, r1, asr #4
	ldr	r1, [r5, #1204]
	rsb	r1, r1, r0, asr #4
	ldrb	r0, [r4, #76]	@ zero_extendqisi2
	str	r3, [sp]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L256
	add	r1, r4, #52
	ldm	r1, {r1, r3}
	ldr	r3, [r3, r1, lsl #2]
	ldr	r2, [r4, #8]
	ldr	r0, [r5, #1208]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	rsb	r0, r0, r2, asr #4
	add	r2, r3, #384
	lsl	r2, r2, #22
	lsr	r2, r2, #22
	ldr	lr, [r4, #4]
	orr	r1, r2, #2048
	ldr	r2, [r5, #1204]
	ldrb	r9, [r4, #48]	@ zero_extendqisi2
	rsb	r2, r2, lr, asr #4
	ldrb	ip, [r4, #76]	@ zero_extendqisi2
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	cmp	r9, #1
	lsl	lr, ip, #3
	and	r0, r0, #255
	orr	r10, r2, #16384
	add	ip, r6, ip, lsl #3
	orreq	r2, r2, #20480
	strh	r0, [r6, lr]	@ movhi
	strheq	r2, [ip, #2]	@ movhi
	beq	.L258
	cmp	r9, #0
	strh	r10, [ip, #2]	@ movhi
	strheq	r1, [ip, #4]	@ movhi
	bne	.L258
.L255:
	add	r4, r4, #80
	cmp	r4, r7
	bne	.L259
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L256:
	mov	r2, #512
	ldrb	r3, [r4, #76]	@ zero_extendqisi2
	lsl	r3, r3, #3
	strh	r2, [r6, r3]	@ movhi
	b	.L255
.L258:
	add	r9, r9, #5
	add	r3, r3, r9, lsl #6
	lsl	r3, r3, #22
	lsr	r3, r3, #22
	add	lr, r6, lr
	orr	r3, r3, #2048
	strh	r3, [lr, #4]	@ movhi
	b	.L255
.L263:
	.align	2
.L262:
	.word	.LANCHOR0+108
	.word	shadowOAM
	.word	clipSpritesOffScreen
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	drawBullets
	.syntax unified
	.arm
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L274
	ldr	r6, .L274+4
	ldr	r8, .L274+8
	ldr	r9, .L274+12
	sub	sp, sp, #8
	add	r7, r4, #768
	sub	r5, r4, #432
	b	.L270
.L265:
	mov	r3, #8
	ldr	lr, [r4, #8]
	ldr	r2, [r5, #1208]
	ldr	ip, [r4, #4]
	ldr	r1, [r5, #1204]
	ldrb	r0, [r4, #44]	@ zero_extendqisi2
	rsb	r2, r2, lr, asr #4
	str	r3, [sp]
	rsb	r1, r1, ip, asr #4
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L267
	ldr	r3, [r5, #1204]
	ldr	r10, [r4, #4]
	ldr	r1, [r4, #8]
	ldr	r0, [r5, #1208]
	ldrb	r2, [r4, #36]	@ zero_extendqisi2
	ldrb	lr, [r4, #44]	@ zero_extendqisi2
	rsb	r3, r3, r10, asr #4
	rsb	r0, r0, r1, asr #4
	cmp	r2, #1
	and	r3, r3, r9
	lsl	r1, lr, #3
	and	r0, r0, #255
	add	lr, r6, lr, lsl #3
	orreq	r3, r3, #4096
	ldr	ip, .L274+16
	strh	r0, [r6, r1]	@ movhi
	strheq	r3, [lr, #2]	@ movhi
	beq	.L269
	cmp	r2, #0
	strh	r3, [lr, #2]	@ movhi
	strheq	ip, [lr, #4]	@ movhi
	bne	.L269
.L266:
	add	r4, r4, #48
	cmp	r4, r7
	beq	.L273
.L270:
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L265
.L267:
	mov	r2, #512
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	add	r4, r4, #48
	lsl	r3, r3, #3
	cmp	r4, r7
	strh	r2, [r6, r3]	@ movhi
	bne	.L270
.L273:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L269:
	lsl	r2, r2, #6
	ldr	r3, .L274+20
	add	r2, r2, #344
	add	r2, r2, #2
	and	r3, r2, r3
	add	r1, r6, r1
	orr	r3, r3, #2048
	strh	r3, [r1, #4]	@ movhi
	b	.L266
.L275:
	.align	2
.L274:
	.word	.LANCHOR0+432
	.word	shadowOAM
	.word	clipSpritesOffScreen
	.word	511
	.word	2458
	.word	1022
	.size	drawBullets, .-drawBullets
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L283
	ldr	r2, [r3, #1216]
	cmp	r2, #0
	push	{r4, lr}
	bgt	.L277
	ldr	r3, .L283+4
	ldr	r2, .L283+8
	strh	r2, [r3, #66]	@ movhi
	strh	r2, [r3, #68]	@ movhi
.L278:
	ldr	r3, .L283+8
.L280:
	ldr	r2, .L283+4
	strh	r3, [r2, #70]	@ movhi
	bl	drawPlayer
	bl	drawEnemies
	bl	drawBullets
	ldr	r3, .L283+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L283+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L283+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L277:
	ldr	r3, .L283+24
	ldr	r1, .L283+4
	cmp	r2, #1
	strh	r3, [r1, #66]	@ movhi
	addeq	r3, r3, #1
	strheq	r3, [r1, #68]	@ movhi
	beq	.L278
	cmp	r2, #2
	strh	r3, [r1, #68]	@ movhi
	bne	.L280
	b	.L278
.L284:
	.align	2
.L283:
	.word	.LANCHOR0
	.word	100702208
	.word	8194
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	8193
	.size	drawGame, .-drawGame
	.align	2
	.global	drawHUD
	.syntax unified
	.arm
	.type	drawHUD, %function
drawHUD:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L291
	ldr	r2, [r3, #1216]
	cmp	r2, #0
	bgt	.L286
	ldr	r3, .L291+4
	ldr	r2, .L291+8
	strh	r2, [r3, #66]	@ movhi
	strh	r2, [r3, #68]	@ movhi
.L287:
	ldr	r3, .L291+8
.L289:
	ldr	r2, .L291+4
	strh	r3, [r2, #70]	@ movhi
	bx	lr
.L286:
	ldr	r3, .L291+12
	ldr	r1, .L291+4
	cmp	r2, #1
	strh	r3, [r1, #66]	@ movhi
	addeq	r3, r3, #1
	strheq	r3, [r1, #68]	@ movhi
	beq	.L287
	cmp	r2, #2
	strh	r3, [r1, #68]	@ movhi
	bne	.L289
	b	.L287
.L292:
	.align	2
.L291:
	.word	.LANCHOR0
	.word	100702208
	.word	8194
	.word	8193
	.size	drawHUD, .-drawHUD
	.global	waterColor
	.global	vOff
	.global	hOff
	.global	winFlag
	.global	lives
	.global	bullets
	.global	enemies
	.global	sword
	.global	player
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	swordFrames, %object
	.size	swordFrames, 16
swordFrames:
	.word	74
	.word	76
	.word	78
	.word	80
	.type	playerDodgeFrames, %object
	.size	playerDodgeFrames, 24
playerDodgeFrames:
	.word	14
	.word	16
	.word	18
	.word	20
	.word	22
	.word	24
	.type	playerAttackFrames, %object
	.size	playerAttackFrames, 16
playerAttackFrames:
	.word	64
	.word	66
	.word	68
	.word	70
	.type	playerWalkFrames, %object
	.size	playerWalkFrames, 24
playerWalkFrames:
	.word	2
	.word	4
	.word	6
	.word	8
	.word	10
	.word	12
	.type	enemyAttackFrames, %object
	.size	enemyAttackFrames, 28
enemyAttackFrames:
	.word	12
	.word	14
	.word	16
	.word	18
	.word	20
	.word	22
	.word	24
	.type	enemyWalkFrames, %object
	.size	enemyWalkFrames, 20
enemyWalkFrames:
	.word	2
	.word	4
	.word	6
	.word	8
	.word	10
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	player, %object
	.size	player, 56
player:
	.space	56
	.type	playerIdleFrames, %object
	.size	playerIdleFrames, 4
playerIdleFrames:
	.space	4
	.space	4
	.type	sword, %object
	.size	sword, 44
sword:
	.space	44
	.type	enemies, %object
	.size	enemies, 320
enemies:
	.space	320
	.type	enemyIdleFrames, %object
	.size	enemyIdleFrames, 4
enemyIdleFrames:
	.space	4
	.type	bullets, %object
	.size	bullets, 768
bullets:
	.space	768
	.type	waterColor, %object
	.size	waterColor, 4
waterColor:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	winFlag, %object
	.size	winFlag, 4
winFlag:
	.space	4
	.type	lives, %object
	.size	lives, 4
lives:
	.space	4
	.section	.rodata
	.align	3
	.set	.LANCHOR2,. + 0
	.type	enemyPatrolPoints, %object
	.size	enemyPatrolPoints, 128
enemyPatrolPoints:
	.word	176
	.word	416
	.word	232
	.word	416
	.word	232
	.word	472
	.word	176
	.word	472
	.word	348
	.word	408
	.word	392
	.word	408
	.word	392
	.word	456
	.word	348
	.word	456
	.word	384
	.word	368
	.word	472
	.word	368
	.word	472
	.word	400
	.word	384
	.word	400
	.word	184
	.word	232
	.word	232
	.word	232
	.word	232
	.word	288
	.word	184
	.word	288
	.type	waterColorUpdate, %object
	.size	waterColorUpdate, 32
waterColorUpdate:
	.word	25599
	.word	25599
	.word	25599
	.word	24401
	.word	19114
	.word	19114
	.word	19114
	.word	24401
	.type	swordOffsetSide, %object
	.size	swordOffsetSide, 32
swordOffsetSide:
	.word	-6
	.word	-2
	.word	-7
	.word	-2
	.word	-7
	.word	1
	.word	-6
	.word	1
	.type	swordOffsetDown, %object
	.size	swordOffsetDown, 32
swordOffsetDown:
	.word	0
	.word	-1
	.word	0
	.word	5
	.word	3
	.word	5
	.word	3
	.word	5
	.type	swordOffsetUp, %object
	.size	swordOffsetUp, 32
swordOffsetUp:
	.word	2
	.word	-5
	.word	2
	.word	-5
	.word	0
	.word	-5
	.word	0
	.word	-5
	.global	__aeabi_d2iz
	.global	__aeabi_dadd
	.global	__aeabi_ddiv
	.global	__aeabi_i2d
	.ident	"GCC: (devkitARM) 15.2.0"
