//Draws the win message
.section .text

.globl winMessage

winMessage:
		push	{r0,r1,r9,r10,lr}

        ldr r10, =FrameBufferInit
        ldr r10, [r10, #32]

		mov r1, #300
		mov r9, #456
		mov r0, #'Y'
		bl DrawChar

		add r9, #12
		mov r0, #'O'
		bl DrawChar

		add r9, #12 
		mov r0, #'U'
		bl DrawChar

		add r9, #36 
		mov r0, #'W'
		bl DrawChar

		add r9, #12 
		mov r0, #'I'
		bl DrawChar

		add r9, #12 
		mov r0, #'N'
		bl DrawChar

		add r9, #12 
		mov r0, #'!'
		bl DrawChar
		
		pop	{r0,r1,r9,r10,lr}
		bx	lr		

.section .data

.align 4
font:		.incbin	"font.bin"
