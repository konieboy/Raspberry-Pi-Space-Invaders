//Whites out the screen

.section    .init
.globl     whiteout

.section .text   

whiteout:
    push    {r1,r2,r3,r4,r5,r6,lr}
	bl		DrawPixel16bpp				//draw pixel
    add     r1, #1						//inc x
    ldr     r6, =0xC0000
    cmp     r1, r6						//cmp if x = length
    beq     rowd						//branch to rowd for an y inc
    b       whiteout					//else branch out of box
rowd:
    pop     {r1,r2,r3,r4,r5,r6,lr}		
    bx      lr							//return up

