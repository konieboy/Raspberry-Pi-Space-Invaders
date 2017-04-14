//Draws a flashing startScreen using a loop that draws the title in white, then
//again in black shortly after. Pressing start brings you into the game.

   
.section .text


.globl startScreen
startScreen:

	mov r10, r0				//move framebuffer pointer to r10

	mov		r2,		#0xFFFFFF	//White
	bl drawNames
	bl drawTitle

Flash:	

    bl  border

    bl   checkForStart
	mov		r2,		#0xFFFFFF	//White
	bl loopDrawPress
	

	ldr		r3,	=0x0FFFFFFF
	bl   checkForStart
	bl		Delay 
    	bl   checkForStart

	mov		r2,		#0x0	// Black
	bl loopDrawPress		//draw black


	ldr		r3,	=0x0FFFFFFF
	bl   checkForStart
	bl		Delay
	bl   checkForStart

	
	bl		Flash

	loopDrawPress:

		push	{lr}
		mov r1,	#384
		mov r9, #456
		mov r0, #'P'
		bl DrawChar

		add r9, #12
		mov r0, #'R'
		bl DrawChar

		add r9, #12 
		mov r0, #'E'
		bl DrawChar

		add r9, #12 
		mov r0, #'S'
		bl DrawChar

		add r9, #12 
		mov r0, #'S'
		bl DrawChar

		add r9, #36 
		mov r0, #'S'
		bl DrawChar

		add r9, #12 
		mov r0, #'T'
		bl DrawChar
		
		add r9, #12 
		mov r0, #'A'
		bl DrawChar
	
		add r9, #12 
		mov r0, #'R'
		bl DrawChar

		add r9, #12 
		mov r0, #'T'
		bl DrawChar

		pop	{lr}	
		bxeq	lr
		
drawNames:
		push	{r1, lr }

		mov r1, #0
		mov r9, #0
		mov r0, #'K'
		bl DrawChar

		add r9, #12
		mov r0, #'O'
		bl DrawChar

		add r9, #12 
		mov r0, #'N'
		bl DrawChar

		add r9, #12 
		mov r0, #'R'
		bl DrawChar

		add r9, #12 
		mov r0, #'A'
		bl DrawChar

		add r9, #12 
		mov r0, #'D'
		bl DrawChar

		add r9, #12 
		mov r0, #','
		bl DrawChar
		
		add r9, #36 
		mov r0, #'E'
		bl DrawChar
	
		add r9, #12 
		mov r0, #'T'
		bl DrawChar

		add r9, #12 
		mov r0, #'H'
		bl DrawChar

		add r9, #12 
		mov r0, #'A'
		bl DrawChar

		add r9, #12 
		mov r0, #'N'
		bl DrawChar

		add r9, #12 
		mov r0, #','
		bl DrawChar

		add r9, #36 
		mov r0, #'B'
		bl DrawChar

		add r9, #12 
		mov r0, #'R'
		bl DrawChar

		add r9, #12 
		mov r0, #'E'
		bl DrawChar

		add r9, #12 
		mov r0, #'N'
		bl DrawChar

		add r9, #12 
		mov r0, #'D'
		bl DrawChar

		add r9, #12 
		mov r0, #'A'
		bl DrawChar

		add r9, #12 
		mov r0, #'N'
		bl DrawChar

		pop	{ r1, lr}	
		bxeq	lr		

drawTitle:
		push	{r1, lr }

		mov r1, #0
		mov r9, #456
		mov r0, #'A'
		bl DrawChar

		add r9, #12
		mov r0, #'S'
		bl DrawChar

		add r9, #12 
		mov r0, #'T'
		bl DrawChar

		add r9, #12 
		mov r0, #'R'
		bl DrawChar

		add r9, #12 
		mov r0, #'O'
		bl DrawChar

		add r9, #36 
		mov r0, #'Q'
		bl DrawChar

		add r9, #12 
		mov r0, #'U'
		bl DrawChar
		
		add r9, #12 
		mov r0, #'E'
		bl DrawChar
	
		add r9, #12 
		mov r0, #'S'
		bl DrawChar

		add r9, #12 
		mov r0, #'T'
		bl DrawChar

		pop	{ r1, lr}	
		bxeq	lr		

		
checkForStart:

	push {r2,r3,r4,lr}
		mov r4, #0
		bl snes_input
		ldr r2, =0xFFF7
		cmp r4, r2
		beq release
		b skip
	
	release:
		mov r4, #0
		bl snes_input
		ldr r2, =0xFFFF
		cmp r4, r2
		beq start
		b release
	skip:

		pop {r2,r3,r4,lr}
		bx lr

start:
	mov		r2,		#0x0	// Black
	bl loopDrawPress		//draw black
	bl drawNames
	bl drawTitle
	b		gameLoop

Delay:
	push	{r1,r2}
	mov r1, #0
	ldr		r3,	=0xFFFFFFFF
Delay2:
	add   	r1, #1
	ldr	r2, =0xF4240
	cmp	r1, r2
	
	push {r3}
	beq	checkForStart
	pop {r3}
	subs    r3, #1



	bne     Delay2

	pop	{r1,r2}
	bxeq    lr

.section .data

.align 4
font:		.incbin	"font.bin"
