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
	mov	r2, #0
	mov	r1, #8
	mov	ip, #1280
	mov	r0, #4
	ldr	r3, .L13
	str	lr, [sp, #-4]!
	mov	lr, #1920
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
.L14:
	.align	2
.L13:
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
	ldr	r3, .L17
	ldr	r2, .L17+4
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
.L18:
	.align	2
.L17:
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
	mov	r2, #0
	mov	r0, #8
	mov	ip, #4
	ldr	r3, .L21
	str	lr, [sp, #-4]!
	strb	r2, [r3, #148]
	str	r2, [r3, #120]
	str	r2, [r3, #124]
	str	r0, [r3, #136]
	str	r0, [r3, #140]
	str	r2, [r3, #152]
	mov	r0, #512
	add	r2, r3, #56
	mov	r1, #1
	mov	lr, #1280
	str	ip, [r3, #128]
	str	ip, [r3, #132]
	str	r2, [r3, #156]
	mov	ip, #10
	mov	r2, #960
	strh	r0, [r3, #164]	@ movhi
	str	lr, [r3, #112]
	str	r1, [r3, #160]
	str	r1, [r3, #108]
	str	ip, [r3, #144]
	str	r2, [r3, #116]
	ldr	lr, [sp], #4
	bx	lr
.L22:
	.align	2
.L21:
	.word	.LANCHOR0
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
	mov	r2, #0
	mov	ip, #1280
	mov	r0, #8
	mov	r1, #5
	ldr	r3, .L25
	str	lr, [sp, #-4]!
	strb	r2, [r3, #36]
	strb	r2, [r3, #104]
	str	ip, [r3, #4]
	str	r2, [r3, #8]
	mov	ip, #4
	str	r2, [r3, #12]
	str	r2, [r3, #40]
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	str	r2, [r3, #72]
	str	r2, [r3, #76]
	str	r2, [r3, #80]
	str	r2, [r3, #84]
	str	r2, [r3, #88]
	mov	r2, #256
	mov	lr, #1920
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	add	r0, r3, #56
	str	r1, [r3, #32]
	str	r0, [r3, #44]
	str	r1, [r3, #92]
	mov	r0, #1
	str	r1, [r3, #100]
	mov	r1, #7
	str	ip, [r3, #16]
	strh	r2, [r3, #52]	@ movhi
	ldr	ip, .L25+4
	str	lr, [r3]
	ldr	lr, [sp], #4
	str	ip, [r3, #96]
	str	r0, [r3, #48]
	str	r1, [r3, #20]
	b	initEnemies
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.word	.LANCHOR1
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
	ldr	r1, .L34
	ldm	r1, {r2, r3}
	asr	r2, r2, #4
	subs	r2, r2, #120
	movmi	r2, #0
	asr	r3, r3, #4
	movmi	ip, r2
	sub	r3, r3, #80
	bmi	.L28
	cmp	r2, #16
	movgt	r2, #16
	movgt	ip, r2
	lslle	ip, r2, #16
	lsrle	ip, ip, #16
.L28:
	cmp	r3, #0
	movlt	r3, #0
	str	r2, [r1, #168]
	movlt	r0, r3
	blt	.L29
	cmp	r3, #96
	movgt	r3, #96
	movgt	r0, r3
	lslle	r0, r3, #16
	lsrle	r0, r0, #16
.L29:
	mov	r2, #67108864
	str	r3, [r1, #172]
	strh	ip, [r2, #20]	@ movhi
	strh	r0, [r2, #22]	@ movhi
	strh	ip, [r2, #24]	@ movhi
	strh	r0, [r2, #26]	@ movhi
	strh	ip, [r2, #28]	@ movhi
	strh	r0, [r2, #30]	@ movhi
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.size	updateCamera, .-updateCamera
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L110+8
	ldr	r3, [r4, #32]
	sub	r3, r3, #1
	cmp	r3, #0
	ldrb	r1, [r4, #52]	@ zero_extendqisi2
	str	r3, [r4, #32]
	ble	.L104
	cmp	r1, #3
	beq	.L36
.L42:
	mov	r2, #0
	ldr	r3, .L110+12
	ldrh	r3, [r3]
	tst	r3, #64
	mvneq	r0, #11
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	moveq	r2, #3
	streq	r0, [r4, #12]
	strbeq	r2, [r4, #36]
	tst	r3, #128
	moveq	r0, #2
	ldreq	r2, [r4, #12]
	addeq	r2, r2, #12
	strbeq	r0, [r4, #36]
	streq	r2, [r4, #12]
	ands	r2, r3, #32
	mvneq	r0, #11
	strbeq	r2, [r4, #36]
	streq	r0, [r4, #8]
	tst	r3, #16
	moveq	r0, #1
	ldreq	r2, [r4, #8]
	addeq	r2, r2, #12
	streq	r2, [r4, #8]
	ldr	r2, .L110+16
	ldrh	r2, [r2]
	strbeq	r0, [r4, #36]
	tst	r2, #512
	beq	.L48
	subs	r1, r1, #2
	movne	r1, #1
	bics	r1, r1, r3, lsr #9
	bne	.L105
.L48:
	tst	r2, #1
	ldrb	r8, [r4, #52]	@ zero_extendqisi2
	bne	.L106
.L50:
	cmp	r8, #2
	beq	.L49
	add	r0, r4, #8
	ldm	r0, {r0, r5}
.L52:
	ldr	r6, [r4]
	ldr	r1, [r4, #16]
	ldr	r7, [r4, #4]
	ldr	r2, [r4, #20]
	add	r3, r6, r0
	add	r3, r1, r3, asr #4
	add	ip, r2, r7, asr #4
	orr	lr, r3, ip
	cmp	lr, #255
	bls	.L107
.L53:
	mov	r0, #0
	add	ip, r7, r5
	add	r1, r1, r6, asr #4
	add	r3, r2, ip, asr #4
	orr	r2, r3, r1
	cmp	r2, #255
	str	r0, [r4, #8]
	bls	.L108
.L55:
	str	r0, [r4, #12]
.L57:
	cmp	r8, #2
	beq	.L36
.L63:
	mov	r3, #0
	mov	r2, #1
	ldr	r1, .L110+20
	strb	r3, [r4, #52]
	str	r1, [r4, #44]
	str	r2, [r4, #48]
	str	r3, [r4, #40]
.L36:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L106:
	ands	r3, r3, #1
	bne	.L50
	cmp	r8, #2
	beq	.L49
	cmp	r8, #3
	beq	.L36
	mov	r2, #5
	mov	r0, #3
	str	r3, [r4, #40]
	mov	r3, #1
	ldr	r1, .L110+24
	str	r1, [r4, #96]
	add	r1, r1, #44
	str	r1, [r4, #44]
	str	r2, [r4, #48]
	strb	r0, [r4, #52]
	str	r2, [r4, #32]
	str	r2, [r4, #100]
	str	r3, [r4, #64]
	str	r2, [r4, #92]
	b	.L36
.L104:
	ldr	r3, [r4, #40]
	cmp	r1, #3
	ldr	r2, [r4, #48]
	add	r3, r3, #1
	beq	.L109
	mov	r0, #6
	cmp	r3, r2
	str	r3, [r4, #40]
	str	r0, [r4, #32]
	blt	.L42
	sub	r3, r1, #2
	cmp	r3, #1
	bls	.L40
	mov	r3, #0
	str	r3, [r4, #40]
	b	.L42
.L107:
	ldr	lr, .L110+28
	add	r9, r3, ip, lsl #8
	ldrb	r9, [lr, r9]	@ zero_extendqisi2
	cmp	r9, #0
	bne	.L53
	ldr	r9, [r4, #24]
	add	r9, r3, r9
	sub	r9, r9, #1
	cmp	r9, #255
	bhi	.L53
	add	r10, r9, ip, lsl #8
	ldrb	r10, [lr, r10]	@ zero_extendqisi2
	cmp	r10, #0
	bne	.L53
	ldr	r10, [r4, #28]
	add	ip, ip, r10
	sub	ip, ip, #1
	cmp	ip, #255
	bhi	.L53
	add	r3, r3, ip, lsl #8
	ldrb	r3, [lr, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L53
	add	r3, r9, ip, lsl #8
	ldrb	r3, [lr, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L53
	add	ip, r7, r5
	add	r1, r1, r6, asr #4
	add	r3, r2, ip, asr #4
	orr	r2, r1, r3
	cmp	r2, #255
	bhi	.L58
	add	r2, r1, r3, lsl #8
	ldrb	r2, [lr, r2]	@ zero_extendqisi2
	cmp	r2, #0
	lsl	r9, r3, #8
	beq	.L56
.L58:
	mov	r3, #0
	cmp	r0, r3
	str	r3, [r4, #12]
	beq	.L57
.L60:
	add	r6, r6, r0
	cmp	r8, #2
	str	r6, [r4]
	beq	.L36
.L62:
	mov	r2, #1
	mov	r3, #5
	ldr	r1, .L110+32
	strb	r2, [r4, #52]
	str	r1, [r4, #44]
	str	r3, [r4, #48]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L108:
	ldr	lr, .L110+28
	add	r2, r1, r3, lsl #8
	ldrb	r2, [lr, r2]	@ zero_extendqisi2
	cmp	r2, r0
	moveq	r0, r2
	lsl	r9, r3, #8
	bne	.L55
.L56:
	ldr	r2, [r4, #24]
	add	r2, r1, r2
	sub	r2, r2, #1
	cmp	r2, #255
	bhi	.L58
	add	r9, r2, r9
	ldrb	r9, [lr, r9]	@ zero_extendqisi2
	cmp	r9, #0
	bne	.L58
	ldr	r9, [r4, #28]
	add	r3, r3, r9
	sub	r3, r3, #1
	cmp	r3, #255
	bhi	.L58
	add	r1, r1, r3, lsl #8
	ldrb	r1, [lr, r1]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L58
	add	r2, r2, r3, lsl #8
	ldrb	r3, [lr, r2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L58
	cmp	r0, #0
	beq	.L61
	cmp	r5, #0
	beq	.L60
	ldr	fp, .L110+36
	mov	lr, pc
	bx	fp
	ldr	ip, .L110+40
	adr	r3, .L110
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	ip
	mov	r9, r0
	mov	r0, r6
	mov	r10, r1
	mov	lr, pc
	bx	fp
	ldr	r6, .L110+44
	mov	r2, r0
	mov	r3, r1
	mov	r0, r9
	mov	r1, r10
	mov	lr, pc
	bx	r6
	ldr	r3, .L110+48
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	mov	r0, r5
	mov	lr, pc
	bx	fp
	adr	r3, .L110
	ldmia	r3, {r2-r3}
	ldr	ip, .L110+40
	mov	lr, pc
	bx	ip
	mov	r9, r0
	mov	r0, r7
	mov	r10, r1
	mov	lr, pc
	bx	fp
	mov	r2, r0
	mov	r3, r1
	mov	r0, r9
	mov	r1, r10
	mov	lr, pc
	bx	r6
	ldr	r3, .L110+48
	mov	lr, pc
	bx	r3
	cmp	r8, #2
	str	r0, [r4, #4]
	bne	.L62
	b	.L36
.L105:
	mov	r3, #6
	mov	r1, #2
	mov	r2, #0
	ldr	r0, .L110+52
	str	r3, [r4, #48]
	str	r0, [r4, #44]
	strb	r1, [r4, #52]
	str	r2, [r4, #40]
	str	r3, [r4, #32]
.L49:
	add	r0, r4, #8
	ldm	r0, {r0, r5}
	add	r0, r0, r0, lsl #1
	add	r5, r5, r5, lsl #1
	add	r0, r0, r0, lsr #31
	add	r5, r5, r5, lsr #31
	asr	r0, r0, #1
	asr	r5, r5, #1
	mov	r8, #2
	str	r0, [r4, #8]
	str	r5, [r4, #12]
	b	.L52
.L109:
	mov	r1, #5
	cmp	r3, r2
	str	r3, [r4, #40]
	str	r1, [r4, #32]
	blt	.L36
.L40:
	mov	r3, #0
	mov	r2, #1
	ldr	r1, .L110+20
	strb	r3, [r4, #52]
	str	r1, [r4, #44]
	str	r2, [r4, #48]
	mov	r1, r3
	str	r3, [r4, #64]
	str	r3, [r4, #40]
	b	.L42
.L61:
	cmp	r8, #2
	str	ip, [r4, #4]
	beq	.L36
	cmp	r5, #0
	bne	.L62
	b	.L63
.L111:
	.align	3
.L110:
	.word	1717986918
	.word	1073112678
	.word	.LANCHOR0
	.word	buttons
	.word	oldButtons
	.word	.LANCHOR0+56
	.word	.LANCHOR1
	.word	testmapcmBitmap
	.word	.LANCHOR1+64
	.word	__aeabi_i2d
	.word	__aeabi_ddiv
	.word	__aeabi_dadd
	.word	__aeabi_d2iz
	.word	.LANCHOR1+20
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
	ldr	r3, .L118
	ldrb	r2, [r3, #52]	@ zero_extendqisi2
	sub	r2, r2, #2
	cmp	r2, #1
	bxls	lr
	str	lr, [sp, #-4]!
	mov	lr, #3
	mov	r2, #5
	mov	ip, #0
	mov	r0, #1
	ldr	r1, .L118+4
	strb	lr, [r3, #52]
	str	r1, [r3, #96]
	add	r1, r1, #44
	str	r1, [r3, #44]
	str	r2, [r3, #48]
	str	ip, [r3, #40]
	str	r2, [r3, #32]
	str	r0, [r3, #64]
	str	r2, [r3, #100]
	str	r2, [r3, #92]
	ldr	lr, [sp], #4
	bx	lr
.L119:
	.align	2
.L118:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	attack, .-attack
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, [r0, #36]
	sub	r3, r3, #1
	cmp	r3, #0
	mov	r4, r0
	strgt	r3, [r0, #36]
	bgt	.L122
	ldr	r3, [r0, #44]
	ldr	r1, [r0, #52]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r0, #44]
	mov	r2, #5
	movge	r3, #0
	str	r2, [r0, #36]
	strge	r3, [r0, #44]
.L122:
	mov	r3, #0
	ldr	r2, .L141+8
	ldr	r7, [r4, #4]
	ldr	ip, [r2]
	asr	r0, r7, #4
	sub	r1, r0, #4
	ldr	r2, [r2, #4]
	ldr	r6, [r4, #8]
	cmp	r1, ip, asr #4
	str	r3, [r4, #12]
	str	r3, [r4, #16]
	asr	r2, r2, #4
	asr	r1, r6, #4
	ble	.L124
	strb	r3, [r4, #40]
	mvn	r3, #3
	add	r0, r1, r3
	cmp	r2, r0
	movge	r0, r3
	str	r3, [r4, #12]
	blt	.L138
.L126:
	add	r1, r1, #4
	cmp	r2, r1
	bgt	.L139
.L131:
	add	r5, r7, r0
	stmib	r4, {r5, r6}
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L124:
	add	r0, r0, #4
	cmp	r0, ip, asr #4
	bge	.L127
	mov	r3, #1
	mov	r0, #4
	strb	r3, [r4, #40]
	sub	r3, r1, #4
	cmp	r2, r3
	str	r0, [r4, #12]
	bge	.L126
	mvn	r3, #3
	mov	r2, #3
	mov	r5, r3
	b	.L125
.L127:
	sub	r0, r1, #4
	cmp	r2, r0
	blt	.L140
	add	r1, r1, #4
	cmp	r1, r2
	movge	r0, r3
	bge	.L131
	mov	r3, #4
	mov	r1, #2
	mov	r2, r3
.L130:
	mov	r0, #0
	str	r3, [r4, #16]
	strb	r1, [r4, #40]
	add	r6, r6, r2
	b	.L131
.L138:
	mov	r2, #3
	mov	r5, r3
	mov	r0, r3
.L125:
	ldr	r10, .L141+12
	str	r3, [r4, #16]
	strb	r2, [r4, #40]
	mov	lr, pc
	bx	r10
	ldr	fp, .L141+16
	adr	r3, .L141
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	fp
	mov	r8, r0
	mov	r0, r7
	mov	r9, r1
	mov	lr, pc
	bx	r10
	ldr	ip, .L141+20
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r7, .L141+24
	mov	lr, pc
	bx	r7
	mov	r3, r0
	mov	r0, r5
	mov	r5, r3
	mov	lr, pc
	bx	r10
	adr	r3, .L141
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	fp
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r10
	ldr	ip, .L141+20
	mov	r3, r1
	mov	r2, r0
	mov	r1, r9
	mov	r0, r8
	mov	lr, pc
	bx	ip
	mov	lr, pc
	bx	r7
	mov	r6, r0
	stmib	r4, {r5, r6}
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L140:
	mvn	r3, #3
	mov	r1, #3
	mov	r2, r3
	b	.L130
.L139:
	mov	r3, #4
	mov	r2, #2
	mov	r5, r3
	b	.L125
.L142:
	.align	3
.L141:
	.word	1717986918
	.word	1073112678
	.word	.LANCHOR0
	.word	__aeabi_i2d
	.word	__aeabi_ddiv
	.word	__aeabi_dadd
	.word	__aeabi_d2iz
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
	@ link register save eliminated.
	ldr	r0, .L145
	ldr	r3, [r0, #108]
	cmp	r3, #0
	bxeq	lr
	add	r0, r0, #108
	b	updateEnemy
.L146:
	.align	2
.L145:
	.word	.LANCHOR0
	.size	updateEnemies, .-updateEnemies
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"Player hit!\000"
	.align	2
.LC2:
	.ascii	"Enemy hit!\000"
	.text
	.align	2
	.global	checkEntityCollisions
	.syntax unified
	.arm
	.type	checkEntityCollisions, %function
checkEntityCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L171
	ldr	ip, .L171+4
	ldr	r2, [r3]
	ldr	r1, [r3, #4]
	ldrb	r0, [r3, #36]	@ zero_extendqisi2
	asr	r2, r2, #4
	asr	r1, r1, #4
	cmp	r0, #3
	bhi	.L148
	ldrb	r0, [ip, r0]
	add	pc, pc, r0, lsl #2
.Lrtx150:
	nop
	.section	.rodata
.L150:
	.byte	(.L153-.Lrtx150-4)/4
	.byte	(.L152-.Lrtx150-4)/4
	.byte	(.L151-.Lrtx150-4)/4
	.byte	(.L149-.Lrtx150-4)/4
	.text
	.p2align 2
.L151:
	mov	lr, r2
	mov	r8, #8
	mov	r5, #16
	add	r7, r1, #12
.L148:
	ldr	r0, [r3, #108]
	cmp	r0, #0
	beq	.L147
	ldr	ip, [r3, #112]
	ldr	r0, [r3, #128]
	add	r0, r0, ip, asr #4
	ldr	ip, [r3, #136]
	add	ip, r0, ip
	cmp	lr, ip
	ldr	r6, [r3, #116]
	bge	.L156
	add	lr, lr, r5
	cmp	r0, lr
	bge	.L156
	ldr	lr, [r3, #132]
	add	r4, lr, r6, asr #4
	ldr	lr, [r3, #140]
	add	lr, r4, lr
	cmp	r7, lr
	bge	.L156
	add	lr, r7, r8
	cmp	r4, lr
	bge	.L156
	ldr	lr, [r3, #64]
	cmp	lr, #0
	beq	.L156
	ldr	r2, .L171+8
	ldr	r0, .L171+12
	mov	lr, pc
	bx	r2
	mov	r2, #0
	ldr	r3, .L171
	str	r2, [r3, #108]
.L147:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L156:
	ldr	lr, [r3, #16]
	add	lr, r2, lr
	ldr	r2, [r3, #24]
	add	r2, lr, r2
	cmp	r2, r0
	movle	r2, #0
	movgt	r2, #1
	cmp	lr, ip
	movge	r2, #0
	cmp	r2, #0
	beq	.L147
	ldr	r2, [r3, #20]
	ldr	r0, [r3, #132]
	add	r1, r1, r2
	ldr	r2, [r3, #28]
	ldr	ip, [r3, #140]
	add	r0, r0, r6, asr #4
	add	r3, r1, r2
	cmp	r3, r0
	add	r2, r0, ip
	movle	r3, #0
	movgt	r3, #1
	cmp	r1, r2
	movge	r3, #0
	cmp	r3, #0
	beq	.L147
	ldr	r3, .L171+8
	ldr	r0, .L171+16
	mov	lr, pc
	bx	r3
	ldr	r2, .L171+20
	ldr	r3, [r2, #88]
	sub	r3, r3, #1
	str	r3, [r2, #88]
	b	.L147
.L149:
	mov	lr, r2
	mov	r8, #8
	mov	r5, #16
	sub	r7, r1, #4
	b	.L148
.L153:
	mov	r7, r1
	mov	r8, #16
	mov	r5, #8
	sub	lr, r2, #4
	b	.L148
.L152:
	mov	r7, r1
	mov	r8, #16
	mov	r5, #8
	add	lr, r2, #12
	b	.L148
.L172:
	.align	2
.L171:
	.word	.LANCHOR0
	.word	.L150
	.word	mgba_printf
	.word	.LC2
	.word	.LC1
	.word	.LANCHOR1
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
	push	{r4, lr}
	bl	updatePlayer
	ldr	r0, .L179
	ldr	r3, [r0, #108]
	cmp	r3, #0
	addne	r0, r0, #108
	blne	updateEnemy
.L174:
	bl	updateCamera
	pop	{r4, lr}
	b	checkEntityCollisions
.L180:
	.align	2
.L179:
	.word	.LANCHOR0
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
	ldr	r3, .L203
	ldr	r2, [r3, #44]
	ldr	r8, [r3]
	ldrh	r6, [r3, #168]
	ldr	r4, [r3, #40]
	ldrb	r0, [r3, #53]	@ zero_extendqisi2
	ldr	r7, [r3, #4]
	ldrh	r5, [r3, #172]
	ldrb	r1, [r3, #36]	@ zero_extendqisi2
	ldr	ip, .L203+4
	ldr	lr, [r2, r4, lsl #2]
	rsb	r2, r6, r8, asr #4
	lsl	r9, r0, #3
	lsl	r2, r2, #16
	rsb	r10, r5, r7, asr #4
	cmp	r1, #1
	sub	sp, sp, #12
	lsr	r2, r2, #16
	strh	r10, [ip, r9]	@ movhi
	add	r0, ip, r0, lsl #3
	ldr	r9, [r3, #64]
	beq	.L201
	orr	r2, r2, #16384
	cmp	r1, #0
	strh	r2, [r0, #2]	@ movhi
	bne	.L185
	ldr	r2, .L203+8
	cmp	r9, #0
	and	lr, r2, lr, lsl #1
	strh	lr, [r0, #4]	@ movhi
	beq	.L186
	ldr	lr, [r3, #96]
	ldr	lr, [lr, r4, lsl #2]
	ldr	r0, .L203+12
	and	r2, r2, lr, lsl #1
	str	r2, [sp, #4]
	add	r2, r0, r4, lsl #3
	ldr	r2, [r2, #4]
	ldr	r0, [r0, r4, lsl #3]
	add	r2, r2, r7, asr #4
	str	r2, [sp]
	add	fp, r0, r8, asr #4
.L189:
	sub	r2, fp, r6
	ldrb	r3, [r3, #104]	@ zero_extendqisi2
	orr	r1, r1, r2
	ldr	r2, [sp]
	add	r0, ip, r3, lsl #3
	sub	r2, r2, r5
	lsl	r3, r3, #3
	strh	r2, [ip, r3]	@ movhi
	ldr	r3, [sp, #4]
	orr	r1, r1, #16384
	strh	r1, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L201:
	orr	r2, r2, #20480
	strh	r2, [r0, #2]	@ movhi
	ldr	r2, .L203+8
	cmp	r9, #0
	and	lr, r2, lr, lsl #1
	strh	lr, [r0, #4]	@ movhi
	bne	.L183
.L186:
	mov	r2, #512
	ldrb	r3, [r3, #104]	@ zero_extendqisi2
	lsl	r3, r3, #3
	strh	r2, [ip, r3]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L183:
	ldr	r0, [r3, #96]
	ldr	r0, [r0, r4, lsl #2]
	ldr	r1, .L203+12
	and	r2, r2, r0, lsl #1
	str	r2, [sp, #4]
	add	r2, r1, r4, lsl #3
	ldr	r2, [r2, #4]
	ldr	r1, [r1, r4, lsl #3]
	add	r2, r2, r7, asr #4
	rsb	fp, r1, r8, asr #4
	str	r2, [sp]
	mov	r1, #4096
	b	.L189
.L185:
	ldr	r2, .L203+8
	cmp	r9, #0
	sub	r9, r1, #1
	add	lr, lr, r9, lsl #6
	and	lr, r2, lr, lsl #1
	strh	lr, [r0, #4]	@ movhi
	beq	.L186
	cmp	r1, #3
	beq	.L188
	bhi	.L202
	ldr	r0, [r3, #96]
	ldr	r0, [r0, r4, lsl #2]
	ldr	r1, .L203+12
	add	r0, r0, #64
	add	r1, r1, r4, lsl #3
	and	r2, r2, r0, lsl #1
	str	r2, [sp, #4]
	ldr	r2, [r1, #32]
	add	fp, r2, r8, asr #4
	ldr	r2, [r1, #36]
	add	r2, r2, r7, asr #4
	mov	r1, #0
	str	r2, [sp]
	b	.L189
.L188:
	ldr	r0, [r3, #96]
	ldr	r0, [r0, r4, lsl #2]
	ldr	r1, .L203+12
	add	r0, r0, #128
	add	r1, r1, r4, lsl #3
	and	r2, r2, r0, lsl #1
	str	r2, [sp, #4]
	ldr	r2, [r1, #64]
	add	fp, r2, r8, asr #4
	ldr	r2, [r1, #68]
	add	r2, r2, r7, asr #4
	mov	r1, #0
	str	r2, [sp]
	b	.L189
.L202:
	mov	r1, #0
	b	.L189
.L204:
	.align	2
.L203:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	1022
	.word	.LANCHOR2
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
	ldr	r3, .L215
	ldr	r1, [r3, #108]
	cmp	r1, #0
	ldrb	r2, [r3, #165]	@ zero_extendqisi2
	beq	.L206
	ldr	r0, .L215+4
	push	{r4, lr}
	ldr	ip, [r3, #112]
	lsl	lr, r2, #3
	add	r1, r0, r2, lsl #3
	ldr	r2, [r3, #168]
	ldr	r4, [r3, #116]
	rsb	r2, r2, ip, asr #4
	ldr	ip, [r3, #172]
	rsb	ip, ip, r4, asr #4
	strh	ip, [r0, lr]	@ movhi
	ldrb	ip, [r3, #148]	@ zero_extendqisi2
	lsl	r2, r2, #16
	ldr	r4, [r3, #152]
	lsr	r2, r2, #16
	cmp	ip, #1
	ldr	r3, [r3, #156]
	orreq	r2, r2, #20480
	ldr	r3, [r3, r4, lsl #2]
	strheq	r2, [r1, #2]	@ movhi
	beq	.L208
	orr	r2, r2, #16384
	cmp	ip, #0
	strh	r2, [r1, #2]	@ movhi
	bne	.L208
	ldr	r2, .L215+8
	and	r3, r2, r3, lsl #1
	strh	r3, [r1, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L208:
	ldr	r2, .L215+8
	sub	ip, ip, #1
	add	r3, r3, ip, lsl #6
	add	r0, r0, lr
	and	r3, r2, r3, lsl #1
	strh	r3, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L206:
	mov	r1, #512
	ldr	r3, .L215+4
	lsl	r2, r2, #3
	strh	r1, [r3, r2]	@ movhi
	bx	lr
.L216:
	.align	2
.L215:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	1022
	.size	drawEnemies, .-drawEnemies
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
	bl	drawEnemies
	ldr	r3, .L219
	mov	lr, pc
	bx	r3
	ldr	r4, .L219+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L219+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L220:
	.align	2
.L219:
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.global	vOff
	.global	hOff
	.global	lives
	.global	enemies
	.global	sword
	.global	player
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	swordFrames, %object
	.size	swordFrames, 20
swordFrames:
	.word	37
	.word	38
	.word	39
	.word	40
	.word	41
	.type	dodgeFrames, %object
	.size	dodgeFrames, 24
dodgeFrames:
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.type	attackFrames, %object
	.size	attackFrames, 20
attackFrames:
	.word	32
	.word	33
	.word	34
	.word	35
	.word	36
	.type	walkFrames, %object
	.size	walkFrames, 24
walkFrames:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.type	lives, %object
	.size	lives, 4
lives:
	.word	1
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	player, %object
	.size	player, 56
player:
	.space	56
	.type	idleFrames, %object
	.size	idleFrames, 4
idleFrames:
	.space	4
	.space	4
	.type	sword, %object
	.size	sword, 44
sword:
	.space	44
	.type	enemies, %object
	.size	enemies, 60
enemies:
	.space	60
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
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
