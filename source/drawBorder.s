//Draws the white borders around the game screen

.section    .init
.globl     border

.section .text   
    
border:
    push    {r0-r5,lr}
    ldr     r4, =0x3ff
    ldr     r5, =0x2ff
    ldr     r0, =FrameBufferInit
    ldr     r0, [r0, #32]
    ldr     r3, =0xFFFF
    mov     r1, #0
    mov     r2, #0
line:                           //Draws top horizontal line
    bl		DrawPixel16bpp
    add     r1, #1              
    cmp     r1, r4
    bne     line
line2:                          //Draws bottom horizontal line
    bl		DrawPixel16bpp
    add     r2, #1
    cmp     r2, r5
    bne     line2
line3:                          //Draws left vertical line
    mov     r1, #0
    mov     r2, #0     
line3a:
    bl		DrawPixel16bpp
    add     r2, #1
    cmp     r2, r5
    bne     line3a
line4:                          //Draws right vertical line
    bl		DrawPixel16bpp
    add     r1, #1              
    cmp     r1, r4
    bne     line4
done:
    pop     {r0-r5,lr}
    bx      lr







