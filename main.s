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
	mov	r3, #32
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L23+40
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L23+44
	ldr	r1, .L23+48
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L23+52
	ldr	r1, .L23+56
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L23+60
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L23+64
	ldr	r1, .L23+68
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	ldr	r2, .L23+72
	mov	r0, #3
	ldr	r1, .L23+76
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L23+80
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
	.word	83886144
	.word	UItilesetPal
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
	push	{r4, r5, r6, lr}
	mov	r2, #2304
	mov	r4, #67108864
	ldr	r3, .L27
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	lr, .L27+4
	ldr	ip, .L27+8
	strh	lr, [r4, #8]	@ movhi
	ldr	r5, .L27+12
	strh	ip, [r4, #14]	@ movhi
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L27+16
	ldr	r1, .L27+20
	mov	lr, pc
	bx	r5
	ldr	r2, .L27+24
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L27+28
	mov	lr, pc
	bx	r5
	ldr	r4, .L27+32
	mov	r1, #2
	mov	r0, #16
	mov	lr, pc
	bx	r4
	mov	r1, #1
	mov	r0, #28
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+36
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L27+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	hideSprites
	.word	4100
	.word	7171
	.word	DMANow
	.word	100696064
	.word	instructionsScreenLayer1Map
	.word	100720640
	.word	instructionsScreenLayer0Map
	.word	setScreenblockPalette
	.word	resetOff
	.word	.LANCHOR0
	.size	goToInstructions, .-goToInstructions
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
	ldr	r4, .L36
	ldrh	r3, [r4, #12]
	tst	r3, #8
	beq	.L30
	ldrh	r3, [r4, #14]
	tst	r3, #8
	beq	.L35
.L30:
	ldmib	r4, {r2, r3}
	ldr	r1, .L36+4
	add	r2, r2, #10
	add	r3, r3, #4
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
.L35:
	bl	goToInstructions
	b	.L30
.L37:
	.align	2
.L36:
	.word	.LANCHOR0
	.word	waitForVBlank
	.size	start, .-start
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
	ldr	r0, .L40
	ldr	r3, .L40+4
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r2, #7936
	ldr	r3, .L40+8
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r7, .L40+12
	ldr	lr, .L40+16
	ldr	ip, .L40+20
	ldr	r6, .L40+24
	ldr	r4, .L40+28
	strh	r7, [r5, #8]	@ movhi
	mov	r3, #8192
	strh	r6, [r5, #10]	@ movhi
	mov	r2, #100663296
	strh	lr, [r5, #12]	@ movhi
	mov	r0, #3
	strh	ip, [r5, #14]	@ movhi
	ldr	r1, .L40+32
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L40+36
	ldr	r1, .L40+40
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L40+44
	ldr	r1, .L40+48
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r1, #0
	mov	r0, #3
	ldr	r2, .L40+52
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L40+56
	ldr	r1, .L40+60
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L40+64
	ldr	r1, .L40+68
	mov	lr, pc
	bx	r4
	ldr	r2, .L40+72
	mov	r3, #4096
	mov	r0, #3
	ldr	r1, .L40+76
	mov	lr, pc
	bx	r4
	mov	r1, #2
	mov	r0, #16
	ldr	r3, .L40+80
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldr	r2, .L40+84
	ldr	r3, .L40+88
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L41:
	.align	2
.L40:
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
	.word	setScreenblockPalette
	.word	.LANCHOR0
	.word	initGame
	.size	goToGame, .-goToGame
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L54
	ldrh	r2, [r3, #12]
	tst	r2, #4
	push	{r4, lr}
	beq	.L43
	ldrh	r1, [r3, #14]
	tst	r1, #4
	beq	.L52
.L43:
	tst	r2, #8
	beq	.L44
	ldrh	r3, [r3, #14]
	ands	r3, r3, #8
	beq	.L53
.L44:
	ldr	r3, .L54+4
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r2, #0
	pop	{r4, lr}
	strh	r2, [r3, #28]	@ movhi
	bx	lr
.L53:
	mov	r1, #3
	ldr	ip, .L54+8
	ldr	r0, .L54+12
	ldr	r2, .L54+16
	str	r3, [ip]
	str	r3, [r0]
	str	r1, [r2]
	bl	goToGame
	b	.L44
.L52:
	bl	goToStart
	ldr	r3, .L54
	ldrh	r2, [r3, #12]
	b	.L43
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	winFlag
	.word	cheatFlag
	.word	lives
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
	ldr	lr, .L58
	ldr	r7, .L58+4
	ldr	r6, .L58+8
	ldr	r5, .L58+12
	strh	r8, [ip]	@ movhi
	ldr	r4, .L58+16
	strh	r7, [ip, #8]	@ movhi
	mov	r3, #8192
	strh	r6, [ip, #10]	@ movhi
	mov	r2, #100663296
	strh	r5, [ip, #12]	@ movhi
	mov	r0, #3
	strh	lr, [ip, #14]	@ movhi
	ldr	r1, .L58+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L58+24
	ldr	r1, .L58+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r1, #0
	mov	r0, #3
	ldr	r2, .L58+32
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L58+36
	ldr	r1, .L58+40
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L58+44
	ldr	r1, .L58+48
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L58+52
	mov	r0, #3
	ldr	r1, .L58+56
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L58+60
	pop	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	bx	lr
.L59:
	.align	2
.L58:
	.word	-9213
	.word	4100
	.word	-11263
	.word	-10237
	.word	DMANow
	.word	tilesetTiles
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
	mov	r2, #2304
	mov	r4, #67108864
	ldr	r3, .L62
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	lr, .L62+4
	ldr	ip, .L62+8
	strh	lr, [r4, #8]	@ movhi
	ldr	r5, .L62+12
	strh	ip, [r4, #14]	@ movhi
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L62+16
	ldr	r1, .L62+20
	mov	lr, pc
	bx	r5
	ldr	r2, .L62+24
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L62+28
	mov	lr, pc
	bx	r5
	ldr	r4, .L62+32
	mov	r1, #2
	mov	r0, #16
	mov	lr, pc
	bx	r4
	mov	r1, #1
	mov	r0, #28
	mov	lr, pc
	bx	r4
	ldr	r3, .L62+36
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L62+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L63:
	.align	2
.L62:
	.word	hideSprites
	.word	4100
	.word	7171
	.word	DMANow
	.word	100696064
	.word	pauseMenuLayer1Map
	.word	100720640
	.word	pauseMenuLayer0Map
	.word	setScreenblockPalette
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
	ldr	r3, .L82
	ldrh	r2, [r3, #12]
	tst	r2, #4
	beq	.L74
	ldrh	r1, [r3, #14]
	tst	r1, #4
	beq	.L80
.L74:
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #14]
	tst	r3, #8
	bxne	lr
	b	resumeGame
.L80:
	push	{r4, lr}
	bl	goToStart
	ldr	r3, .L82
	ldrh	r2, [r3, #12]
	tst	r2, #8
	beq	.L64
	ldrh	r3, [r3, #14]
	tst	r3, #8
	beq	.L81
.L64:
	pop	{r4, lr}
	bx	lr
.L81:
	pop	{r4, lr}
	b	resumeGame
.L83:
	.align	2
.L82:
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
	mov	r2, #7424
	mov	r4, #67108864
	ldr	r3, .L86
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L86+4
	ldr	lr, .L86+8
	ldr	ip, .L86+12
	strh	r6, [r4, #8]	@ movhi
	ldr	r5, .L86+16
	strh	lr, [r4, #12]	@ movhi
	mov	r3, #1024
	strh	ip, [r4, #14]	@ movhi
	mov	r0, #3
	ldr	r2, .L86+20
	ldr	r1, .L86+24
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L86+28
	ldr	r1, .L86+32
	mov	lr, pc
	bx	r5
	ldr	r2, .L86+36
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L86+40
	mov	lr, pc
	bx	r5
	ldr	r4, .L86+44
	mov	r1, #2
	mov	r0, #16
	mov	lr, pc
	bx	r4
	mov	r1, #1
	mov	r0, #28
	mov	lr, pc
	bx	r4
	ldr	r3, .L86+48
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L86+52
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L87:
	.align	2
.L86:
	.word	hideSprites
	.word	4100
	.word	6147
	.word	7171
	.word	DMANow
	.word	100696064
	.word	winScreenLayer2Map
	.word	100712448
	.word	winScreenLayer1Map
	.word	100720640
	.word	winScreenLayer0Map
	.word	setScreenblockPalette
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
	ldr	r3, .L95
	ldrh	r2, [r3, #12]
	tst	r2, #8
	push	{r4, lr}
	beq	.L89
	ldrh	r3, [r3, #14]
	tst	r3, #8
	beq	.L94
.L89:
	mov	r3, #120
	mov	r0, #2176
	mov	r1, #2688
	ldr	ip, .L95+4
	ldr	r2, .L95+8
	strh	r2, [ip, #2]	@ movhi
	add	r2, r2, #16
	strh	r2, [ip, #10]	@ movhi
	ldr	r2, .L95+12
	strh	r3, [ip]	@ movhi
	strh	r0, [ip, #4]	@ movhi
	strh	r3, [ip, #8]	@ movhi
	strh	r1, [ip, #12]	@ movhi
	ldr	r4, .L95+16
	mov	lr, pc
	bx	r2
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L95+4
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L94:
	bl	goToStart
	b	.L89
.L96:
	.align	2
.L95:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	16488
	.word	waitForVBlank
	.word	DMANow
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
	mov	r2, #2304
	mov	r4, #67108864
	ldr	r3, .L99
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	lr, .L99+4
	ldr	ip, .L99+8
	strh	lr, [r4, #8]	@ movhi
	ldr	r5, .L99+12
	strh	ip, [r4, #14]	@ movhi
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L99+16
	ldr	r1, .L99+20
	mov	lr, pc
	bx	r5
	ldr	r2, .L99+24
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L99+28
	mov	lr, pc
	bx	r5
	ldr	r4, .L99+32
	mov	r1, #2
	mov	r0, #16
	mov	lr, pc
	bx	r4
	mov	r1, #1
	mov	r0, #28
	mov	lr, pc
	bx	r4
	mov	r0, #7
	ldr	r3, .L99+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+40
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L99+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L100:
	.align	2
.L99:
	.word	hideSprites
	.word	4100
	.word	7171
	.word	DMANow
	.word	100696064
	.word	loseScreenLayer1Map
	.word	100720640
	.word	loseScreenLayer0Map
	.word	setScreenblockPalette
	.word	playAnalogSound
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
	ldr	r3, .L112
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L112+4
	ldrh	r2, [r3, #12]
	tst	r2, #8
	beq	.L102
	ldrh	r3, [r3, #14]
	tst	r3, #8
	beq	.L109
.L102:
	ldr	r3, .L112+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L110
	ldr	r3, .L112+12
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L111
	ldr	r3, .L112+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L109:
	pop	{r4, lr}
	b	goToPause
.L111:
	pop	{r4, lr}
	b	goToLose
.L110:
	pop	{r4, lr}
	b	goToWin
.L113:
	.align	2
.L112:
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
	ldr	r3, .L130
	ldr	fp, .L130+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L130+8
	ldr	r3, .L130+12
	mov	lr, pc
	bx	r3
	ldr	r10, .L130+16
	ldr	r5, .L130+20
	ldr	r1, [fp]
	ldrh	r0, [fp, #14]
	ldr	r9, .L130+24
	ldr	r8, .L130+28
	ldr	r7, .L130+32
	ldr	r6, .L130+36
	ldr	r4, .L130+40
.L115:
	ldrh	r3, [r4, #48]
	strh	r0, [fp, #12]	@ movhi
	strh	r3, [fp, #14]	@ movhi
	cmp	r1, #5
	bhi	.L127
	ldrb	ip, [r5, r1]
	add	pc, pc, ip, lsl #2
.Lrtx118:
	nop
	.section	.rodata
.L118:
	.byte	(.L123-.Lrtx118-4)/4
	.byte	(.L122-.Lrtx118-4)/4
	.byte	(.L121-.Lrtx118-4)/4
	.byte	(.L120-.Lrtx118-4)/4
	.byte	(.L119-.Lrtx118-4)/4
	.byte	(.L117-.Lrtx118-4)/4
	.section	.text.startup
	.p2align 2
.L117:
	tst	r0, #8
	beq	.L126
	tst	r3, #8
	beq	.L129
.L126:
	mov	r0, r3
	b	.L115
.L119:
	mov	lr, pc
	bx	r6
	ldr	r1, [fp]
	ldrh	r0, [fp, #14]
	b	.L115
.L120:
	mov	lr, pc
	bx	r7
	ldr	r1, [fp]
	ldrh	r0, [fp, #14]
	b	.L115
.L121:
	mov	lr, pc
	bx	r8
	ldr	r1, [fp]
	ldrh	r0, [fp, #14]
	b	.L115
.L122:
	mov	lr, pc
	bx	r9
	ldr	r1, [fp]
	ldrh	r0, [fp, #14]
	b	.L115
.L123:
	mov	lr, pc
	bx	r10
	ldr	r1, [fp]
	ldrh	r0, [fp, #14]
	b	.L115
.L129:
	ldr	r3, .L130+44
	mov	lr, pc
	bx	r3
	ldr	r1, [fp]
	ldrh	r0, [fp, #14]
	b	.L115
.L127:
	ldr	r1, .L130+40
.L116:
	ldrh	r0, [r1, #48]
	ldrh	ip, [r1, #48]
	strh	r0, [fp, #12]	@ movhi
	strh	ip, [fp, #14]	@ movhi
	b	.L116
.L131:
	.align	2
.L130:
	.word	initialize
	.word	.LANCHOR0
	.word	.LC1
	.word	mgba_printf
	.word	start
	.word	.L118
	.word	instructions
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.word	goToStart
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
	ldr	r3, .L137
	ldrh	r2, [r3, #12]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #14]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L138:
	.align	2
.L137:
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
