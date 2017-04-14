//Calculates and returns the current score in game

.section .text
.globl getScore
getScore:
    push    {r0,r2,r3,r4,lr}
    ldr     r0, =hero           //hero address
    ldr     r3, [r0, #20]
    ldr     r0, =pawn           //pawn address
    ldr     r4, =queen3         //queen3(last obj)
scoreloop:
    bl      getObjScore         //send ^ to getObjScore
    add     r3, r2              //add obj score to total(r3)
    cmp     r0, r4
    addne   r0, #32
    blt     scoreloop
scoredone:
    ldr     r0, =hero           //load hero for store score
    str     r3, [r0, #20]       //store score   
    pop     {r0,r2,r3,r4,lr}
    bx      lr

getObjScore: //pass in r0 as obj address, returns score in r2.
    push    {r1,r3,lr}
    ldr     r1, [r0, #20]       //load obj hp
    cmp     r1, #0              //cmp obj hp
    movne   r2, #0
    ldreq   r2, [r0, #24]       //return score to r2
    mov	    r3, #-1
    streq   r3, [r0, #20]   
    pop     {r1,r3,lr}
    bx      lr


