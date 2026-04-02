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
	mov	lr, #4352
	mov	ip, #67108864
	ldr	r4, .L4+4
	strh	lr, [ip]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+24
	mov	r3, #16384
	mov	r0, #3
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	DMANow
	.word	tilesetPal
	.word	tilesetTiles
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
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
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L8+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
	.word	hideSprites
	.word	.LANCHOR0
	.size	goToStart, .-goToStart
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
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	mov	r6, #7936
	mov	ip, #67108864
	mov	lr, #7680
	mov	r5, #7424
	strh	lr, [ip]	@ movhi
	ldr	r4, .L12+4
	strh	r6, [ip, #10]	@ movhi
	mov	r3, #1024
	strh	lr, [ip, #12]	@ movhi
	mov	r0, #3
	strh	r5, [ip, #14]	@ movhi
	ldr	r2, .L12+8
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L12+24
	ldr	r1, .L12+28
	mov	lr, pc
	bx	r4
	mov	r1, #1
	ldr	r2, .L12+32
	ldr	r3, .L12+36
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	hideSprites
	.word	DMANow
	.word	100722688
	.word	testmapLayer0Map
	.word	100724736
	.word	testmapLayer1Map
	.word	100726784
	.word	testmapLayer2Map
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
	@ link register save eliminated.
	ldr	r3, .L19
	ldrh	r2, [r3, #4]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #6]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.size	start, .-start
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
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
	ldr	r3, .L62
	ldr	r9, .L62+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L62+8
	ldr	r3, .L62+12
	mov	lr, pc
	bx	r3
	ldr	r6, .L62+16
	ldr	fp, .L62+20
	ldr	r1, [r9]
	ldrh	r2, [r9, #6]
	ldr	r5, .L62+24
	ldr	r4, .L62+28
	ldr	r7, .L62+32
	ldr	r10, .L62+36
.L22:
	ldrh	r3, [r10, #48]
	strh	r2, [r9, #4]	@ movhi
	strh	r3, [r9, #6]	@ movhi
	cmp	r1, #4
	bhi	.L46
	ldrb	r0, [fp, r1]
	add	pc, pc, r0, lsl #2
.Lrtx25:
	nop
	.section	.rodata
.L25:
	.byte	(.L29-.Lrtx25-4)/4
	.byte	(.L28-.Lrtx25-4)/4
	.byte	(.L29-.Lrtx25-4)/4
	.byte	(.L24-.Lrtx25-4)/4
	.byte	(.L24-.Lrtx25-4)/4
	.section	.text.startup
	.p2align 2
.L24:
	tst	r2, #8
	beq	.L30
	ands	r8, r3, #8
	beq	.L61
.L30:
	mov	r2, r3
	b	.L22
.L29:
	tst	r2, #8
	beq	.L30
	tst	r3, #8
	bne	.L30
	mov	lr, pc
	bx	r6
	ldr	r1, [r9]
	ldrh	r3, [r9, #6]
	b	.L30
.L28:
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	ldrh	r2, [r9, #4]
	tst	r2, #8
	ldrh	r3, [r9, #6]
	beq	.L31
	tst	r3, #8
	moveq	r1, #2
	streq	r1, [r9]
	beq	.L30
.L31:
	ldr	r1, [r9]
	b	.L30
.L61:
	mov	lr, pc
	bx	r7
	mov	r1, r8
	str	r8, [r9]
	ldrh	r3, [r9, #6]
	b	.L30
.L46:
	ldr	r2, .L62+36
.L23:
	ldrh	r1, [r2, #48]
	ldrh	r0, [r2, #48]
	strh	r1, [r9, #4]	@ movhi
	strh	r0, [r9, #6]	@ movhi
	b	.L23
.L63:
	.align	2
.L62:
	.word	initialize
	.word	.LANCHOR0
	.word	.LC0
	.word	mgba_printf
	.word	goToGame
	.word	.L25
	.word	updateGame
	.word	drawGame
	.word	hideSprites
	.word	67109120
	.size	main, .-main
	.text
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
	ldr	r3, .L70
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+8
	ldrh	r2, [r3, #4]
	tst	r2, #8
	beq	.L64
	ldrh	r2, [r3, #6]
	tst	r2, #8
	moveq	r2, #2
	streq	r2, [r3]
.L64:
	pop	{r4, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	updateGame
	.word	drawGame
	.word	.LANCHOR0
	.size	game, .-game
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L73
	str	r2, [r3]
	bx	lr
.L74:
	.align	2
.L73:
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
	@ link register save eliminated.
	ldr	r3, .L80
	ldrh	r2, [r3, #4]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #6]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L81:
	.align	2
.L80:
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
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L83
	str	r2, [r3]
	bx	lr
.L84:
	.align	2
.L83:
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
	ldr	r3, .L94
	ldrh	r2, [r3, #4]
	tst	r2, #8
	bxeq	lr
	ldrh	r2, [r3, #6]
	ands	r2, r2, #8
	bxne	lr
	str	lr, [sp, #-4]!
	ldr	r1, .L94+4
	sub	sp, sp, #12
	str	r2, [sp, #4]
	mov	lr, pc
	bx	r1
	ldr	r3, .L94
	ldr	r2, [sp, #4]
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L95:
	.align	2
.L94:
	.word	.LANCHOR0
	.word	hideSprites
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
	@ link register save eliminated.
	mov	r2, #4
	ldr	r3, .L97
	str	r2, [r3]
	bx	lr
.L98:
	.align	2
.L97:
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
	ldr	r3, .L108
	ldrh	r2, [r3, #4]
	tst	r2, #8
	bxeq	lr
	ldrh	r2, [r3, #6]
	ands	r2, r2, #8
	bxne	lr
	str	lr, [sp, #-4]!
	ldr	r1, .L108+4
	sub	sp, sp, #12
	str	r2, [sp, #4]
	mov	lr, pc
	bx	r1
	ldr	r3, .L108
	ldr	r2, [sp, #4]
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L109:
	.align	2
.L108:
	.word	.LANCHOR0
	.word	hideSprites
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
