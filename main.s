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
	.file	"main.c"
	.text
	.align	2
	.global	interruptHandler
	.syntax unified
	.arm
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L11
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r3, .L11+4
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L3
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	bge	.L10
.L3:
	mov	r1, #1
	ldr	r3, .L11
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L10:
	ldr	r3, .L11+8
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L11+12
	ldr	r3, .L11+16
	mov	lr, pc
	bx	r3
	b	.L3
.L12:
	.align	2
.L11:
	.word	67109376
	.word	soundA
	.word	bgMusic_length
	.word	bgMusic_data
	.word	playSoundA
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	mov	r1, #67108864
	mov	r0, #8
	str	lr, [sp, #-4]!
	ldr	r3, .L15
	ldr	lr, .L15+4
	ldr	ip, .L15+8
	str	lr, [ip, #4092]
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	lr, [sp], #4
	strh	r0, [r1, #4]	@ movhi
	bx	lr
.L16:
	.align	2
.L15:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #3328
	mov	r4, #67108864
	ldr	r3, .L19
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L19+4
	ldr	lr, .L19+8
	ldr	ip, .L19+12
	strh	r6, [r4, #8]	@ movhi
	ldr	r5, .L19+16
	strh	lr, [r4, #12]	@ movhi
	mov	r3, #1024
	strh	ip, [r4, #14]	@ movhi
	mov	r0, #3
	ldr	r2, .L19+20
	ldr	r1, .L19+24
	mov	lr, pc
	bx	r5
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L19+28
	ldr	r1, .L19+32
	mov	lr, pc
	bx	r5
	mov	r3, #2048
	ldr	r2, .L19+36
	mov	r0, #3
	ldr	r1, .L19+40
	mov	lr, pc
	bx	r5
	ldr	r4, .L19+44
	mov	r1, #2
	mov	r0, #16
	mov	lr, pc
	bx	r4
	mov	r1, #1
	mov	r0, #28
	mov	lr, pc
	bx	r4
	mov	r1, #1
	mov	r0, #29
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	ldr	r1, .L19+48
	ldr	r3, .L19+52
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L19+56
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	hideSprites
	.word	4100
	.word	22531
	.word	23555
	.word	DMANow
	.word	100696064
	.word	startScreenLayer2Map
	.word	100712448
	.word	startScreenLayer1Map
	.word	100720640
	.word	startScreenLayer0Map
	.word	setScreenblockPalette
	.word	19114
	.word	resetOff
	.word	.LANCHOR0
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L23
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+8
	mov	lr, pc
	bx	r3
	mov	lr, #8
	mov	ip, #67108864
	mov	r2, #1
	ldr	r1, .L23+12
	ldr	r0, .L23+16
	ldr	r3, .L23+20
	str	r0, [r1, #4092]
	ldr	r1, .L23+24
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r1, [r1]
	strh	lr, [ip, #4]	@ movhi
	ldr	r0, .L23+28
	ldr	r4, .L23+32
	mov	lr, pc
	bx	r4
	ldr	r4, .L23+36
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L23+40
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L23+44
	ldr	r1, .L23+48
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L23+52
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L23+56
	ldr	r1, .L23+60
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	ldr	r2, .L23+64
	mov	r0, #3
	ldr	r1, .L23+68
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L23+72
	pop	{r4, lr}
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	b	goToStart
.L24:
	.align	2
.L23:
	.word	mgba_open
	.word	initSound
	.word	setupSounds
	.word	50360320
	.word	interruptHandler
	.word	67109376
	.word	bgMusic_length
	.word	bgMusic_data
	.word	playSoundA
	.word	DMANow
	.word	tilesetPal
	.word	83886592
	.word	spritesheetPal
	.word	tilesetTiles
	.word	100728832
	.word	spritesheetTiles
	.word	100679680
	.word	UItilesetTiles
	.word	.LANCHOR0
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	mov	r0, #2304
	mov	r2, #1
	ldr	r3, .L26
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.size	goToInstructions, .-goToInstructions
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Entering game...\000"
	.text
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r0, .L30
	ldr	r3, .L30+4
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r2, #7936
	ldr	r3, .L30+8
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r7, .L30+12
	ldr	lr, .L30+16
	ldr	ip, .L30+20
	ldr	r6, .L30+24
	ldr	r4, .L30+28
	strh	r7, [r5, #8]	@ movhi
	mov	r3, #8192
	strh	r6, [r5, #10]	@ movhi
	mov	r2, #100663296
	strh	lr, [r5, #12]	@ movhi
	mov	r0, #3
	strh	ip, [r5, #14]	@ movhi
	ldr	r1, .L30+32
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L30+36
	ldr	r1, .L30+40
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L30+44
	ldr	r1, .L30+48
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r1, #0
	mov	r0, #3
	ldr	r2, .L30+52
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L30+56
	ldr	r1, .L30+60
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L30+64
	ldr	r1, .L30+68
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L30+72
	ldr	r1, .L30+76
	mov	lr, pc
	bx	r4
	mov	r1, #2
	ldr	r2, .L30+80
	ldr	r3, .L30+84
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	.LC0
	.word	mgba_printf
	.word	hideSprites
	.word	4100
	.word	-10237
	.word	-9213
	.word	-11263
	.word	DMANow
	.word	tilesetTiles
	.word	100679680
	.word	UItilesetTiles
	.word	100728832
	.word	spritesheetTiles
	.word	100696064
	.word	100704256
	.word	level1MapLayer2Map
	.word	100712448
	.word	level1MapLayer1Map
	.word	100720640
	.word	level1MapLayer0Map
	.word	.LANCHOR0
	.word	initGame
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L43
	ldrh	r3, [r4, #12]
	tst	r3, #4
	beq	.L33
	ldrh	r2, [r4, #14]
	tst	r2, #4
	moveq	r1, #67108864
	moveq	r0, #2304
	moveq	r2, #1
	strheq	r0, [r1]	@ movhi
	streq	r2, [r4]
.L33:
	tst	r3, #8
	beq	.L34
	ldrh	r3, [r4, #14]
	ands	r3, r3, #8
	beq	.L42
.L34:
	ldmib	r4, {r2, r3}
	ldr	r1, .L43+4
	add	r2, r2, #12
	add	r3, r3, #6
	stmib	r4, {r2, r3}
	mov	lr, pc
	bx	r1
	mov	r1, #67108864
	ldmib	r4, {r2, r3}
	asr	r2, r2, #4
	asr	r3, r3, #4
	lsl	r2, r2, #16
	lsl	r3, r3, #16
	lsr	r2, r2, #16
	lsr	r3, r3, #16
	strh	r2, [r1, #24]	@ movhi
	pop	{r4, lr}
	strh	r3, [r1, #28]	@ movhi
	bx	lr
.L42:
	mov	r1, #3
	ldr	r0, .L43+8
	ldr	r2, .L43+12
	str	r3, [r0]
	str	r1, [r2]
	bl	goToGame
	b	.L34
.L44:
	.align	2
.L43:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	winFlag
	.word	lives
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L63
	ldrh	r2, [r3, #12]
	tst	r2, #4
	beq	.L55
	ldrh	r1, [r3, #14]
	tst	r1, #4
	beq	.L61
.L55:
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #14]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L61:
	push	{r4, lr}
	bl	goToStart
	ldr	r3, .L63
	ldrh	r2, [r3, #12]
	tst	r2, #8
	beq	.L45
	ldrh	r3, [r3, #14]
	tst	r3, #8
	beq	.L62
.L45:
	pop	{r4, lr}
	bx	lr
.L62:
	pop	{r4, lr}
	b	goToGame
.L64:
	.align	2
.L63:
	.word	.LANCHOR0
	.size	instructions, .-instructions
	.align	2
	.global	resumeGame
	.syntax unified
	.arm
	.type	resumeGame, %function
resumeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	ip, #67108864
	mov	r8, #7936
	ldr	lr, .L67
	ldr	r7, .L67+4
	ldr	r6, .L67+8
	ldr	r5, .L67+12
	strh	r8, [ip]	@ movhi
	ldr	r4, .L67+16
	strh	r7, [ip, #8]	@ movhi
	mov	r3, #8192
	strh	r6, [ip, #10]	@ movhi
	mov	r2, #100663296
	strh	r5, [ip, #12]	@ movhi
	mov	r0, #3
	strh	lr, [ip, #14]	@ movhi
	ldr	r1, .L67+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L67+24
	ldr	r1, .L67+28
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L67+32
	ldr	r1, .L67+36
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L67+40
	ldr	r1, .L67+44
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L67+48
	mov	r0, #3
	ldr	r1, .L67+52
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L67+56
	pop	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	bx	lr
.L68:
	.align	2
.L67:
	.word	-9213
	.word	4868
	.word	-11263
	.word	-10237
	.word	DMANow
	.word	tilesetTiles
	.word	100728832
	.word	spritesheetTiles
	.word	100704256
	.word	level1MapLayer2Map
	.word	100712448
	.word	level1MapLayer1Map
	.word	100720640
	.word	level1MapLayer0Map
	.word	.LANCHOR0
	.size	resumeGame, .-resumeGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #3584
	mov	r5, #67108864
	ldr	r3, .L71
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L71+4
	ldr	lr, .L71+8
	ldr	ip, .L71+12
	ldr	r4, .L71+16
	strh	r6, [r5, #10]	@ movhi
	mov	r3, #8192
	strh	lr, [r5, #12]	@ movhi
	mov	r2, #100663296
	strh	ip, [r5, #14]	@ movhi
	mov	r0, #3
	ldr	r1, .L71+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L71+24
	ldr	r1, .L71+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L71+32
	ldr	r1, .L71+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L71+40
	ldr	r1, .L71+44
	mov	lr, pc
	bx	r4
	ldr	r2, .L71+48
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L71+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L71+56
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L71+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L72:
	.align	2
.L71:
	.word	hideSprites
	.word	5121
	.word	6147
	.word	7171
	.word	DMANow
	.word	tilesetTiles
	.word	100728832
	.word	spritesheetTiles
	.word	100704256
	.word	pauseMenuLayer2Map
	.word	100712448
	.word	pauseMenuLayer1Map
	.word	100720640
	.word	pauseMenuLayer0Map
	.word	resetOff
	.word	.LANCHOR0
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L91
	ldrh	r2, [r3, #12]
	tst	r2, #4
	beq	.L83
	ldrh	r1, [r3, #14]
	tst	r1, #4
	beq	.L89
.L83:
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #14]
	tst	r3, #8
	bxne	lr
	b	resumeGame
.L89:
	push	{r4, lr}
	bl	goToStart
	ldr	r3, .L91
	ldrh	r2, [r3, #12]
	tst	r2, #8
	beq	.L73
	ldrh	r3, [r3, #14]
	tst	r3, #8
	beq	.L90
.L73:
	pop	{r4, lr}
	bx	lr
.L90:
	pop	{r4, lr}
	b	resumeGame
.L92:
	.align	2
.L91:
	.word	.LANCHOR0
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #3584
	mov	r5, #67108864
	ldr	r3, .L95
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L95+4
	ldr	lr, .L95+8
	ldr	ip, .L95+12
	ldr	r4, .L95+16
	strh	r6, [r5, #10]	@ movhi
	mov	r3, #8192
	strh	lr, [r5, #12]	@ movhi
	mov	r2, #100663296
	strh	ip, [r5, #14]	@ movhi
	mov	r0, #3
	ldr	r1, .L95+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L95+24
	ldr	r1, .L95+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L95+32
	ldr	r1, .L95+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L95+40
	ldr	r1, .L95+44
	mov	lr, pc
	bx	r4
	ldr	r2, .L95+48
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L95+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L95+56
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L95+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L96:
	.align	2
.L95:
	.word	hideSprites
	.word	5121
	.word	6147
	.word	7171
	.word	DMANow
	.word	tilesetTiles
	.word	100728832
	.word	spritesheetTiles
	.word	100704256
	.word	winMenuLayer2Map
	.word	100712448
	.word	winMenuLayer1Map
	.word	100720640
	.word	winMenuLayer0Map
	.word	resetOff
	.word	.LANCHOR0
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L102
	ldrh	r2, [r3, #12]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #14]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L103:
	.align	2
.L102:
	.word	.LANCHOR0
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #3584
	mov	r5, #67108864
	ldr	r3, .L106
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L106+4
	ldr	lr, .L106+8
	ldr	ip, .L106+12
	ldr	r4, .L106+16
	strh	r6, [r5, #10]	@ movhi
	mov	r3, #8192
	strh	lr, [r5, #12]	@ movhi
	mov	r2, #100663296
	strh	ip, [r5, #14]	@ movhi
	mov	r0, #3
	ldr	r1, .L106+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L106+24
	ldr	r1, .L106+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L106+32
	ldr	r1, .L106+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L106+40
	ldr	r1, .L106+44
	mov	lr, pc
	bx	r4
	ldr	r2, .L106+48
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L106+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L106+56
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L106+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L107:
	.align	2
.L106:
	.word	hideSprites
	.word	5121
	.word	6147
	.word	7171
	.word	DMANow
	.word	tilesetTiles
	.word	100728832
	.word	spritesheetTiles
	.word	100704256
	.word	loseMenuLayer2Map
	.word	100712448
	.word	loseMenuLayer1Map
	.word	100720640
	.word	loseMenuLayer0Map
	.word	resetOff
	.word	.LANCHOR0
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L119
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L119+4
	ldrh	r2, [r3, #12]
	tst	r2, #8
	beq	.L109
	ldrh	r3, [r3, #14]
	tst	r3, #8
	beq	.L116
.L109:
	ldr	r3, .L119+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L117
	ldr	r3, .L119+12
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L118
	ldr	r3, .L119+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L116:
	pop	{r4, lr}
	b	goToPause
.L118:
	pop	{r4, lr}
	b	goToLose
.L117:
	pop	{r4, lr}
	b	goToWin
.L120:
	.align	2
.L119:
	.word	updateGame
	.word	.LANCHOR0
	.word	winFlag
	.word	lives
	.word	drawGame
	.size	game, .-game
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Starting game...\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L144
	ldr	fp, .L144+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L144+8
	ldr	r3, .L144+12
	mov	lr, pc
	bx	r3
	ldr	r9, .L144+16
	ldr	r5, .L144+20
	ldr	r2, [fp]
	ldrh	r1, [fp, #14]
	ldr	r8, .L144+24
	ldr	r7, .L144+28
	ldr	r6, .L144+32
	ldr	r10, .L144+36
	ldr	r4, .L144+40
.L122:
	ldrh	r3, [r4, #48]
	strh	r1, [fp, #12]	@ movhi
	strh	r3, [fp, #14]	@ movhi
	cmp	r2, #5
	bhi	.L138
	ldrb	r0, [r5, r2]
	add	pc, pc, r0, lsl #2
.Lrtx125:
	nop
	.section	.rodata
.L125:
	.byte	(.L130-.Lrtx125-4)/4
	.byte	(.L129-.Lrtx125-4)/4
	.byte	(.L128-.Lrtx125-4)/4
	.byte	(.L127-.Lrtx125-4)/4
	.byte	(.L126-.Lrtx125-4)/4
	.byte	(.L126-.Lrtx125-4)/4
	.section	.text.startup
	.p2align 2
.L126:
	tst	r1, #8
	beq	.L135
	tst	r3, #8
	beq	.L143
.L135:
	mov	r1, r3
	b	.L122
.L127:
	mov	lr, pc
	bx	r6
	ldr	r2, [fp]
	ldrh	r1, [fp, #14]
	b	.L122
.L128:
	mov	lr, pc
	bx	r7
	ldr	r2, [fp]
	ldrh	r1, [fp, #14]
	b	.L122
.L129:
	mov	lr, pc
	bx	r8
	ldr	r2, [fp]
	ldrh	r1, [fp, #14]
	b	.L122
.L130:
	mov	lr, pc
	bx	r9
	ldr	r2, [fp]
	ldrh	r1, [fp, #14]
	b	.L122
.L143:
	mov	lr, pc
	bx	r10
	ldr	r2, [fp]
	ldrh	r1, [fp, #14]
	b	.L122
.L138:
	ldr	r2, .L144+40
.L123:
	ldrh	r1, [r2, #48]
	ldrh	r0, [r2, #48]
	strh	r1, [fp, #12]	@ movhi
	strh	r0, [fp, #14]	@ movhi
	b	.L123
.L145:
	.align	2
.L144:
	.word	initialize
	.word	.LANCHOR0
	.word	.LC1
	.word	mgba_printf
	.word	start
	.word	.L125
	.word	instructions
	.word	game
	.word	pause
	.word	goToStart
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L151
	ldrh	r2, [r3, #12]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #14]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L152:
	.align	2
.L151:
	.word	.LANCHOR0
	.size	lose, .-lose
	.global	bg3hOff
	.global	bg2hOff
	.global	state
	.global	oldButtons
	.global	buttons
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	state, %object
	.size	state, 4
state:
	.space	4
	.type	bg2hOff, %object
	.size	bg2hOff, 4
bg2hOff:
	.space	4
	.type	bg3hOff, %object
	.size	bg3hOff, 4
bg3hOff:
	.space	4
	.type	oldButtons, %object
	.size	oldButtons, 2
oldButtons:
	.space	2
	.type	buttons, %object
	.size	buttons, 2
buttons:
	.space	2
	.ident	"GCC: (devkitARM) 15.2.0"
