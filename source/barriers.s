//Draws the borders on edge of the screen to prevent the player from leaving


.section    .init
.globl   barriers

.section .text

barriers:
    push    {r1,r2,r3,r4,r5,lr}     
    mov     r5, #10
rock:
    sub     r5, #1
	add		r1, #0      //x 1008
	mov		r2, #672    //y 768
	ldr		r3,	=0x0000 //color
    mov     r4, #48     //length
    bl      box         //box(x,y,color,length)

	add		r1, #48      //x 1008
	mov		r2, #672    //y 768
	ldr		r3,	=0x6100 //color
    mov     r4, #48     //length
    bl      box         //box(x,y,color,length)
    
    add     r1, #48
    cmp     r5, #0

    beq     rockdone
    b       rock

rockdone:
    pop     {r1,r2,r3,r4,r5,lr}  
    bx      lr
