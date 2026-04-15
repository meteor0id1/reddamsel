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
	.global	goToStart
	.syntax unified
	.arm
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #3584
	mov	r5, #67108864
	ldr	r3, .L4
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L4+4
	ldr	lr, .L4+8
	ldr	ip, .L4+12
	ldr	r4, .L4+16
	strh	r6, [r5, #10]	@ movhi
	mov	r3, #16384
	strh	lr, [r5, #12]	@ movhi
	mov	r2, #100663296
	strh	ip, [r5, #14]	@ movhi
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+48
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L4+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+56
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.word	5121
	.word	6147
	.word	7171
	.word	DMANow
	.word	tilesetTiles
	.word	100728832
	.word	spritesheetTiles
	.word	100704256
	.word	startMenuLayer2Map
	.word	100712448
	.word	startMenuLayer1Map
	.word	100720640
	.word	startMenuLayer0Map
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
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r4, .L8+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	mgba_open
	.word	DMANow
	.word	tilesetPal
	.word	83886592
	.word	spritesheetPal
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
	mov	r2, #67108864
	ldr	r1, .L12
	push	{r4, lr}
	ldr	r3, .L12+4
	strh	r1, [r2]	@ movhi
	mov	r0, #4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L12+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	1028
	.word	fillScreen4
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
	ldr	r0, .L16
	ldr	r3, .L16+4
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r2, #7936
	mov	r7, #4864
	strh	r2, [r5]	@ movhi
	ldr	r3, .L16+8
	mov	lr, pc
	bx	r3
	ldr	r6, .L16+12
	ldr	lr, .L16+16
	ldr	ip, .L16+20
	ldr	r4, .L16+24
	strh	r7, [r5, #8]	@ movhi
	mov	r3, #16384
	strh	r6, [r5, #10]	@ movhi
	mov	r2, #100663296
	strh	lr, [r5, #12]	@ movhi
	mov	r0, #3
	strh	ip, [r5, #14]	@ movhi
	ldr	r1, .L16+28
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L16+32
	ldr	r1, .L16+36
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L16+40
	ldr	r1, .L16+44
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L16+48
	ldr	r1, .L16+52
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L16+56
	ldr	r1, .L16+60
	mov	lr, pc
	bx	r4
	mov	r1, #2
	ldr	r2, .L16+64
	ldr	r3, .L16+68
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LC0
	.word	mgba_printf
	.word	hideSprites
	.word	-11263
	.word	-10237
	.word	-9213
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
	ldr	r3, .L30
	ldrh	r2, [r3, #4]
	tst	r2, #4
	push	{r4, lr}
	beq	.L19
	ldrh	r1, [r3, #6]
	tst	r1, #4
	beq	.L28
.L19:
	tst	r2, #8
	beq	.L18
	ldrh	r3, [r3, #6]
	ands	r3, r3, #8
	beq	.L29
.L18:
	pop	{r4, lr}
	bx	lr
.L29:
	mov	r1, #3
	ldr	r0, .L30+4
	ldr	r2, .L30+8
	pop	{r4, lr}
	str	r3, [r0]
	str	r1, [r2]
	b	goToGame
.L28:
	mov	r1, #67108864
	ldr	ip, .L30+12
	ldr	r2, .L30+16
	strh	ip, [r1]	@ movhi
	mov	r0, #4
	mov	lr, pc
	bx	r2
	mov	r1, #1
	ldr	r3, .L30
	ldrh	r2, [r3, #4]
	str	r1, [r3]
	b	.L19
.L31:
	.align	2
.L30:
	.word	.LANCHOR0
	.word	winFlag
	.word	lives
	.word	1028
	.word	fillScreen4
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
	ldr	r3, .L50
	ldrh	r2, [r3, #4]
	tst	r2, #4
	beq	.L42
	ldrh	r1, [r3, #6]
	tst	r1, #4
	beq	.L48
.L42:
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #6]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L48:
	push	{r4, lr}
	bl	goToStart
	ldr	r3, .L50
	ldrh	r2, [r3, #4]
	tst	r2, #8
	beq	.L32
	ldrh	r3, [r3, #6]
	tst	r3, #8
	beq	.L49
.L32:
	pop	{r4, lr}
	bx	lr
.L49:
	pop	{r4, lr}
	b	goToGame
.L51:
	.align	2
.L50:
	.word	.LANCHOR0
	.size	instructions, .-instructions
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
	ldr	r3, .L54
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L54+4
	ldr	lr, .L54+8
	ldr	ip, .L54+12
	ldr	r4, .L54+16
	strh	r6, [r5, #10]	@ movhi
	mov	r3, #16384
	strh	lr, [r5, #12]	@ movhi
	mov	r2, #100663296
	strh	ip, [r5, #14]	@ movhi
	mov	r0, #3
	ldr	r1, .L54+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L54+24
	ldr	r1, .L54+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L54+32
	ldr	r1, .L54+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L54+40
	ldr	r1, .L54+44
	mov	lr, pc
	bx	r4
	ldr	r2, .L54+48
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L54+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L54+56
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L54+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L55:
	.align	2
.L54:
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
	ldr	r3, .L74
	ldrh	r2, [r3, #4]
	tst	r2, #4
	beq	.L66
	ldrh	r1, [r3, #6]
	tst	r1, #4
	beq	.L72
.L66:
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #6]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L72:
	push	{r4, lr}
	bl	goToStart
	ldr	r3, .L74
	ldrh	r2, [r3, #4]
	tst	r2, #8
	beq	.L56
	ldrh	r3, [r3, #6]
	tst	r3, #8
	beq	.L73
.L56:
	pop	{r4, lr}
	bx	lr
.L73:
	pop	{r4, lr}
	b	goToGame
.L75:
	.align	2
.L74:
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
	ldr	r3, .L78
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L78+4
	ldr	lr, .L78+8
	ldr	ip, .L78+12
	ldr	r4, .L78+16
	strh	r6, [r5, #10]	@ movhi
	mov	r3, #16384
	strh	lr, [r5, #12]	@ movhi
	mov	r2, #100663296
	strh	ip, [r5, #14]	@ movhi
	mov	r0, #3
	ldr	r1, .L78+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L78+24
	ldr	r1, .L78+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L78+32
	ldr	r1, .L78+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L78+40
	ldr	r1, .L78+44
	mov	lr, pc
	bx	r4
	ldr	r2, .L78+48
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L78+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L78+56
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L78+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L79:
	.align	2
.L78:
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
	ldr	r3, .L85
	ldrh	r2, [r3, #4]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #6]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L86:
	.align	2
.L85:
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
	ldr	r3, .L89
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L89+4
	ldr	lr, .L89+8
	ldr	ip, .L89+12
	ldr	r4, .L89+16
	strh	r6, [r5, #10]	@ movhi
	mov	r3, #16384
	strh	lr, [r5, #12]	@ movhi
	mov	r2, #100663296
	strh	ip, [r5, #14]	@ movhi
	mov	r0, #3
	ldr	r1, .L89+20
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L89+24
	ldr	r1, .L89+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L89+32
	ldr	r1, .L89+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L89+40
	ldr	r1, .L89+44
	mov	lr, pc
	bx	r4
	ldr	r2, .L89+48
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L89+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L89+56
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L89+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L90:
	.align	2
.L89:
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
	ldr	r3, .L102
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L102+4
	ldrh	r2, [r3, #4]
	tst	r2, #8
	beq	.L92
	ldrh	r3, [r3, #6]
	tst	r3, #8
	beq	.L99
.L92:
	ldr	r3, .L102+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L100
	ldr	r3, .L102+12
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L101
	ldr	r3, .L102+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L99:
	pop	{r4, lr}
	b	goToPause
.L101:
	pop	{r4, lr}
	b	goToLose
.L100:
	pop	{r4, lr}
	b	goToWin
.L103:
	.align	2
.L102:
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
	push	{r7, lr}
	ldr	r3, .L126
	ldr	r10, .L126+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L126+8
	ldr	r3, .L126+12
	mov	lr, pc
	bx	r3
	ldr	r8, .L126+16
	ldr	r5, .L126+20
	ldr	r2, [r10]
	ldrh	r1, [r10, #6]
	ldr	r6, .L126+24
	ldr	r7, .L126+28
	ldr	r9, .L126+32
	ldr	r4, .L126+36
.L105:
	ldrh	r3, [r4, #48]
	strh	r1, [r10, #4]	@ movhi
	strh	r3, [r10, #6]	@ movhi
	cmp	r2, #5
	bhi	.L120
	ldrb	r0, [r5, r2]
	add	pc, pc, r0, lsl #2
.Lrtx108:
	nop
	.section	.rodata
.L108:
	.byte	(.L112-.Lrtx108-4)/4
	.byte	(.L110-.Lrtx108-4)/4
	.byte	(.L111-.Lrtx108-4)/4
	.byte	(.L110-.Lrtx108-4)/4
	.byte	(.L109-.Lrtx108-4)/4
	.byte	(.L109-.Lrtx108-4)/4
	.section	.text.startup
	.p2align 2
.L109:
	tst	r1, #8
	beq	.L117
	tst	r3, #8
	beq	.L125
.L117:
	mov	r1, r3
	b	.L105
.L110:
	mov	lr, pc
	bx	r6
	ldr	r2, [r10]
	ldrh	r1, [r10, #6]
	b	.L105
.L112:
	mov	lr, pc
	bx	r8
	ldr	r2, [r10]
	ldrh	r1, [r10, #6]
	b	.L105
.L111:
	mov	lr, pc
	bx	r7
	ldr	r2, [r10]
	ldrh	r1, [r10, #6]
	b	.L105
.L125:
	mov	lr, pc
	bx	r9
	ldr	r2, [r10]
	ldrh	r1, [r10, #6]
	b	.L105
.L120:
	ldr	r2, .L126+36
.L106:
	ldrh	r1, [r2, #48]
	ldrh	r0, [r2, #48]
	strh	r1, [r10, #4]	@ movhi
	strh	r0, [r10, #6]	@ movhi
	b	.L106
.L127:
	.align	2
.L126:
	.word	initialize
	.word	.LANCHOR0
	.word	.LC1
	.word	mgba_printf
	.word	start
	.word	.L108
	.word	instructions
	.word	game
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
	ldr	r3, .L133
	ldrh	r2, [r3, #4]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #6]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L134:
	.align	2
.L133:
	.word	.LANCHOR0
	.size	lose, .-lose
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
	.type	oldButtons, %object
	.size	oldButtons, 2
oldButtons:
	.space	2
	.type	buttons, %object
	.size	buttons, 2
buttons:
	.space	2
	.ident	"GCC: (devkitARM) 15.2.0"
