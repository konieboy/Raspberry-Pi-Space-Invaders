//Draws a user defined rectangle

.section    .init
.globl     rectangle

.section .text   

//box(x,y,color,length,height)
//box(r1,r2,r3,r4,r5)
rectangle:
    push    {r1,r2,r3,r4,r5,r6,r7,lr}	//save reg on the stack to recall later
    add     r6, r1, r4					//r6 = x + length; used to maintain length
    add     r7, r2, r5					//r7 = y + height; used to maintain length
boxx:
	bl		DrawPixel16bpp				//draw pixel
    add     r1, #1						//inc x
    cmp     r1, r6						//cmp if x = length
    beq     rowd						//branch to rowd for an y inc
    b       boxx						//else branch out of box
rowd:
    sub     r1, r4						//reset x offset to original x
    add     r2, #1						//inc y
    cmp     r2, r7						//cmp if y = height
    beq     cold						//branch to cold  to end
    b       boxx 						//else branch out of box
cold:   
    pop     {r1,r2,r3,r4,r5,r6,lr}		//return saved reg's to return
    bx      lr							//return up

