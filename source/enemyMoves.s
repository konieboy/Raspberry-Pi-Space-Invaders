//controls the enemy movement, ie moving across the 
//screen left and right

.section .text
.globl enemyMove
enemyMove:
    push    {lr}
    ldr     r3, [r5, #28]       //load move ctr
    sub     r3, #1
    str     r3, [r5, #28]    
    cmp     r3, #0
    blge    moveRight
    bllt    moveLeft
    cmp     r3, #-45
    moveq   r3, #45
    str     r3, [r5, #28]
    pop     {lr}
    bx      lr

moveRight:      //moves the enemy right by inc every iteration
    push    {r1,r2,r3,lr}
    ldr     r1, [r5]            //load obj x
    ldr     r2, [r5, #16]       //load obj speed
    ldr     r3, [r5, #28]       //load move ctr
    cmp     r3, #0              //cmp move ctr with 0
    add     r1, r2              //add speed to x
    sub     r3, #1              //dec move ctr
    str     r1, [r5]            //store new x
    str     r3, [r5, #28]       //store new ctr
    pop     {r1,r2,r3,lr}
    bx      lr

moveLeft:      //moves the enemy left by inc every iteration
    push    {r1,r2,r3,lr}
    ldr     r1, [r5]
    ldr     r2, [r5, #16]
    ldr     r3, [r5, #28]
    sub     r1, r2
    add     r3, #1
    str     r1, [r5]
    str     r3, [r5, #28]
    pop     {r1,r2,r3,lr}
    bx      lr
