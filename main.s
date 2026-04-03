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
	.global	initialize
	.syntax unified
	.arm
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r1, .L4+20
	ldr	r3, .L4+24
	strh	r1, [r2]	@ movhi
	mov	r0, #5
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	DMANow
	.word	tilesetPal
	.word	83886592
	.word	spritesheetPal
	.word	1028
	.word	fillScreen4
	.word	.LANCHOR0
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L8
	push	{r4, lr}
	ldr	r3, .L8+4
	strh	r1, [r2]	@ movhi
	mov	r0, #5
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L8+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
	.word	1028
	.word	fillScreen4
	.word	.LANCHOR0
	.size	goToStart, .-goToStart
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
	push	{r4, r5, r6, lr}
	mov	r5, #67108864
	mov	r6, #7680
	ldr	r0, .L16
	ldr	r3, .L16+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+8
	strh	r6, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	mov	lr, #7936
	mov	ip, #7424
	strh	lr, [r5, #10]	@ movhi
	ldr	r4, .L16+12
	strh	r6, [r5, #12]	@ movhi
	mov	r3, #16384
	strh	ip, [r5, #14]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+16
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L16+20
	ldr	r1, .L16+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L16+28
	ldr	r1, .L16+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L16+36
	ldr	r1, .L16+40
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L16+44
	ldr	r1, .L16+48
	mov	lr, pc
	bx	r4
	mov	ip, #1
	mov	r1, #2
	ldr	r0, .L16+52
	ldr	r2, .L16+56
	ldr	r3, .L16+60
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LC0
	.word	mgba_printf
	.word	hideSprites
	.word	DMANow
	.word	tilesetTiles
	.word	100728832
	.word	spritesheetTiles
	.word	100722688
	.word	testmapLayer0Map
	.word	100724736
	.word	testmapLayer1Map
	.word	100726784
	.word	testmapLayer2Map
	.word	lives
	.word	.LANCHOR0
	.word	initGame
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"In start screen...\000"
	.text
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
	push	{r4, lr}
	ldr	r0, .L30+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+8
	ldrh	r2, [r3, #4]
	tst	r2, #4
	beq	.L19
	ldrh	r1, [r3, #6]
	tst	r1, #4
	beq	.L28
.L19:
	tst	r2, #8
	beq	.L18
	ldrh	r3, [r3, #6]
	tst	r3, #8
	beq	.L29
.L18:
	pop	{r4, lr}
	bx	lr
.L29:
	pop	{r4, lr}
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
	ldr	r3, .L30+8
	ldrh	r2, [r3, #4]
	str	r1, [r3]
	b	.L19
.L31:
	.align	2
.L30:
	.word	mgba_printf
	.word	.LC1
	.word	.LANCHOR0
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L50
	ldrh	r2, [r3, #4]
	tst	r2, #4
	beq	.L42
	ldrh	r1, [r3, #6]
	ands	r1, r1, #4
	beq	.L48
.L42:
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #6]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L48:
	mov	ip, #67108864
	str	lr, [sp, #-4]!
	ldr	lr, .L50+4
	sub	sp, sp, #12
	str	r1, [sp, #4]
	ldr	r2, .L50+8
	mov	r0, #5
	strh	lr, [ip]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L50
	ldrh	r2, [r3, #4]
	ldr	r1, [sp, #4]
	tst	r2, #8
	str	r1, [r3]
	beq	.L32
	ldrh	r3, [r3, #6]
	tst	r3, #8
	beq	.L49
.L32:
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L49:
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	b	goToGame
.L51:
	.align	2
.L50:
	.word	.LANCHOR0
	.word	1028
	.word	fillScreen4
	.size	instructions, .-instructions
	.align	2
	.global	game
	.syntax unified
	.arm
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L62
	ldr	r3, .L62+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #4]
	tst	r3, #8
	beq	.L53
	ldrh	r3, [r4, #6]
	tst	r3, #8
	beq	.L60
.L53:
	ldr	r3, .L62+8
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L61
.L54:
	ldr	r3, .L62+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L55
	mov	r2, #67108864
	ldr	r1, .L62+16
	ldr	r3, .L62+20
	mov	r0, #2
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #4
	str	r3, [r4]
.L55:
	ldr	r3, .L62+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L61:
	mov	r2, #67108864
	ldr	r1, .L62+16
	ldr	r3, .L62+20
	mov	r0, #3
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #5
	str	r3, [r4]
	b	.L54
.L60:
	mov	r2, #67108864
	ldr	r1, .L62+16
	ldr	r3, .L62+20
	mov	r0, #1
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #3
	str	r3, [r4]
	b	.L53
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.word	updateGame
	.word	lives
	.word	enemies
	.word	1028
	.word	fillScreen4
	.word	drawGame
	.size	game, .-game
	.section	.rodata.str1.4
	.align	2
.LC2:
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r7, fp, lr}
	mov	fp, #67108864
	ldr	r3, .L85
	ldr	r9, .L85+4
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r0, .L85+8
	ldr	r3, .L85+12
	mov	lr, pc
	bx	r3
	ldr	r8, .L85+16
	ldr	r5, .L85+20
	ldr	r0, [r9]
	ldrh	r1, [r9, #6]
	ldr	r6, .L85+24
	ldr	r7, .L85+28
	ldr	r10, .L85+32
	ldr	r4, .L85+36
.L65:
	ldrh	r3, [r4, #48]
	strh	r1, [r9, #4]	@ movhi
	strh	r3, [r9, #6]	@ movhi
	cmp	r0, #5
	bhi	.L78
	ldrb	ip, [r5, r0]
	add	pc, pc, ip, lsl #2
.Lrtx68:
	nop
	.section	.rodata
.L68:
	.byte	(.L72-.Lrtx68-4)/4
	.byte	(.L70-.Lrtx68-4)/4
	.byte	(.L71-.Lrtx68-4)/4
	.byte	(.L70-.Lrtx68-4)/4
	.byte	(.L67-.Lrtx68-4)/4
	.byte	(.L67-.Lrtx68-4)/4
	.section	.text.startup
	.p2align 2
.L67:
	tst	r1, #8
	beq	.L77
	ands	r1, r3, #8
	beq	.L84
.L77:
	mov	r1, r3
	b	.L65
.L70:
	mov	lr, pc
	bx	r6
	ldr	r0, [r9]
	ldrh	r1, [r9, #6]
	b	.L65
.L72:
	mov	lr, pc
	bx	r8
	ldr	r0, [r9]
	ldrh	r1, [r9, #6]
	b	.L65
.L71:
	mov	lr, pc
	bx	r7
	ldr	r0, [r9]
	ldrh	r1, [r9, #6]
	b	.L65
.L84:
	ldr	r3, .L85+40
	str	r1, [sp, #4]
	mov	r0, #5
	strh	r3, [fp]	@ movhi
	mov	lr, pc
	bx	r10
	ldr	r1, [sp, #4]
	mov	r0, r1
	str	r1, [r9]
	ldrh	r1, [r9, #6]
	b	.L65
.L78:
	ldr	r1, .L85+36
.L66:
	ldrh	r0, [r1, #48]
	ldrh	ip, [r1, #48]
	strh	r0, [r9, #4]	@ movhi
	strh	ip, [r9, #6]	@ movhi
	b	.L66
.L86:
	.align	2
.L85:
	.word	initialize
	.word	.LANCHOR0
	.word	.LC2
	.word	mgba_printf
	.word	start
	.word	.L68
	.word	instructions
	.word	game
	.word	fillScreen4
	.word	67109120
	.word	1028
	.size	main, .-main
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L89
	push	{r4, lr}
	ldr	r3, .L89+4
	strh	r1, [r2]	@ movhi
	mov	r0, #1
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L89+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L90:
	.align	2
.L89:
	.word	1028
	.word	fillScreen4
	.word	.LANCHOR0
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L109
	ldrh	r2, [r3, #4]
	tst	r2, #4
	beq	.L101
	ldrh	r1, [r3, #6]
	ands	r1, r1, #4
	beq	.L107
.L101:
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #6]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L107:
	mov	ip, #67108864
	str	lr, [sp, #-4]!
	ldr	lr, .L109+4
	sub	sp, sp, #12
	str	r1, [sp, #4]
	ldr	r2, .L109+8
	mov	r0, #5
	strh	lr, [ip]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L109
	ldrh	r2, [r3, #4]
	ldr	r1, [sp, #4]
	tst	r2, #8
	str	r1, [r3]
	beq	.L91
	ldrh	r3, [r3, #6]
	tst	r3, #8
	beq	.L108
.L91:
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L108:
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	b	goToGame
.L110:
	.align	2
.L109:
	.word	.LANCHOR0
	.word	1028
	.word	fillScreen4
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
	mov	r2, #67108864
	ldr	r1, .L113
	push	{r4, lr}
	ldr	r3, .L113+4
	strh	r1, [r2]	@ movhi
	mov	r0, #2
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L113+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L114:
	.align	2
.L113:
	.word	1028
	.word	fillScreen4
	.word	.LANCHOR0
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L124
	ldrh	r2, [r3, #4]
	tst	r2, #8
	bxeq	lr
	ldrh	r2, [r3, #6]
	ands	r2, r2, #8
	bxne	lr
	mov	ip, #67108864
	str	lr, [sp, #-4]!
	ldr	lr, .L124+4
	sub	sp, sp, #12
	str	r2, [sp, #4]
	mov	r0, #5
	ldr	r1, .L124+8
	strh	lr, [ip]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L124
	ldr	r2, [sp, #4]
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L125:
	.align	2
.L124:
	.word	.LANCHOR0
	.word	1028
	.word	fillScreen4
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
	mov	r2, #67108864
	ldr	r1, .L128
	push	{r4, lr}
	ldr	r3, .L128+4
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L128+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L129:
	.align	2
.L128:
	.word	1028
	.word	fillScreen4
	.word	.LANCHOR0
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L139
	ldrh	r2, [r3, #4]
	tst	r2, #8
	bxeq	lr
	ldrh	r2, [r3, #6]
	ands	r2, r2, #8
	bxne	lr
	mov	ip, #67108864
	str	lr, [sp, #-4]!
	ldr	lr, .L139+4
	sub	sp, sp, #12
	str	r2, [sp, #4]
	mov	r0, #5
	ldr	r1, .L139+8
	strh	lr, [ip]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L139
	ldr	r2, [sp, #4]
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L140:
	.align	2
.L139:
	.word	.LANCHOR0
	.word	1028
	.word	fillScreen4
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
