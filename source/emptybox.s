//Draws a box with nothing inside of init
//basicly a hollow box

.section    .init
.globl     emptybox

.section .text   

//emptybox(x,y,color,length)
//emptybox(r1,r2,r3,r4)

    
emptybox:
    push    {lr}
    add     r5, r1, r4	        //r5 = x + length
    add     r6, r2, r4	        //r6 = y + length
line:                           //Draws top horizontal line
    bl		DrawPixel16bpp
    add     r1, #1              
    cmp     r1, r5
    beq     line2
    b       line
line2:                          //Draws bottom horizontal line
    sub     r1, r4
    add     r2, r4
line2a:
    bl		DrawPixel16bpp
    add     r1, #1
    cmp     r1, r5
    beq     line3
    b       line2a
line3:                          //Draws left vertical line
    sub     r1, r4
    sub     r2, r4
line3a:
    bl		DrawPixel16bpp
    add     r2, #1
    cmp     r2, r6
    beq     line4
    b       line3a
line4:                          //Draws right vertical line
    add     r1, r4
    sub     r2, r4
line4a:
    bl		DrawPixel16bpp
    add     r2, #1
    cmp     r2, r6
    beq     done
    b       line4a
done:
    pop     {lr}
    bx      lr




