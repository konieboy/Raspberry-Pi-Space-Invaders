//Draws the triangle shaped hero

.section    .init
.globl     triangle

.section .text   

//triangle(x,y,color,height) (isolese triangle)
//triangle(r1,r2,r3,r4)

triangle:
    push	{r1,r2,r3,r4,r5,r6,r7,lr}			
	add		r1,	r4, lsr #1						//start origin in middle of box 
	mov		r5,	#1								//holds how many pixels to draw per lvl
	mov		r6, #0								//holds temp of r5
	add		r7,	r4, r2							//r7=length+y; to maintain length
tri2:
	add		r6, #1
	mov		r5, r6								//return temp to r5
	bl		DrawPixel16bpp						//draw		
	add		r2, #1								//dec y
	sub		r1, r5								//move x to left starting spot
	add		r5, #1								//inv r5
	mov		r6, r5								// r6 = r5
lp:				
	bl		DrawPixel16bpp						//draw	
	add		r1, #1								//inc x
	sub		r5, #1								//dec r5
	cmp		r2, r7								//check if at bottom of box
	beq		done								//branch to end triangle
	cmp		r5, #0								//check to see if EOL
	beq		tri2								//if EOL branch to tri2
	b		lp	                                //else branch to lp
done:
	pop	    {r1,r2,r3,r4,r5,r6,r7,lr}	
    bx      lr
