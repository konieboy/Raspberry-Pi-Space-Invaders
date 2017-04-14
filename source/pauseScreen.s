//Pauses the screen and displays a box in the middle of the screen
//The box has a menu that allows the user to Resume, restart, and quit

.section    .init
    
.section .text

.globl pauseScreen
pauseScreen:						//pause screen is start of code

    	push {r0-r10}
	ldr r10, =FrameBufferInit
	ldr r10, [r10, #32]
	mov r3, #0

reDraw:	


	mov		r2,		#0xFFFFFF	//White
	
	bl	loopDrawPress
	b	checkInput

	loopDrawPress:
break2:
		push	{lr}
		push	{r3}
        	ldr r3, =0xDDDD
       		bl drawBox
		pop {r3}

		mov r1,	#384
		mov r9, #444

		cmp r3, #0			//Compare position to 0, if true draw '>' at resume
		moveq	r2,	#0xF000
		movne	r2,	#0x0
		mov r0, #'>'
		bl DrawChar

		ldr	r2,	=0xFFFF
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
		mov r0, #'U'
		bl DrawChar

		add r9, #12 
		mov r0, #'M'
		bl DrawChar

		add r9, #12 
		mov r0, #'E'
		bl DrawChar


		add r1, #36 
		mov r9, #444

		cmp r3, #1					//Compare position to 1, if true draw '>' at New Game
		moveq	r2,	#0xF000
		movne	r2,	#0x0
		mov r0, #'>'
		bl DrawChar

		ldr	r2,	=0xFFFF
		add r9, #12
		mov r0, #'N'
		bl DrawChar

		add r9, #12 
		mov r0, #'E'
		bl DrawChar
		
		add r9, #12 
		mov r0, #'W'
		bl DrawChar
	
		add r9, #36 
		mov r0, #'G'
		bl DrawChar

		add r9, #12 
		mov r0, #'A'
		bl DrawChar

		add r9, #12 
		mov r0, #'M'
		bl DrawChar

		add r9, #12 
		mov r0, #'E'
		bl DrawChar


		add r1, #36 
		mov r9, #444

		cmp r3, #2					//Compare position to 2, if true draw '>' at Quit
		moveq	r2,	#0xF000
		movne	r2,	#0x0
		mov r0, #'>'
		bl DrawChar

		ldr	r2,	=0xFFFF
		add r9, #12
		mov r0, #'Q'
		bl DrawChar

		add r9, #12 
		mov r0, #'U'
		bl DrawChar

		add r9, #12 
		mov r0, #'I'
		bl DrawChar

		add r9, #12 
		mov r0, #'T'
		bl DrawChar

		pop	{lr}	
		bx	lr
		
checkInput:
loop:
	mov r4, #0
	push {r3}
	bl snes_input					//get input
	pop {r3}
	ldr r9, =0xFEFF
	cmp r4, r9					//compare input to A button
	beq select					//jump to start
	ldr r9, =0xFFDF
	cmp r4, r9					//compare to down
	//DRAW pointer down one
	beq down					//go down one
	ldr r9, =0xFFEF
	cmp r4, r9					//compare to up
	//DRAW pointer up one
	beq up						//go up one
	b loop

down:
	cmp r3, #2					//compare the position to the bottom position
	addne r3, #1					//if it is not at bottom, move down one
	b release

up:
	cmp r3, #0					//compare position to top position
	subne r3, #1					//if not at top, move up
	b release
	
select:
	cmp r3, #0					//compare to Resume position
	beq resume					//jump to start(gameLoop)
	cmp r3, #1					//compare to New game postion
	beq refresh			
	cmp r3, #2					//compare to quit game position
	beq quit
	mov r3, #0				//if none of these reset to 'Resume Game' and back to loop

release:
	mov r4, #0
	push {r3}
	bl snes_input
	pop {r3}
break:
	ldr r9, =0xFFFF
	cmp r4, r9
	bne release
	b reDraw					//jump to reDraw

resume:
	ldr r3, =0x0
	bl drawBox

	pop {r0-r10}
	b gameLoop

refresh:
	ldr r3, =0x0
	bl drawBox
	pop {r0-r10}
	bl restart
	b _start

quit:
	ldr r3, =0x0
	bl drawBox
	pop {r0-r10}
	b haltLoop$

drawBox:
        push {lr}
        ldr r0, =FrameBufferInit
        ldr r0, [r0, #32]
        mov r1, #420
        mov r2, #360
        mov r4, #164
        bl box

        ldr r1, =0x1AA
        ldr r2, =0x16E
        ldr r3, =0x0
        mov r4, #152
        bl box
        pop {lr}
        bx lr


.section .data

.align 4
font:		.incbin	"font.bin"
