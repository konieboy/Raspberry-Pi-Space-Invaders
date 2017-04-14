//"Removes" bullets from the game by placing them offsceen

.section .text
.globl removebulletenemy
.globl removebullet
.globl removeobject

removebulletenemy:
    push    {r1,r2,r4,r5,lr}  
    mov     r5, r4
    bl      makeBlack    
    mov     r1, #0
    mov     r2, #792
    str     r2, [r4, #4]
    str     r1, [r4, #20]
    pop     {r1,r2,r4,r5,lr}
    bx      lr

removebullet:
    push    {r1,r2,r4,r5,lr}  
    mov     r5, r4
    bl      makeBlack    
    mov     r1, #0
    mov     r2, #-10
    str     r2, [r4, #4]
    str     r1, [r4, #20]
    pop     {r1,r2,r4,r5,lr}
    bx      lr

removeobject:
    push    {r1,r2,lr}
    bl      makeBlack
    ldr     r1, =0x41a  //move offscreen
    mov     r2, #800
    str     r1, [r5]            //obj x
    str     r1, [r5, #4]        //obj x
    pop     {r1,r2,lr}
    bx      lr


