//Seperates the 3 digits of the score by subtracting recursivly,
//puts the value into an aray, and then prints the value to the top right of the screen

.section .init

.section .text

.globl displayScore
displayScore:

	push {r0-r2, r6-r9, lr}
	
	ldr r0, =hero				//loading hero score
	ldr r0, [r0, #20]
	
	push {r0-r4}
	ldr r0, =FrameBufferInit
	ldr r0, [r0, #32]
	ldr r1, =0x3da
	mov r2, #1
	mov r3, #0
	mov r4, #36
	bl box
	pop {r0-r4}

	ldr r1, =numArray

	mov r8, #'0'
	str r8, [r1]
	str r8, [r1, #4]
	str r8, [r1, #8]

/*
	compare the hundreds place, branch to tens when found the 3rd digit
*/

	cmp r0, #100
	blt tens

	cmp r0, #200
	sublt r0, #100
	mov r8, #'1'
	str r8, [r1]
	blt tens

	cmp r0, #300
	sublt r0, #200
	mov r8, #'2'
	str r8, [r1]
	blt tens

	cmp r0, #400
	sublt r0, #300
	mov r8, #'3'
	str r8, [r1]
	blt tens

	cmp r0, #500
	sublt r0, #400
	mov r8, #'4'
	str r8, [r1]
	blt tens

	cmp r0, #600
	sublt r0, #500
	mov r8, #'5'
	str r8, [r1]
	blt tens

	cmp r0, #700
	sublt r0, #600
	mov r8, #'6'
	str r8, [r1]
	blt tens

	cmp r0, #800
	sublt r0, #700
	mov r8, #'7'
	str r8, [r1]
	blt tens

	cmp r0, #900
	sublt r0, #800
	mov r8, #'8'
	str r8, [r1]
	blt tens
	sub r0, #900
	mov r8, #'9'
	str r8, [r1]
/*
	compare tens place, branch to ones when found 2nd digit
*/

tens:
	cmp r0, #10
	blt ones

	cmp r0, #20
	sublt r0, #10
	mov r8, #'1'
	str r8, [r1, #4]
	blt ones

	cmp r0, #30
	sublt r0, #20
	mov r8, #'2'
	str r8, [r1, #4]
	blt ones

	cmp r0, #40
	sublt r0, #30
	mov r8, #'3'
	str r8, [r1, #4]
	blt ones

	cmp r0, #50
	sublt r0, #40
	mov r8, #'4'
	str r8, [r1, #4]
	blt ones

	cmp r0, #60
	sublt r0, #50
	mov r8, #'5'
	str r8, [r1, #4]
	blt ones

	cmp r0, #70
	sublt r0, #60
	mov r8, #'6'
	str r8, [r1, #4]
	blt ones

	cmp r0, #80
	sublt r0, #70
	mov r8, #'7'
	str r8, [r1, #4]
	blt ones

	cmp r0, #90
	sublt r0, #80
	mov r8, #'8'
	str r8, [r1, #4]
	blt ones
	sub r0, #90
	mov r8, #'9'
	str r8, [r1, #4]

/*
	test if 5 or 0 in ones place
*/
ones:
	cmp r0, #0
	mov r8, #'5'
	strne r8, [r1, #8]
	ldr r2, =0xFFFF
	mov r2, r2
Draw:
	ldr r7, =numArray		//load address of array
	ldr r6, =0x3F3			//load x value
	mov r9, r6
	mov r1, #0			//mov y value
	ldr r0, [r7, #8]		//load character to draw (1st)
	bl DrawChar			//draw
	sub r9, #12			//mov x back 12 spaces
	ldr r0, [r7, #4]		//load character to draw (2nd)
	bl DrawChar
	sub r9, #12			//move x back 12 spaces
	ldr r0, [r7]			//load character to draw (3rd)
	bl DrawChar
	
	pop {r0-r2, r6-r9, lr}
	bx lr
.section .data

.align 4
font:		.incbin	"font.bin"
numArray:
	.word '0', '0', '0'
