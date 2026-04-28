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
	ldr	r3, .L4
	str	lr, [sp, #-4]!
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #40]
	add	r2, r3, #56
	str	r2, [r3, #44]
	mov	r2, #2
	mov	lr, #1280
	mov	ip, #7360
	mov	r0, #4
	mov	r1, #9
	strb	r2, [r3, #36]
	mov	r2, #256
	str	lr, [r3]
	str	ip, [r3, #4]
	mov	lr, #1
	mov	ip, #8
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	mov	r0, #7
	mov	r1, #6
	strh	r2, [r3, #52]	@ movhi
	str	lr, [r3, #48]
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #32]
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
	.global	initSlashes
	.syntax unified
	.arm
	.type	initSlashes, %function
initSlashes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #29
	mov	r0, #0
	mov	r1, #0
	mov	ip, #0
	str	lr, [sp, #-4]!
	ldr	r3, .L14
.L11:
	add	lr, r2, #1
	strb	r2, [r3, #44]
	and	r2, lr, #255
	cmp	r2, #32
	stm	r3, {r0-r1}
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	str	r0, [r3, #24]
	str	r1, [r3, #28]
	str	ip, [r3, #32]
	strb	ip, [r3, #36]
	str	ip, [r3, #40]
	add	r3, r3, #48
	bne	.L11
	ldr	lr, [sp], #4
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LANCHOR0+112
	.size	initSlashes, .-initSlashes
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r2, r1
	mov	r6, #4
	mov	r5, #8
	mov	r9, #10
	mov	lr, #1
	ldr	r3, .L20
	ldr	r4, .L20+4
	add	r8, r3, #880
.L17:
	add	r0, r4, r1, lsl #5
	ldr	ip, [r4, r1, lsl #5]
	ldr	r0, [r0, #4]
	add	r7, r1, #2
	add	r1, r1, #1
	lsl	ip, ip, #4
	lsl	r0, r0, #4
	cmp	r1, #11
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r6, [r3, #20]
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	str	r5, [r3, #32]
	str	r9, [r3, #44]
	strb	r2, [r3, #36]
	strb	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r8, [r3, #56]
	str	lr, [r3, #60]
	strb	r2, [r3, #64]
	str	lr, [r3, #68]
	str	r2, [r3, #72]
	strb	r7, [r3, #76]
	str	lr, [r3], #80
	bne	.L17
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0+256
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
	mov	r2, #13
	mov	r0, #0
	mov	r1, #0
	mov	r6, #0
	mov	r7, #2
	mov	r8, #4
	mov	lr, #0
	mov	r4, #0
	mov	r5, #4
	ldr	r3, .L26
.L23:
	add	ip, r2, #1
	strb	r2, [r3, #44]
	and	r2, ip, #255
	cmp	r2, #29
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
	bne	.L23
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LANCHOR0+1144
	.size	initBullets, .-initBullets
	.align	2
	.global	initKorok
	.syntax unified
	.arm
	.type	initKorok, %function
initKorok:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{fp, lr}
	mov	r2, #32
	mov	fp, #1
	mov	lr, #4
	mov	r0, #1280
	mov	r1, #0
	ldr	r3, .L30
	ldr	ip, .L30+4
	strb	r2, [r3, #1944]
	str	fp, [r3, #1912]
	str	ip, [r3, #1916]
	ldr	ip, .L30+8
	str	lr, [r3, #1940]
	str	ip, [r3, #1936]
	str	r0, [r3, #1920]
	str	r1, [r3, #1932]
	pop	{fp, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	.LANCHOR0
	.word	6880
	.word	.LANCHOR1+16
	.size	initKorok, .-initKorok
	.align	2
	.global	initBushes
	.syntax unified
	.arm
	.type	initBushes, %function
initBushes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, r3
	mov	r9, r3
	ldr	r7, .L40
	ldr	r6, .L40+4
	str	r3, [r7, #1948]
.L33:
	mov	r4, #0
	lsl	r5, r8, #3
	b	.L35
.L34:
	add	r4, r4, #1
	cmp	r4, #64
	beq	.L39
.L35:
	mov	r1, r5
	lsl	r0, r4, #3
	mov	lr, pc
	bx	r6
	cmp	r0, #4
	bne	.L34
	ldr	r3, [r7, #1948]
	cmp	r3, #63
	bgt	.L34
	add	r2, r3, r3, lsl #1
	add	r2, r7, r2, lsl #2
	str	r4, [r2, #1952]
	add	r4, r4, #1
	add	r3, r3, #1
	cmp	r4, #64
	str	r8, [r2, #1956]
	str	r9, [r2, #1960]
	str	r3, [r7, #1948]
	bne	.L35
.L39:
	add	r8, r8, #1
	cmp	r8, #64
	bne	.L33
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.word	colorAt
	.size	initBushes, .-initBushes
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #5
	mov	r2, #7360
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L44
	str	r3, [r4, #92]
	str	r3, [r4, #100]
	mov	r3, #9
	str	r2, [r4, #4]
	mov	r2, #8
	str	r3, [r4, #20]
	mov	r3, #7
	str	r2, [r4, #24]
	mov	r2, #6
	str	r3, [r4, #28]
	mov	r3, #2
	mov	r5, #0
	mov	r8, #1280
	mov	r7, #4
	mov	r9, #1
	str	r2, [r4, #32]
	mov	r2, #256
	ldr	r6, .L44+4
	strb	r3, [r4, #36]
	add	r3, r4, #56
	strh	r2, [r4, #52]	@ movhi
	str	r3, [r4, #44]
	str	r6, [r4, #96]
	str	r8, [r4]
	str	r5, [r4, #8]
	str	r5, [r4, #12]
	str	r7, [r4, #16]
	str	r5, [r4, #40]
	str	r5, [r4, #64]
	str	r5, [r4, #68]
	str	r5, [r4, #72]
	str	r5, [r4, #76]
	str	r5, [r4, #80]
	str	r5, [r4, #84]
	str	r5, [r4, #88]
	strb	r5, [r4, #104]
	str	r9, [r4, #48]
	bl	initSlashes
	bl	initEnemies
	bl	initBullets
	mov	r3, #32
	ldr	r2, .L44+8
	add	r6, r6, #16
	str	r9, [r4, #1912]
	str	r8, [r4, #1920]
	str	r5, [r4, #1932]
	str	r6, [r4, #1936]
	str	r7, [r4, #1940]
	str	r2, [r4, #1916]
	strb	r3, [r4, #1944]
	bl	initBushes
	str	r5, [r4, #2720]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	6880
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
	ldr	r0, .L47
	ldr	r2, [r0, #2720]
	cmp	r2, #0
	movge	r3, r2
	mov	ip, #83886080
	addlt	r3, r2, #15
	asr	r3, r3, #4
	add	r2, r2, #1
	str	r2, [r0, #2720]
	rsbs	r2, r3, #0
	ldr	r1, .L47+4
	and	r2, r2, #7
	and	r3, r3, #7
	rsbpl	r3, r2, #0
	add	r3, r1, r3, lsl #2
	ldr	r3, [r3, #352]
	strh	r3, [ip, #24]	@ movhi
	bx	lr
.L48:
	.align	2
.L47:
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
	ldr	r1, .L56
	ldm	r1, {r2, r3}
	asr	r2, r2, #4
	subs	r2, r2, #120
	movmi	r2, #0
	asr	r3, r3, #4
	movmi	ip, r2
	sub	r3, r3, #80
	bmi	.L50
	cmp	r2, #272
	movgt	r2, #272
	movgt	ip, r2
	lslle	ip, r2, #16
	lsrle	ip, ip, #16
.L50:
	cmp	r3, #0
	movlt	r3, #0
	str	r2, [r1, #2724]
	movlt	r0, r3
	blt	.L51
	cmp	r3, #352
	movgt	r3, #352
	movgt	r0, r3
	lslle	r0, r3, #16
	lsrle	r0, r0, #16
.L51:
	mov	r2, #67108864
	str	r3, [r1, #2728]
	strh	ip, [r2, #20]	@ movhi
	strh	r0, [r2, #22]	@ movhi
	strh	ip, [r2, #24]	@ movhi
	strh	r0, [r2, #26]	@ movhi
	strh	ip, [r2, #28]	@ movhi
	strh	r0, [r2, #30]	@ movhi
	bx	lr
.L57:
	.align	2
.L56:
	.word	.LANCHOR0
	.size	updateCamera, .-updateCamera
	.align	2
	.global	setPlayerMovementFromInputs
	.syntax unified
	.arm
	.type	setPlayerMovementFromInputs, %function
setPlayerMovementFromInputs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	ldr	r2, .L63
	ldrh	r2, [r2]
	ldr	r3, .L63+4
	tst	r2, #64
	str	r1, [r3, #8]
	mvneq	r0, #9
	str	r1, [r3, #12]
	moveq	r1, #3
	streq	r0, [r3, #12]
	strbeq	r1, [r3, #36]
	tst	r2, #128
	moveq	r0, #2
	ldreq	r1, [r3, #12]
	addeq	r1, r1, #10
	strbeq	r0, [r3, #36]
	streq	r1, [r3, #12]
	ands	r1, r2, #32
	mvneq	r0, #9
	strbeq	r1, [r3, #36]
	streq	r0, [r3, #8]
	tst	r2, #16
	moveq	r1, #1
	ldreq	r2, [r3, #8]
	addeq	r2, r2, #10
	streq	r2, [r3, #8]
	strbeq	r1, [r3, #36]
	bx	lr
.L64:
	.align	2
.L63:
	.word	buttons
	.word	.LANCHOR0
	.size	setPlayerMovementFromInputs, .-setPlayerMovementFromInputs
	.align	2
	.global	attack
	.syntax unified
	.arm
	.type	attack, %function
attack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L87
	ldrb	r2, [r3, #52]	@ zero_extendqisi2
	sub	r2, r2, #2
	cmp	r2, #1
	bxls	lr
	mov	r2, #3
	mov	r0, #0
	mov	r1, #4
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L87+4
	strb	r2, [r3, #52]
	add	r2, r4, #32
	str	r0, [r3, #40]
	str	r2, [r3, #44]
	mov	r0, #1
	ldr	r2, .L87+8
	str	r1, [r3, #48]
	mov	lr, pc
	bx	r2
	mov	r2, #6
	mov	r0, #1
	mov	r1, #4
	ldr	r3, .L87
	ldr	ip, [r3, #2732]
	cmp	ip, #0
	str	r4, [r3, #96]
	str	r2, [r3, #32]
	str	r0, [r3, #64]
	str	r1, [r3, #100]
	str	r2, [r3, #92]
	beq	.L65
	ldr	r2, [r3, #112]
	cmp	r2, #0
	beq	.L69
	ldr	r2, [r3, #160]
	cmp	r2, #0
	beq	.L74
	ldr	r2, [r3, #208]
	cmp	r2, #0
	moveq	r2, #2
	beq	.L69
.L65:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L74:
	mov	r2, r0
.L69:
	mov	lr, #1
	ldrb	r0, [r3, #36]	@ zero_extendqisi2
	add	r1, r2, r2, lsl lr
	add	r1, r3, r1, lsl #4
	cmp	r0, #0
	str	lr, [r1, #112]
	lsl	ip, r2, lr
	ldr	r4, [r3, #4]
	ldr	lr, [r3]
	bne	.L70
	sub	lr, lr, #128
	str	r4, [r1, #120]
	str	lr, [r1, #116]
	mov	r1, #6
	mov	lr, #2
	mov	r6, #12
	mvn	r7, #19
	mov	r4, r0
	mov	r5, r1
.L71:
	add	r2, ip, r2
	add	r3, r3, r2, lsl #4
	mov	r2, #60
	str	r1, [r3, #132]
	str	lr, [r3, #136]
	str	r5, [r3, #140]
	str	r6, [r3, #144]
	str	r7, [r3, #124]
	str	r4, [r3, #128]
	strb	r0, [r3, #148]
	str	r2, [r3, #152]
	b	.L65
.L70:
	cmp	r0, #1
	beq	.L85
	cmp	r0, #3
	str	lr, [r1, #116]
	beq	.L86
	add	lr, r4, #64
	str	lr, [r1, #120]
	mov	r5, #12
	mov	r1, #2
	mov	lr, #5
	mov	r6, #6
	mov	r7, #0
	mov	r4, #20
	b	.L71
.L85:
	add	lr, lr, #128
	str	r4, [r1, #120]
	str	lr, [r1, #116]
	mov	r5, #6
	mov	r1, #5
	mov	lr, #2
	mov	r6, #12
	mov	r7, #20
	mov	r4, #0
	b	.L71
.L86:
	sub	lr, r4, #64
	str	lr, [r1, #120]
	mov	lr, #6
	mov	r1, #2
	mov	r5, #12
	mov	r7, #0
	mvn	r4, #19
	mov	r6, lr
	b	.L71
.L88:
	.align	2
.L87:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	playAnalogSound
	.size	attack, .-attack
	.align	2
	.global	updateSlashes
	.syntax unified
	.arm
	.type	updateSlashes, %function
updateSlashes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L96
	push	{r4, lr}
	add	r4, r3, #144
.L93:
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L91
	ldr	r2, [r3, #40]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3, #40]
	movle	r2, #0
	ldmib	r3, {r0, r1, lr}
	ldr	ip, [r3, #16]
	add	r0, r0, lr
	add	r1, r1, ip
	stmib	r3, {r0, r1}
	strle	r2, [r3]
.L91:
	add	r3, r3, #48
	cmp	r3, r4
	bne	.L93
	pop	{r4, lr}
	bx	lr
.L97:
	.align	2
.L96:
	.word	.LANCHOR0+112
	.size	updateSlashes, .-updateSlashes
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
	ldr	r1, .L108
	mov	r4, r2
	add	r2, r1, #1136
	add	r2, r2, #8
.L104:
	ldr	lr, [r2, r3, lsl #2]
	cmp	lr, #0
	add	r3, r3, #12
	beq	.L107
	add	ip, ip, #1
	cmp	ip, #16
	bne	.L104
.L98:
	pop	{r4, r5, lr}
	bx	lr
.L107:
	mov	r2, #1
	add	ip, ip, ip, lsl #1
	add	r3, r1, ip, lsl #4
	cmp	r4, #0
	add	r1, r0, #96
	str	r1, [r3, #1148]
	str	r2, [r3, #1144]
	mov	r1, #120
	mvneq	r2, #7
	add	r0, r5, #96
	str	lr, [r3, #1156]
	str	r0, [r3, #1152]
	str	lr, [r3, #1160]
	strb	r4, [r3, #1180]
	str	r1, [r3, #1184]
	streq	r2, [r3, #1156]
	beq	.L98
	cmp	r4, #1
	moveq	r2, #8
	streq	r2, [r3, #1156]
	beq	.L98
	cmp	r4, #3
	mvneq	r2, #7
	movne	r2, #8
	pop	{r4, r5, lr}
	str	r2, [r3, #1160]
	bx	lr
.L109:
	.align	2
.L108:
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
	mov	r3, r0
	mov	r2, #0
	push	{r4, r5, r6, lr}
	ldrb	r1, [r0, #64]	@ zero_extendqisi2
	cmp	r1, #3
	ldr	r0, [r0, #4]
	sub	sp, sp, #16
	ldr	r1, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	beq	.L111
	ldr	ip, .L136
	sub	ip, r3, ip
	asr	ip, ip, #4
	add	r2, ip, ip, lsl #1
	add	r2, r2, r2, lsl #4
	add	r2, r2, r2, lsl #8
	add	r2, r2, r2, lsl #16
	ldr	r5, [r3, #68]
	ldr	r4, .L136+4
	add	ip, ip, r2, lsl #2
	add	lr, r5, ip, lsl #2
	ldr	r2, [r4, lr, lsl #3]
	add	lr, r4, lr, lsl #3
	sub	r2, r2, r0, asr #4
	ldr	lr, [lr, #4]
	add	r6, r2, #2
	cmp	r6, #4
	sub	lr, lr, r1, asr #4
	bls	.L132
	eor	r4, r2, r2, asr #31
	eor	ip, lr, lr, asr #31
	sub	r4, r4, r2, asr #31
	sub	ip, ip, lr, asr #31
	cmp	r4, ip
	blt	.L113
	cmp	r2, #0
	movge	ip, #6
	mvnlt	ip, #5
	mvn	r2, r2
	str	ip, [r3, #12]
	lsr	r2, r2, #31
	add	r0, r0, ip
.L119:
	mov	ip, #1
	strb	r2, [r3, #48]
	mov	r2, #5
	ldr	lr, .L136+8
	strb	ip, [r3, #64]
	str	lr, [r3, #56]
	str	r2, [r3, #60]
.L121:
	ldr	r2, [r3, #44]
	sub	r2, r2, #1
	cmp	r2, #0
	strgt	r2, [r3, #44]
	ble	.L133
.L123:
	stmib	r3, {r0, r1}
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L132:
	add	r2, lr, #2
	cmp	r2, #4
	bhi	.L113
	add	r2, r5, #1
	rsbs	lr, r2, #0
	and	lr, lr, #3
	and	r2, r2, #3
	rsbpl	r2, lr, #0
	add	ip, r2, ip, lsl #2
	add	lr, r4, ip, lsl #3
	ldr	lr, [lr, #4]
	ldr	ip, [r4, ip, lsl #3]
	sub	lr, lr, r1, asr #4
	sub	ip, ip, r0, asr #4
	eor	r5, ip, ip, asr #31
	eor	r4, lr, lr, asr #31
	sub	r5, r5, ip, asr #31
	sub	r4, r4, lr, asr #31
	cmp	r5, r4
	mvnge	ip, ip
	lsrge	ip, ip, #31
	bge	.L115
	cmp	lr, #0
	movge	ip, #2
	movlt	ip, #3
.L115:
	str	r2, [r3, #68]
	mov	r2, #7
	str	r2, [r3, #60]
	ldr	r2, .L136+12
	mov	lr, #3
	strb	ip, [r3, #48]
	str	r2, [r3, #56]
	mov	ip, #0
	mov	r2, #5
	strb	lr, [r3, #64]
	str	ip, [r3, #52]
	str	ip, [r3, #72]
	str	r2, [r3, #44]
	b	.L117
.L113:
	cmp	lr, #0
	movge	ip, #6
	mvnlt	ip, #5
	movge	r2, #2
	movlt	r2, #3
	str	ip, [r3, #16]
	add	r1, r1, ip
	b	.L119
.L133:
	mov	lr, #6
	ldr	r2, [r3, #52]
	ldr	r4, [r3, #60]
	add	r2, r2, #1
	cmp	r2, r4
	str	r2, [r3, #52]
	str	lr, [r3, #44]
	blt	.L123
	cmp	ip, #3
	beq	.L134
.L125:
	mov	r2, #0
	stmib	r3, {r0, r1}
	str	r2, [r3, #52]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L111:
	ldr	r2, [r3, #72]
	cmp	r2, #0
	beq	.L135
.L117:
	mov	ip, #3
	b	.L121
.L134:
	ldr	ip, .L136+16
	mov	r2, #0
	str	ip, [r3, #56]
	mov	ip, #1
	strb	r2, [r3, #64]
	str	r2, [r3, #72]
	str	ip, [r3, #60]
	b	.L125
.L135:
	ldr	r2, [r3, #52]
	cmp	r2, #2
	ble	.L117
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
	b	.L117
.L137:
	.align	2
.L136:
	.word	.LANCHOR0+256
	.word	.LANCHOR2
	.word	.LANCHOR1+76
	.word	.LANCHOR1+48
	.word	.LANCHOR0+1136
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
	ldr	r4, .L146
	add	r5, r4, #880
.L140:
	ldr	r3, [r4]
	cmp	r3, #0
	movne	r0, r4
	blne	updateEnemy
.L139:
	add	r4, r4, #80
	cmp	r4, r5
	bne	.L140
	pop	{r4, r5, r6, lr}
	bx	lr
.L147:
	.align	2
.L146:
	.word	.LANCHOR0+256
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
	ldr	r4, .L159
	ldr	r7, .L159+4
	add	r6, r4, #768
.L156:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L150
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
	ble	.L154
	ldr	r9, [r4, #20]
	ldr	r5, [r4, #28]
	add	r9, r9, r2, asr #4
	add	r5, r9, r5
	sub	r5, r5, #1
	cmp	r5, #512
	movlt	r3, #0
	movge	r3, #1
	orrs	r3, r3, r9, lsr #31
	bne	.L154
	ldr	fp, [r4, #24]
	ldr	r10, [r4, #32]
	add	fp, fp, r1, asr #4
	add	r10, fp, r10
	sub	r10, r10, #1
	cmp	r10, #512
	movlt	r3, #0
	movge	r3, #1
	orrs	r3, r3, fp, lsr #31
	bne	.L154
	mov	r2, #2
	mov	r1, fp
	mov	r0, r9
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L153
.L154:
	str	r8, [r4]
.L150:
	add	r4, r4, #48
	cmp	r4, r6
	bne	.L156
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L153:
	mov	r1, fp
	mov	r2, #2
	mov	r0, r5
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L154
	mov	r0, r9
	mov	r2, #2
	mov	r1, r10
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L154
	mov	r1, r10
	mov	r0, r5
	mov	r2, #2
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L154
	b	.L150
.L160:
	.align	2
.L159:
	.word	.LANCHOR0+1144
	.word	mapCollide
	.size	updateBullets, .-updateBullets
	.align	2
	.global	checkBushCollision
	.syntax unified
	.arm
	.type	checkBushCollision, %function
checkBushCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L168
	ldr	lr, [r4, #1948]
	cmp	lr, #0
	ble	.L165
	add	r3, r4, #1952
	mov	r2, #0
	asr	r0, r0, #3
	asr	r1, r1, #3
	add	r3, r3, #4
	b	.L164
.L163:
	add	r2, r2, #1
	cmp	r2, lr
	add	r3, r3, #12
	beq	.L165
.L164:
	ldr	ip, [r3, #-4]
	cmp	ip, r0
	bne	.L163
	ldr	ip, [r3]
	cmp	ip, r1
	bne	.L163
	add	r2, r2, r2, lsl #1
	add	r4, r4, r2, lsl #2
	ldr	r0, [r4, #1960]
	rsbs	r0, r0, #1
	movcc	r0, #0
	pop	{r4, lr}
	bx	lr
.L165:
	mov	r0, #0
	pop	{r4, lr}
	bx	lr
.L169:
	.align	2
.L168:
	.word	.LANCHOR0
	.size	checkBushCollision, .-checkBushCollision
	.align	2
	.global	checkHitboxCollision
	.syntax unified
	.arm
	.type	checkHitboxCollision, %function
checkHitboxCollision:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldr	r4, .L203
	ldr	r2, [sp, #24]
	mov	r8, r0
	mov	r7, r3
	mov	r6, r1
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L171
.L173:
	mov	r0, #1
.L170:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L171:
	mov	r1, r6
	mov	r0, r5
	ldr	r2, [sp, #24]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L173
	mov	r1, r7
	mov	r0, r8
	ldr	r2, [sp, #24]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L173
	mov	r1, r7
	mov	r0, r5
	ldr	r2, [sp, #24]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L173
	ldr	r3, .L203+4
	ldr	r2, [r3, #1948]
	cmp	r2, #0
	ble	.L170
	add	r4, r3, #1952
	add	r4, r4, #4
	mov	r3, r4
	asr	lr, r8, #3
	asr	ip, r6, #3
	b	.L177
.L175:
	add	r0, r0, #1
	cmp	r0, r2
	add	r3, r3, #12
	beq	.L176
.L177:
	ldr	r1, [r3, #-4]
	cmp	lr, r1
	bne	.L175
	ldr	r1, [r3]
	cmp	ip, r1
	bne	.L175
	ldr	r3, .L203+4
	add	r0, r0, r0, lsl #1
	add	r3, r3, r0, lsl #2
	ldr	r3, [r3, #1960]
	cmp	r3, #0
	beq	.L173
.L176:
	mov	r3, r4
	mov	r1, #0
	asr	r0, r5, #3
	b	.L180
.L178:
	add	r1, r1, #1
	cmp	r1, r2
	add	r3, r3, #12
	beq	.L179
.L180:
	ldr	r5, [r3, #-4]
	cmp	r0, r5
	bne	.L178
	ldr	r5, [r3]
	cmp	ip, r5
	bne	.L178
	ldr	r3, .L203+4
	add	r1, r1, r1, lsl #1
	add	r3, r3, r1, lsl #2
	ldr	r3, [r3, #1960]
	cmp	r3, #0
	beq	.L173
.L179:
	mov	r3, r4
	mov	r1, #0
	asr	ip, r7, #3
	b	.L183
.L181:
	add	r1, r1, #1
	cmp	r2, r1
	add	r3, r3, #12
	beq	.L201
.L183:
	ldr	r5, [r3, #-4]
	cmp	lr, r5
	bne	.L181
	ldr	r5, [r3]
	cmp	ip, r5
	bne	.L181
	ldr	r3, .L203+4
	add	r1, r1, r1, lsl #1
	add	r3, r3, r1, lsl #2
	ldr	r3, [r3, #1960]
	cmp	r3, #0
	beq	.L173
.L201:
	mov	r3, #0
	b	.L185
.L184:
	add	r3, r3, #1
	cmp	r2, r3
	add	r4, r4, #12
	beq	.L202
.L185:
	ldr	r1, [r4, #-4]
	cmp	r0, r1
	bne	.L184
	ldr	r1, [r4]
	cmp	ip, r1
	bne	.L184
	ldr	r2, .L203+4
	add	r3, r3, r3, lsl #1
	add	ip, r2, r3, lsl #2
	ldr	r0, [ip, #1960]
	rsbs	r0, r0, #1
	movcc	r0, #0
	b	.L170
.L202:
	mov	r0, #0
	b	.L170
.L204:
	.align	2
.L203:
	.word	mapCollide
	.word	.LANCHOR0
	.size	checkHitboxCollision, .-checkHitboxCollision
	.align	2
	.global	moveAndCollidePlayer
	.syntax unified
	.arm
	.type	moveAndCollidePlayer, %function
moveAndCollidePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #10
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L222+8
	ldr	r1, [r4, #8]
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #16]
	add	r3, r3, r1
	ldr	r1, [r4, #20]
	add	r0, r0, r3, asr #4
	add	r1, r1, r2, asr #4
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #24]
	sub	sp, sp, #12
	add	r3, r1, r3
	add	r2, r0, r2
	sub	r3, r3, #1
	str	ip, [sp]
	sub	r2, r2, #1
	bl	checkHitboxCollision
	cmp	r0, #0
	movne	r3, #0
	mov	r0, #10
	strne	r3, [r4, #8]
	ldr	r1, [r4, #12]
	ldr	r3, [r4, #4]
	add	r3, r3, r1
	ldr	r1, [r4, #20]
	ldr	r2, [r4]
	add	r1, r1, r3, asr #4
	ldr	r3, [r4, #28]
	str	r0, [sp]
	ldr	r0, [r4, #16]
	add	r0, r0, r2, asr #4
	ldr	r2, [r4, #24]
	add	r3, r1, r3
	add	r2, r0, r2
	sub	r2, r2, #1
	sub	r3, r3, #1
	bl	checkHitboxCollision
	cmp	r0, #0
	movne	r2, #0
	ldr	r3, [r4, #8]
	ldr	r6, [r4]
	ldr	r5, [r4, #4]
	strne	r2, [r4, #12]
	beq	.L221
.L208:
	mov	r2, #0
.L209:
	add	r6, r3, r6
	add	r0, r2, r5
.L210:
	str	r0, [r4, #4]
	str	r6, [r4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L221:
	ldr	r9, [r4, #12]
	cmp	r3, #0
	mov	r2, r9
	beq	.L209
	cmp	r9, #0
	beq	.L208
	ldr	r10, .L222+12
	mov	r0, r3
	mov	lr, pc
	bx	r10
	ldr	fp, .L222+16
	adr	r3, .L222
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	fp
	mov	r7, r0
	mov	r0, r6
	mov	r8, r1
	mov	lr, pc
	bx	r10
	ldr	ip, .L222+20
	mov	r2, r0
	mov	r3, r1
	mov	r0, r7
	mov	r1, r8
	mov	lr, pc
	bx	ip
	ldr	r3, .L222+24
	mov	lr, pc
	bx	r3
	mov	r6, r0
	mov	r0, r9
	mov	lr, pc
	bx	r10
	adr	r3, .L222
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	fp
	mov	r7, r0
	mov	r0, r5
	mov	r8, r1
	mov	lr, pc
	bx	r10
	ldr	ip, .L222+20
	mov	r2, r0
	mov	r3, r1
	mov	r0, r7
	mov	r1, r8
	mov	lr, pc
	bx	ip
	ldr	r3, .L222+24
	mov	lr, pc
	bx	r3
	b	.L210
.L223:
	.align	3
.L222:
	.word	1717986918
	.word	1073112678
	.word	.LANCHOR0
	.word	__aeabi_i2d
	.word	__aeabi_ddiv
	.word	__aeabi_dadd
	.word	__aeabi_d2iz
	.size	moveAndCollidePlayer, .-moveAndCollidePlayer
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Player state: %d, frame: %d\000"
	.text
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L266
	ldr	r3, [r4, #32]
	sub	r3, r3, #1
	cmp	r3, #0
	ldr	r2, [r4, #40]
	str	r3, [r4, #32]
	ldrb	r1, [r4, #52]	@ zero_extendqisi2
	ble	.L263
.L226:
	ldr	r3, .L266+4
	ldr	r0, .L266+8
	mov	lr, pc
	bx	r3
	ldrb	r3, [r4, #52]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L230
	cmp	r3, #4
	beq	.L231
	cmp	r3, #2
	bne	.L232
	bl	setPlayerMovementFromInputs
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	add	r2, r2, r2, lsl #1
	add	r3, r3, r3, lsl #1
	add	r2, r2, r2, lsr #31
	add	r3, r3, r3, lsr #31
	asr	r2, r2, #1
	asr	r3, r3, #1
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	bl	moveAndCollidePlayer
.L233:
	ldr	r2, [r4]
	ldr	r5, [r4, #16]
	ldr	r3, [r4, #4]
	ldr	r6, [r4, #20]
	add	r5, r5, r2, asr #4
	add	r6, r6, r3, asr #4
	mov	r1, r6
	mov	r0, r5
	ldr	r7, .L266+12
	add	r8, r4, #24
	ldm	r8, {r8, r9}
	mov	lr, pc
	bx	r7
	cmp	r0, #2
	beq	.L246
	add	r3, r8, r5
	sub	r8, r3, #1
	mov	r1, r6
	mov	r0, r8
	mov	lr, pc
	bx	r7
	cmp	r0, #2
	beq	.L246
	add	r6, r9, r6
	mov	r0, r5
	sub	r1, r6, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #2
	beq	.L246
	mov	r0, r8
	sub	r1, r6, #1
	mov	lr, pc
	bx	r7
	cmp	r0, #2
	beq	.L246
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L231:
	ldrb	r3, [r4, #36]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #10
	streq	r3, [r4, #8]
	beq	.L235
	cmp	r3, #1
	mvneq	r3, #9
	streq	r3, [r4, #8]
	beq	.L235
	cmp	r3, #3
	moveq	r3, #10
	mvnne	r3, #9
	str	r3, [r4, #12]
.L235:
	bl	moveAndCollidePlayer
	b	.L233
.L246:
	mov	r2, #1
	mov	r0, #6
	ldr	r3, .L266+16
	str	r2, [r4, #2736]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L263:
	mov	r3, #6
	ldr	r0, [r4, #48]
	add	r2, r2, #1
	cmp	r2, r0
	str	r2, [r4, #40]
	str	r3, [r4, #32]
	blt	.L226
	sub	r3, r1, #2
	cmp	r3, #2
	bhi	.L229
	mov	r3, #0
	mov	r2, #1
	add	r1, r4, #56
	str	r1, [r4, #44]
	mov	r1, r3
	strb	r3, [r4, #52]
	str	r2, [r4, #48]
	str	r3, [r4, #64]
.L229:
	mov	r3, #0
	mov	r2, r3
	str	r3, [r4, #40]
	b	.L226
.L232:
	ldr	r3, .L266+20
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L241
	ldr	r2, .L266+24
	ldrh	r0, [r2]
	ands	r0, r0, #512
	beq	.L264
.L241:
	tst	r3, #1
	beq	.L242
	ldr	r3, .L266+24
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L265
.L242:
	bl	setPlayerMovementFromInputs
	bl	moveAndCollidePlayer
	add	r2, r4, #8
	ldmia	r2, {r2, r3}
	orr	r3, r2, r3
	cmp	r3, #0
	mov	r2, #1
	movne	r3, #5
	ldreq	r1, .L266+28
	ldrne	r1, .L266+32
	strbeq	r3, [r4, #52]
	streq	r1, [r4, #44]
	streq	r3, [r4, #40]
	streq	r2, [r4, #48]
	strne	r1, [r4, #44]
	strbne	r2, [r4, #52]
	strne	r3, [r4, #48]
	b	.L233
.L230:
	mov	r3, #0
	ldr	r2, [r4, #40]
	cmp	r2, #1
	str	r3, [r4, #8]
	str	r3, [r4, #12]
	bgt	.L233
	ldrb	r3, [r4, #36]	@ zero_extendqisi2
	cmp	r3, #0
	mvneq	r3, #7
	streq	r3, [r4, #8]
	beq	.L235
	cmp	r3, #1
	bne	.L236
	mov	r3, #8
	str	r3, [r4, #8]
	b	.L235
.L264:
	mov	r3, #6
	mov	r1, #2
	ldr	r2, .L266+36
	str	r2, [r4, #44]
	ldr	r2, .L266+16
	str	r0, [r4, #40]
	str	r3, [r4, #48]
	strb	r1, [r4, #52]
	str	r3, [r4, #32]
	mov	lr, pc
	bx	r2
	b	.L233
.L236:
	cmp	r3, #3
	bne	.L237
	mvn	r3, #7
	str	r3, [r4, #12]
	b	.L235
.L265:
	bl	attack
	b	.L233
.L237:
	cmp	r3, #2
	moveq	r3, #8
	streq	r3, [r4, #12]
	b	.L235
.L267:
	.align	2
.L266:
	.word	.LANCHOR0
	.word	mgba_printf
	.word	.LC0
	.word	colorAt
	.word	playAnalogSound
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0+56
	.word	.LANCHOR1+120
	.word	.LANCHOR1+96
	.size	updatePlayer, .-updatePlayer
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"Player hit by bullet!\000"
	.align	2
.LC3:
	.ascii	"Enemy hit!\000"
	.align	2
.LC4:
	.ascii	"Enemy hit by slash!\000"
	.align	2
.LC5:
	.ascii	"Player hit!\000"
	.text
	.align	2
	.global	checkEntityCollisions
	.syntax unified
	.arm
	.type	checkEntityCollisions, %function
checkEntityCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L335
	ldr	r1, .L335+4
	ldr	r6, [r4]
	ldr	r5, [r4, #4]
	ldrb	r3, [r4, #36]	@ zero_extendqisi2
	sub	sp, sp, #60
	asr	r6, r6, #4
	asr	r5, r5, #4
	cmp	r3, #3
	bhi	.L269
	add	r3, r3, r3
	ldrh	r3, [r1, r3]
	add	pc, pc, r3, lsl #2
.Lrtx271:
	nop
	.section	.rodata
	.align	1
.L271:
	.2byte	(.L274-.Lrtx271-4)/4
	.2byte	(.L273-.Lrtx271-4)/4
	.2byte	(.L272-.Lrtx271-4)/4
	.2byte	(.L270-.Lrtx271-4)/4
	.text
	.p2align 2
.L272:
	mov	r3, #8
	mov	r2, #16
	str	r3, [sp, #48]
	add	r3, r5, #12
	str	r6, [sp, #28]
	str	r3, [sp, #44]
.L269:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L275
	add	r1, sp, #44
	ldm	r1, {r1, r3}
	add	r3, r1, r3
	sub	r3, r3, #1
	asr	r3, r3, #3
	cmp	r3, r1, asr #3
	asr	fp, r1, #3
	blt	.L275
	ldr	r1, [sp, #28]
	add	r8, r1, r2
	sub	r8, r8, #1
	ldr	r10, .L335+8
	str	r2, [sp, #32]
	str	r6, [sp, #36]
	str	r5, [sp, #40]
	str	r3, [sp, #24]
	asr	r8, r8, #3
	asr	r3, r1, #3
.L276:
	cmp	r3, r8
	movle	r9, r3
	strle	r3, [sp, #20]
	lslle	r7, fp, #3
	ble	.L278
	b	.L279
.L280:
	add	r9, r9, #1
	cmp	r8, r9
	blt	.L330
.L278:
	mov	r1, r7
	lsl	r0, r9, #3
	mov	lr, pc
	bx	r10
	cmp	r0, #4
	bne	.L280
	ldr	r2, [r4, #1948]
	cmp	r2, #0
	ble	.L280
	mov	r5, #0
	ldr	r6, .L335+12
	b	.L282
.L281:
	ldr	r3, [r4, #1948]
	add	r5, r5, #1
	cmp	r3, r5
	add	r6, r6, #12
	ble	.L280
.L282:
	ldr	r3, [r6]
	cmp	r3, r9
	bne	.L281
	ldr	r3, [r6, #4]
	cmp	r3, fp
	bne	.L281
	ldr	r3, [r6, #8]
	cmp	r3, #0
	bne	.L281
	mov	r3, #1
	mov	r2, fp
	str	r3, [r6, #8]
	mov	r1, r9
	mov	r3, #129
	mov	r0, #24
	ldr	ip, .L335+16
	mov	lr, pc
	bx	ip
	mov	r0, #4
	ldr	r3, .L335+20
	mov	lr, pc
	bx	r3
	b	.L281
.L330:
	ldr	r3, [sp, #20]
.L279:
	ldr	r2, [sp, #24]
	add	fp, fp, #1
	cmp	r2, fp
	bge	.L276
	add	r2, sp, #32
	ldm	r2, {r2, r6}
	ldr	r5, [sp, #40]
.L275:
	ldrb	r3, [r4, #52]	@ zero_extendqisi2
	sub	r3, r3, #2
	tst	r3, #253
	ldr	r3, [r4, #16]
	add	r1, r6, r3
	ldr	r3, [r4, #20]
	add	r0, r5, r3
	ldr	r3, [r4, #24]
	add	r3, r1, r3
	str	r3, [sp, #40]
	ldr	r3, [r4, #28]
	add	r3, r0, r3
	str	r1, [sp, #24]
	str	r0, [sp, #32]
	str	r3, [sp, #52]
	beq	.L290
	ldr	r5, .L335+24
	mov	r8, #0
	ldr	r7, .L335+28
	ldr	r9, .L335+20
	ldr	r10, .L335+32
	ldr	fp, .L335+36
	str	r2, [sp, #20]
	add	r6, r5, #768
	b	.L289
.L287:
	add	r5, r5, #48
	cmp	r6, r5
	beq	.L331
.L289:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L287
	ldr	r2, [r5, #32]
	ldr	r1, [r5, #8]
	ldr	r3, [r5, #24]
	str	r2, [sp, #12]
	add	r3, r3, r1, asr #4
	ldr	r1, [r5, #28]
	str	r3, [sp, #4]
	ldr	r2, [r5, #4]
	str	r1, [sp, #8]
	ldr	r3, [r5, #20]
	add	r3, r3, r2, asr #4
	str	r3, [sp]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r1, [sp, #32]
	ldr	r0, [sp, #24]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L287
	ldr	r3, [r4, #2740]
	str	r8, [r5]
	sub	r3, r3, #1
	mov	r0, #2
	str	r3, [r4, #2740]
	mov	lr, pc
	bx	r9
	mov	r3, #4
	strb	r3, [r4, #52]
	mov	r3, #3
	ldr	r0, .L335+40
	add	r5, r5, #48
	str	r10, [r4, #44]
	str	r8, [r4, #40]
	str	r3, [r4, #48]
	mov	lr, pc
	bx	fp
	cmp	r6, r5
	bne	.L289
.L331:
	ldr	r2, [sp, #20]
.L290:
	mov	r8, #0
	ldr	r3, [sp, #28]
	add	r3, r3, r2
	str	r3, [sp, #36]
	ldr	r6, .L335+44
	ldr	fp, .L335+28
.L285:
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L292
	ldr	r9, [r6, #4]
	ldr	r3, [r6, #20]
	ldr	r2, [r6, #28]
	ldr	r1, [sp, #28]
	add	r3, r3, r9, asr #4
	add	r2, r3, r2
	cmp	r2, r1
	ldr	r10, [r6, #8]
	ble	.L293
	ldr	r2, [sp, #36]
	cmp	r3, r2
	bge	.L293
	ldr	r3, [r6, #24]
	ldr	r2, [r6, #32]
	ldr	r1, [sp, #44]
	add	r3, r3, r10, asr #4
	add	r2, r3, r2
	cmp	r2, r1
	ble	.L293
	ldr	r2, [sp, #48]
	add	r2, r1, r2
	cmp	r3, r2
	bge	.L293
	ldr	r3, [r4, #64]
	cmp	r3, #0
	bne	.L332
.L293:
	mov	r7, #0
	ldr	r5, .L335+48
.L296:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L295
	ldr	r1, [r5, #24]
	ldr	r2, [r6, #24]
	str	r1, [sp, #20]
	ldr	r1, [r6, #32]
	add	r2, r2, r10, asr #4
	ldr	r3, [r6, #20]
	ldr	lr, [r5, #8]
	ldr	ip, [r5, #4]
	ldr	r0, [r5, #20]
	str	r1, [sp, #12]
	str	r2, [sp, #4]
	ldr	r2, [r6, #28]
	add	r3, r3, r9, asr #4
	str	r2, [sp, #8]
	str	r3, [sp]
	ldr	r1, [sp, #20]
	add	r2, r5, #28
	ldm	r2, {r2, r3}
	add	r1, r1, lr, asr #4
	add	r0, r0, ip, asr #4
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	bne	.L333
.L295:
	add	r7, r7, #1
	cmp	r7, #3
	add	r5, r5, #48
	bne	.L296
	ldrb	r3, [r4, #52]	@ zero_extendqisi2
	sub	r3, r3, #2
	tst	r3, #253
	beq	.L292
	ldr	r2, [r6, #20]
	ldr	r3, [r6, #28]
	add	r2, r2, r9, asr #4
	ldr	r1, [sp, #24]
	add	r3, r2, r3
	ldr	r0, [sp, #40]
	cmp	r3, r1
	movle	r3, #0
	movgt	r3, #1
	cmp	r2, r0
	movge	r3, #0
	cmp	r3, #0
	bne	.L334
.L292:
	add	r8, r8, #1
	cmp	r8, #11
	add	r6, r6, #80
	bne	.L285
.L268:
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L334:
	ldr	r2, [r6, #24]
	ldr	r3, [r6, #32]
	add	r2, r2, r10, asr #4
	ldr	r1, [sp, #32]
	add	r3, r2, r3
	ldr	r0, [sp, #52]
	cmp	r3, r1
	movle	r3, #0
	movgt	r3, #1
	cmp	r2, r0
	movge	r3, #0
	cmp	r3, #0
	beq	.L292
	ldr	r0, .L335+52
	ldr	r3, .L335+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L335+20
	mov	r0, #2
	mov	lr, pc
	bx	r3
	mov	r3, #4
	strb	r3, [r4, #52]
	mov	r3, #0
	str	r3, [r4, #40]
	ldr	r3, [r4, #2740]
	sub	r3, r3, #1
	str	r3, [r4, #2740]
	ldr	r3, .L335+32
	str	r7, [r4, #48]
	str	r3, [r4, #44]
	b	.L292
.L274:
	mov	r3, #16
	str	r3, [sp, #48]
	sub	r3, r6, #4
	mov	r2, #8
	str	r5, [sp, #44]
	str	r3, [sp, #28]
	b	.L269
.L273:
	mov	r3, #16
	str	r3, [sp, #48]
	add	r3, r6, #12
	mov	r2, #8
	str	r5, [sp, #44]
	str	r3, [sp, #28]
	b	.L269
.L270:
	mov	r3, #8
	str	r3, [sp, #48]
	sub	r3, r5, #4
	mov	r2, #16
	str	r6, [sp, #28]
	str	r3, [sp, #44]
	b	.L269
.L333:
	mov	r5, #0
	add	r7, r7, r7, lsl #1
	add	r3, r4, r7, lsl #4
	ldr	r2, .L335+36
	ldr	r0, .L335+56
	str	r5, [r3, #112]
	mov	lr, pc
	bx	r2
	mov	r0, #3
	ldr	r3, .L335+20
	mov	lr, pc
	bx	r3
	add	r8, r8, r8, lsl #2
	add	r4, r4, r8, lsl #4
	str	r5, [r4, #256]
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L332:
	ldr	r0, .L335+60
	ldr	r3, .L335+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L335+20
	mov	r0, #3
	mov	lr, pc
	bx	r3
	mov	r2, #0
	add	r8, r8, r8, lsl #2
	add	r3, r4, r8, lsl #4
	str	r2, [r3, #256]
	b	.L268
.L336:
	.align	2
.L335:
	.word	.LANCHOR0
	.word	.L271
	.word	colorAt
	.word	.LANCHOR0+1952
	.word	setMapTile
	.word	playAnalogSound
	.word	.LANCHOR0+1144
	.word	hitboxCollide
	.word	.LANCHOR1+144
	.word	mgba_printf
	.word	.LC2
	.word	.LANCHOR0+256
	.word	.LANCHOR0+112
	.word	.LC5
	.word	.LC4
	.word	.LC3
	.size	checkEntityCollisions, .-checkEntityCollisions
	.align	2
	.global	updateKorok
	.syntax unified
	.arm
	.type	updateKorok, %function
updateKorok:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L347
	ldr	r2, [r3, #1928]
	sub	r2, r2, #1
	cmp	r2, #0
	push	{r4, lr}
	strgt	r2, [r3, #1928]
	bgt	.L339
	mov	ip, #20
	ldr	r0, [r3, #1932]
	ldr	r1, [r3, #1940]
	str	ip, [r3, #1928]
	ldr	r2, .L347+4
	add	r0, r0, #1
	mov	lr, pc
	bx	r2
	ldr	r3, .L347
	str	r1, [r3, #1932]
.L339:
	ldr	r2, [r3, #1916]
	ldr	r1, [r3]
	sub	r0, r2, #255
	cmp	r0, r1
	bgt	.L340
	add	r2, r2, #255
	cmp	r1, r2
	ble	.L346
.L340:
	mov	r2, #0
	str	r2, [r3, #1924]
.L337:
	pop	{r4, lr}
	bx	lr
.L346:
	ldr	r2, [r3, #1920]
	ldr	r1, [r3, #4]
	sub	r0, r2, #255
	cmp	r0, r1
	bgt	.L340
	add	r2, r2, #255
	cmp	r1, r2
	bgt	.L340
	ldr	r2, [r3, #2732]
	cmp	r2, #0
	bne	.L340
	mov	r2, #1
	ldr	r1, .L347+8
	ldrh	r1, [r1]
	tst	r1, #2
	str	r2, [r3, #1924]
	beq	.L337
	ldr	r1, .L347+12
	ldrh	r1, [r1]
	tst	r1, #2
	bne	.L337
	ldr	r1, .L347+16
	mov	r0, #5
	mov	lr, pc
	bx	r1
	mov	r1, #12
	mov	r2, #1
	ldr	r3, .L347
	str	r2, [r3, #2732]
	str	r1, [r3, #2740]
	b	.L337
.L348:
	.align	2
.L347:
	.word	.LANCHOR0
	.word	__aeabi_idivmod
	.word	oldButtons
	.word	buttons
	.word	playAnalogSound
	.size	updateKorok, .-updateKorok
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
	bl	updateSlashes
	ldr	r4, .L357
	add	r5, r4, #880
.L351:
	ldr	r3, [r4]
	cmp	r3, #0
	movne	r0, r4
	blne	updateEnemy
.L350:
	add	r4, r4, #80
	cmp	r4, r5
	bne	.L351
	bl	updateBullets
	bl	updateKorok
	bl	checkEntityCollisions
	bl	updateCamera
	ldr	r0, .L357+4
	ldr	r2, [r0, #2720]
	cmp	r2, #0
	movge	r3, r2
	mov	ip, #83886080
	addlt	r3, r2, #15
	asr	r3, r3, #4
	add	r2, r2, #1
	str	r2, [r0, #2720]
	rsbs	r2, r3, #0
	ldr	r1, .L357+8
	and	r2, r2, #7
	and	r3, r3, #7
	rsbpl	r3, r2, #0
	add	r3, r1, r3, lsl #2
	ldr	r3, [r3, #352]
	pop	{r4, r5, r6, lr}
	strh	r3, [ip, #24]	@ movhi
	bx	lr
.L358:
	.align	2
.L357:
	.word	.LANCHOR0+256
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
	ldr	r2, .L381
	ldr	ip, [r2, #2728]
	ldr	lr, [r2, #2724]
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
	ldr	r5, .L381+4
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
	beq	.L379
	orr	r1, r1, #16384
	cmp	r0, #0
	strh	r1, [r4, #2]	@ movhi
	bne	.L363
	lsl	r3, r3, #22
	lsr	r3, r3, #22
	orr	r3, r3, #2048
	cmp	r6, #0
	strh	r3, [r4, #4]	@ movhi
	beq	.L364
	ldr	r1, [r2, #96]
	ldr	r1, [r1, r7, lsl #2]
	ldr	r3, .L381+8
	lsl	r1, r1, #22
	add	r3, r3, r7, lsl #3
	lsr	r1, r1, #22
	str	r1, [sp, #4]
	ldr	r1, [r3, #384]
	ldr	r3, [r3, #388]
	add	r3, r3, r8, asr #4
	str	r3, [sp]
	add	fp, r1, r9, asr #4
.L367:
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
.L379:
	lsl	r3, r3, #22
	lsr	r3, r3, #22
	orr	r1, r1, #20480
	orr	r3, r3, #2048
	cmp	r6, #0
	strh	r1, [r4, #2]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	bne	.L361
.L364:
	mov	r1, #512
	ldrb	r3, [r2, #104]	@ zero_extendqisi2
	lsl	r3, r3, #3
	strh	r1, [r5, r3]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L361:
	ldr	r1, [r2, #96]
	ldr	r1, [r1, r7, lsl #2]
	ldr	r3, .L381+8
	lsl	r1, r1, #22
	add	r3, r3, r7, lsl #3
	lsr	r1, r1, #22
	str	r1, [sp, #4]
	ldr	r1, [r3, #384]
	ldr	r3, [r3, #388]
	add	r3, r3, r8, asr #4
	mov	r0, #4096
	str	r3, [sp]
	rsb	fp, r1, r9, asr #4
	b	.L367
.L363:
	ldr	r1, .L381+12
	cmp	r6, #0
	sub	r6, r0, #1
	add	r3, r3, r6, lsl #7
	and	r3, r3, r1
	orr	r3, r3, #2048
	strh	r3, [r4, #4]	@ movhi
	beq	.L364
	cmp	r0, #3
	beq	.L366
	bhi	.L380
	ldr	r0, [r2, #96]
	ldr	r0, [r0, r7, lsl #2]
	ldr	r3, .L381+8
	add	r0, r0, #128
	and	r1, r0, r1
	add	r3, r3, r7, lsl #3
	str	r1, [sp, #4]
	ldr	r1, [r3, #416]
	ldr	r3, [r3, #420]
	add	r3, r3, r8, asr #4
	mov	r0, #0
	str	r3, [sp]
	add	fp, r1, r9, asr #4
	b	.L367
.L366:
	ldr	r0, [r2, #96]
	ldr	r0, [r0, r7, lsl #2]
	ldr	r3, .L381+8
	add	r0, r0, #256
	and	r1, r0, r1
	add	r3, r3, r7, lsl #3
	str	r1, [sp, #4]
	ldr	r1, [r3, #448]
	ldr	r3, [r3, #452]
	add	r3, r3, r8, asr #4
	mov	r0, #0
	str	r3, [sp]
	add	fp, r1, r9, asr #4
	b	.L367
.L380:
	mov	r0, #0
	b	.L367
.L382:
	.align	2
.L381:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	.LANCHOR2
	.word	1023
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawSlashes
	.syntax unified
	.arm
	.type	drawSlashes, %function
drawSlashes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L392
	ldr	r6, .L392+4
	ldr	r8, .L392+8
	sub	sp, sp, #8
	add	r7, r4, #144
	sub	r5, r4, #112
.L389:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L386
	mov	r3, #8
	ldr	r1, [r4, #8]
	ldr	r2, [r5, #2728]
	ldr	r0, [r4, #4]
	rsb	r2, r2, r1, asr #4
	ldr	r1, [r5, #2724]
	rsb	r1, r1, r0, asr #4
	ldrb	r0, [r4, #44]	@ zero_extendqisi2
	str	r3, [sp]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L386
	ldmib	r4, {ip, lr}
	ldr	r3, [r5, #2728]
	ldrb	r2, [r4, #44]	@ zero_extendqisi2
	rsb	r3, r3, lr, asr #4
	lsl	r1, r2, #3
	and	r3, r3, #255
	strh	r3, [r6, r1]	@ movhi
	ldr	r3, [r5, #2724]
	rsb	r3, r3, ip, asr #4
	ldrb	ip, [r4, #36]	@ zero_extendqisi2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	cmp	ip, #1
	add	r2, r6, r2, lsl #3
	orr	lr, r3, #16384
	orreq	r3, r3, #20480
	ldr	r0, .L392+12
	strheq	r3, [r2, #2]	@ movhi
	beq	.L388
	cmp	ip, #0
	strh	lr, [r2, #2]	@ movhi
	strheq	r0, [r2, #4]	@ movhi
	bne	.L388
.L385:
	add	r4, r4, #48
	cmp	r4, r7
	bne	.L389
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L386:
	mov	r2, #512
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	lsl	r3, r3, #3
	strh	r2, [r6, r3]	@ movhi
	b	.L385
.L388:
	ldr	r3, .L392+16
	lsl	ip, ip, #7
	sub	ip, ip, #38
	and	r3, ip, r3
	add	r1, r6, r1
	orr	r3, r3, #2048
	strh	r3, [r1, #4]	@ movhi
	b	.L385
.L393:
	.align	2
.L392:
	.word	.LANCHOR0+112
	.word	shadowOAM
	.word	clipSpritesOffScreen
	.word	2138
	.word	1022
	.size	drawSlashes, .-drawSlashes
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L404
	ldr	r6, .L404+4
	ldr	r8, .L404+8
	ldr	r9, .L404+12
	sub	sp, sp, #12
	add	r7, r4, #880
	sub	r5, r4, #256
	b	.L400
.L395:
	mov	r3, #16
	ldr	lr, [r4, #8]
	ldr	r2, [r5, #2728]
	ldr	ip, [r4, #4]
	ldr	r1, [r5, #2724]
	ldrb	r0, [r4, #76]	@ zero_extendqisi2
	rsb	r2, r2, lr, asr #4
	str	r3, [sp]
	rsb	r1, r1, ip, asr #4
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L397
	add	r1, r4, #52
	ldm	r1, {r1, r3}
	ldr	r2, [r4, #8]
	ldr	r3, [r3, r1, lsl #2]
	ldr	r0, [r5, #2728]
	ldr	r1, [r5, #2724]
	rsb	r0, r0, r2, asr #4
	lsl	r3, r3, #16
	ldr	r2, [r4, #4]
	lsr	r3, r3, #16
	rsb	r1, r1, r2, asr #4
	ldrb	lr, [r4, #48]	@ zero_extendqisi2
	add	r2, r3, #384
	ldrb	ip, [r4, #76]	@ zero_extendqisi2
	lsl	r2, r2, #22
	and	r1, r1, r9
	cmp	lr, #1
	lsr	r2, r2, #22
	and	r0, r0, #255
	orr	r10, r1, #16384
	orr	fp, r2, #2048
	orreq	r1, r1, #20480
	lsl	r2, ip, #3
	add	ip, r6, ip, lsl #3
	strh	r0, [r6, r2]	@ movhi
	strheq	r1, [ip, #2]	@ movhi
	beq	.L399
	cmp	lr, #0
	strh	r10, [ip, #2]	@ movhi
	strheq	fp, [ip, #4]	@ movhi
	bne	.L399
.L396:
	add	r4, r4, #80
	cmp	r4, r7
	beq	.L403
.L400:
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L395
.L397:
	mov	r2, #512
	ldrb	r3, [r4, #76]	@ zero_extendqisi2
	add	r4, r4, #80
	lsl	r3, r3, #3
	cmp	r4, r7
	strh	r2, [r6, r3]	@ movhi
	bne	.L400
.L403:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L399:
	add	lr, lr, #5
	add	r3, r3, lr, lsl #6
	lsl	r3, r3, #22
	lsr	r3, r3, #22
	add	r2, r6, r2
	orr	r3, r3, #2048
	strh	r3, [r2, #4]	@ movhi
	b	.L396
.L405:
	.align	2
.L404:
	.word	.LANCHOR0+256
	.word	shadowOAM
	.word	clipSpritesOffScreen
	.word	511
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
	ldr	r4, .L416
	sub	r5, r4, #1136
	ldr	r6, .L416+4
	ldr	r8, .L416+8
	ldr	r9, .L416+12
	sub	sp, sp, #8
	add	r7, r4, #768
	sub	r5, r5, #8
	b	.L412
.L407:
	mov	r3, #8
	ldr	lr, [r4, #8]
	ldr	r2, [r5, #2728]
	ldr	ip, [r4, #4]
	ldr	r1, [r5, #2724]
	ldrb	r0, [r4, #44]	@ zero_extendqisi2
	rsb	r2, r2, lr, asr #4
	str	r3, [sp]
	rsb	r1, r1, ip, asr #4
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L409
	ldr	r3, [r5, #2724]
	ldr	r10, [r4, #4]
	ldr	r1, [r4, #8]
	ldr	r0, [r5, #2728]
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
	ldr	ip, .L416+16
	strh	r0, [r6, r1]	@ movhi
	strheq	r3, [lr, #2]	@ movhi
	beq	.L411
	cmp	r2, #0
	strh	r3, [lr, #2]	@ movhi
	strheq	ip, [lr, #4]	@ movhi
	bne	.L411
.L408:
	add	r4, r4, #48
	cmp	r4, r7
	beq	.L415
.L412:
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L407
.L409:
	mov	r2, #512
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	add	r4, r4, #48
	lsl	r3, r3, #3
	cmp	r4, r7
	strh	r2, [r6, r3]	@ movhi
	bne	.L412
.L415:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L411:
	lsl	r2, r2, #6
	ldr	r3, .L416+20
	add	r2, r2, #344
	add	r2, r2, #2
	and	r3, r2, r3
	add	r1, r6, r1
	orr	r3, r3, #2048
	strh	r3, [r1, #4]	@ movhi
	b	.L408
.L417:
	.align	2
.L416:
	.word	.LANCHOR0+1144
	.word	shadowOAM
	.word	clipSpritesOffScreen
	.word	511
	.word	2458
	.word	1022
	.size	drawBullets, .-drawBullets
	.align	2
	.global	drawKorok
	.syntax unified
	.arm
	.type	drawKorok, %function
drawKorok:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L424
	ldr	r3, [r4, #1912]
	cmp	r3, #0
	sub	sp, sp, #12
	bne	.L419
.L421:
	mov	r1, #512
	ldrb	r3, [r4, #1944]	@ zero_extendqisi2
	ldr	r2, .L424+4
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L419:
	ldr	r3, [r4, #2728]
	ldr	r2, [r4, #1920]
	rsb	r2, r3, r2, asr #4
	mov	r3, #16
	ldr	r0, [r4, #1916]
	ldr	r1, [r4, #2724]
	ldr	ip, .L424+8
	rsb	r1, r1, r0, asr #4
	ldrb	r0, [r4, #1944]	@ zero_extendqisi2
	str	r3, [sp]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L421
	ldr	r1, [r4, #1920]
	ldr	r3, [r4, #2728]
	rsb	r3, r3, r1, asr #4
	lsl	lr, r3, #16
	ldr	r1, [r4, #1932]
	and	r5, r3, #255
	ldr	r3, [r4, #1936]
	ldr	r3, [r3, r1, lsl #2]
	lsl	r3, r3, #22
	lsr	r3, r3, #22
	ldr	ip, [r4, #1916]
	orr	r1, r3, #2048
	ldr	r3, [r4, #2724]
	rsb	r3, r3, ip, asr #4
	ldr	ip, [r4, #1924]
	ldrb	r2, [r4, #1944]	@ zero_extendqisi2
	ldr	r0, .L424+4
	cmp	ip, #0
	lsl	ip, r3, #23
	add	r4, r0, r2, lsl #3
	lsr	ip, ip, #23
	strh	r1, [r4, #4]	@ movhi
	lsl	r3, r3, #16
	lsl	r1, r2, #3
	orr	ip, ip, #16384
	strh	ip, [r4, #2]	@ movhi
	strh	r5, [r0, r1]	@ movhi
	lsr	lr, lr, #16
	lsr	r3, r3, #16
	add	r2, r2, #1
	beq	.L422
	sub	lr, lr, #8
	lsl	r1, r2, #3
	and	lr, lr, #255
	strh	lr, [r0, r1]	@ movhi
	mov	r1, #1728
	add	r3, r3, #8
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	add	r2, r0, r2, lsl #3
	orr	r3, r3, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L422:
	mov	r3, #512
	lsl	r2, r2, #3
	strh	r3, [r0, r2]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L425:
	.align	2
.L424:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	clipSpritesOffScreen
	.size	drawKorok, .-drawKorok
	.align	2
	.global	drawHUD
	.syntax unified
	.arm
	.type	drawHUD, %function
drawHUD:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L444
	ldr	r2, [r3, #2732]
	cmp	r2, #0
	ldr	r0, [r3, #2740]
	bne	.L443
	cmp	r0, #0
	bgt	.L430
	ldr	r3, .L444+4
	ldr	r2, .L444+8
	strh	r2, [r3, #66]	@ movhi
	strh	r2, [r3, #68]	@ movhi
.L431:
	ldr	r3, .L444+8
	ldr	r2, .L444+4
	strh	r3, [r2, #70]	@ movhi
	bx	lr
.L430:
	ldr	r3, .L444+12
	ldr	r2, .L444+4
	cmp	r0, #1
	strh	r3, [r2, #66]	@ movhi
	addeq	r3, r3, #1
	strheq	r3, [r2, #68]	@ movhi
	beq	.L431
	cmp	r0, #2
	strh	r3, [r2, #68]	@ movhi
	beq	.L431
	ldr	r2, .L444+4
	strh	r3, [r2, #70]	@ movhi
	bx	lr
.L443:
	mov	r3, #0
	str	lr, [sp, #-4]!
	ldr	ip, .L444+4
	ldr	lr, .L444+8
.L429:
	cmp	r0, r3
	ldr	r1, .L444+12
	movle	r1, lr
	add	r2, ip, r3, lsl #1
	add	r3, r3, #1
	cmp	r3, #12
	strh	r1, [r2, #66]	@ movhi
	bne	.L429
	ldr	lr, [sp], #4
	bx	lr
.L445:
	.align	2
.L444:
	.word	.LANCHOR0
	.word	100696064
	.word	8194
	.word	8193
	.size	drawHUD, .-drawHUD
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
	bl	drawHUD
	bl	drawPlayer
	bl	drawSlashes
	bl	drawEnemies
	bl	drawBullets
	bl	drawKorok
	ldr	r3, .L448
	mov	lr, pc
	bx	r3
	ldr	r4, .L448+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L448+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L449:
	.align	2
.L448:
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.global	bushCount
	.global	waterColor
	.global	vOff
	.global	hOff
	.global	cheatFlag
	.global	winFlag
	.global	lives
	.global	bushes
	.global	korok
	.global	bullets
	.global	enemies
	.global	slashes
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
	.type	korokFrames, %object
	.size	korokFrames, 16
korokFrames:
	.word	576
	.word	578
	.word	580
	.word	582
	.type	playerAttackFrames, %object
	.size	playerAttackFrames, 16
playerAttackFrames:
	.word	64
	.word	66
	.word	68
	.word	70
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
	.type	playerDodgeFrames, %object
	.size	playerDodgeFrames, 24
playerDodgeFrames:
	.word	14
	.word	16
	.word	18
	.word	20
	.word	22
	.word	24
	.type	playerWalkFrames, %object
	.size	playerWalkFrames, 24
playerWalkFrames:
	.word	2
	.word	4
	.word	6
	.word	8
	.word	10
	.word	12
	.type	playerHitFrames, %object
	.size	playerHitFrames, 12
playerHitFrames:
	.word	26
	.word	0
	.word	26
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
	.space	4
	.type	slashes, %object
	.size	slashes, 144
slashes:
	.space	144
	.type	enemies, %object
	.size	enemies, 880
enemies:
	.space	880
	.type	enemyIdleFrames, %object
	.size	enemyIdleFrames, 4
enemyIdleFrames:
	.space	4
	.space	4
	.type	bullets, %object
	.size	bullets, 768
bullets:
	.space	768
	.type	korok, %object
	.size	korok, 36
korok:
	.space	36
	.type	bushCount, %object
	.size	bushCount, 4
bushCount:
	.space	4
	.type	bushes, %object
	.size	bushes, 768
bushes:
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
	.type	cheatFlag, %object
	.size	cheatFlag, 4
cheatFlag:
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
	.size	enemyPatrolPoints, 352
enemyPatrolPoints:
	.word	200
	.word	424
	.word	272
	.word	424
	.word	272
	.word	460
	.word	200
	.word	460
	.word	368
	.word	416
	.word	424
	.word	416
	.word	424
	.word	440
	.word	368
	.word	440
	.word	456
	.word	352
	.word	392
	.word	352
	.word	392
	.word	384
	.word	456
	.word	384
	.word	360
	.word	320
	.word	424
	.word	320
	.word	424
	.word	272
	.word	360
	.word	272
	.word	296
	.word	264
	.word	296
	.word	304
	.word	360
	.word	304
	.word	360
	.word	264
	.word	192
	.word	240
	.word	232
	.word	240
	.word	232
	.word	304
	.word	192
	.word	304
	.word	128
	.word	224
	.word	128
	.word	264
	.word	168
	.word	264
	.word	168
	.word	224
	.word	56
	.word	200
	.word	136
	.word	200
	.word	56
	.word	200
	.word	136
	.word	200
	.word	72
	.word	96
	.word	72
	.word	128
	.word	128
	.word	128
	.word	128
	.word	96
	.word	168
	.word	112
	.word	120
	.word	112
	.word	120
	.word	72
	.word	168
	.word	72
	.word	216
	.word	40
	.word	216
	.word	72
	.word	176
	.word	72
	.word	176
	.word	40
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
	.global	__aeabi_idivmod
	.global	__aeabi_d2iz
	.global	__aeabi_dadd
	.global	__aeabi_ddiv
	.global	__aeabi_i2d
	.ident	"GCC: (devkitARM) 15.2.0"
