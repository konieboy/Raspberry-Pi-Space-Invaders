//Checks if the player won the game and then draws the win message
//Checks if the player lost the game and then draws the lose message
.section .text

.globl winLoop
winLoop:
	ldr r0, =FrameBufferInit
	ldr r0, [r0, #32]
	mov r1, #1
	mov r2, #1
	mov r3, #0
	ldr r4, =0x3fe
	bl box	
    ldr     r2, =0xFFFF
	bl  winMessage
	bl		snes_input
	ldr		r0, =0xffff
	cmp		r4, r0
	beq		winLoop

	bl		restart			//this should allow to press any button to restart
    b       _start

.globl lossLoop	
lossLoop:
	ldr r0, =FrameBufferInit
	ldr r0, [r0, #32]
	mov r1, #1
	mov r2, #1
	mov r3, #0
	ldr r4, =0x3fe
	bl box	
    ldr     r2, =0xFFFF
	bl  lossMessage
	bl		snes_input
	ldr		r0, =0xffff
	cmp		r4, r0
	beq		lossLoop

	bl		restart			//this should allow to press any button to restart	
    b       _start	
