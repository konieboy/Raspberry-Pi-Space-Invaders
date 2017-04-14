//Uses the font.bin file in order to find the right bitmask to draw the 
//ascii char the user wishes to print to the screen.

.section .text

.globl DrawChar
DrawChar:

push	{r1,r4-r9, lr}

	char		.req    r0
	yVal		.req	r1
	chAdr		.req	r4
	px		.req	r5
	py		.req	r6
	row		.req	r7
	xCord		.req 	r9
	

	mask		.req	r8

	ldr		chAdr,	=font		// load the address of the font map
	add		chAdr,	char, lsl #4	// char address = font base + (char * 16)

	mov		py,		yVal			// init the Y to halfway down screen
	
	b charLoop$



charLoop$:
	mov		px,		xCord			// init the X coordinate

	mov		mask,	#0x01		// set the bitmask to 1 in the LSB
	
	ldrb	row,	[chAdr], #1	// load the row byte, post increment chAdr

	b rowLoop$



rowLoop$:
	tst		row,	mask		// test row byte against the bitmask
	beq		noPixel$

	mov		r0,		px
	mov		r1,		py
	
	push {r0-r10}
	mov r3, r2
	mov r2, r1
	mov r1, r0
	mov r0, r10
	bl		DrawPixel16bpp			// draw red pixel at (px, py)
	pop {r0-r10}

noPixel$:
	add		px,		#1			// increment x coordinate by 1
	lsl		mask,	#1			// shift bitmask left by 1

	tst		mask,	#0x100		// test if the bitmask has shifted 8 times (test 9th bit)
	beq		rowLoop$

	add		py,		#1			// increment y coordinate by 1

	tst		chAdr,	#0xF
	bne		charLoop$			// loop back to charLoop$, unless address evenly divisibly by 16 (ie: at the next char)

	.unreq	chAdr
	.unreq	px
	.unreq	py
	.unreq	row
	.unreq	mask

	pop		{r1,r4-r9, lr}
	bx lr

.section .data

.align 4
font:		.incbin	"font.bin"
