//checks if the enemies or heros has been hitcheck
//adds score if enemy is killed, decrements if hero is hit

.section .text
.globl hitcheck
.globl heroHitCheck
.globl destructHitCheck
.globl destructHitCheck2
.globl destructHitCheck3
.globl destructHitCheck4

hitcheck: //takes r5 as address of object. updates if hero bullet hits object. object.health-- and hero bullet reset. 
    push    {r1-r11,lr}
    ldr     r1, [r5]            //pawn x
    ldr     r2, [r5, #4]        //pawn y
    ldr     r3, [r5, #12]       //pawn length
    ldr     r4, =bullet         //load bullet address
    ldr     r7, [r4, #4]        //bullet y
    ldr     r6, [r4]            //bullet x
	add		r8, r1, r3			//p.x+l
	add		r9, r2, r3			//p.y+l
	cmp		r1, r6				//p.x < b.x 
	bge		hitcheckdone		
	cmp		r6, r8				//b.x < p.x + l
	bge		hitcheckdone
	cmp		r2, r7				//p.y < b.y
	bge		hitcheckdone
	cmp 	r7, r9				//b.y < p.y + l
	bge		hitcheckdone
	ldr		r10, [r5, #20]		//p.health--
    bl      makeBlack
	sub		r10, #1
	str		r10, [r5, #20]
    bl      removebullet  
    cmp     r10, #0             //obj compare health
    bleq    removeobject        //removes object offscreen

hitcheckdone:
    pop     {r1-r11,lr} 
	bx		lr
	
heroHitCheck:
    push    {r0-r10,lr}
    ldr     r0, [r5]            //load bullet.p.x
    ldr     r1, [r5, #4]        //load bullet.p.y
    ldr     r6, =hero           //load hero address
    ldr     r7, [r6]            //hero.x
    ldr     r8, [r6, #4]        //hero.y
    add     r8, #40             //lolz
    sub     r7, #20             //lolz
    add     r9, r7, #78         //hero.x + l
    sub     r10,r8, #30         //hero.y + l

    cmp     r7, r0              // hero.x <  bullet.p.x
    bge     heroHitCheckDone
    cmp     r0, r9              // bullet.p.x < hero.x + l
    bge     heroHitCheckDone
    cmp     r8, r1              // hero.y < bullet.p.y
    ble     heroHitCheckDone
    cmp     r1, r10             // bullet.p.y < hero.y + l
    ble     heroHitCheckDone    
    mov     r4, r5
    bl      removebulletenemy

    ldr     r10, [r6, #20]      //load current score
    sub     r10, #10            //dec score 10
    str     r10, [r6, #20]      //store score
heroHitCheckDone:
    pop     {r0-r10,lr}
    bx      lr


destructHitCheck:
    push    {r0-r12,lr}
    ldr     r0, [r5]            //load bullet.p.x
    ldr     r1, [r5, #4]        //load bullet.p.y
    ldr     r12,[r5, #16]
    ldr     r6, =destructoid    //load @
    ldr     r2, [r6]            //destruct.x
    ldr     r3, [r6, #4]        //destruct.y
    ldr     r9, [r6, #12]       //destruct.length
    add     r7, r2, r9          //d.x + l
    add     r8, r3, r9          //d.y + l

    cmp     r2, r0              // destruct.x <  bullet.p.x
    bge     destructHitCheckDone
    cmp     r0, r7              // bullet.p.x < hero.x + l
    bge     destructHitCheckDone
    cmp     r3, r1              // destruct.y < bullet.p.y
    bge     destructHitCheckDone
    cmp     r1, r8             // bullet.p.y < hero.y + l
    bge     destructHitCheckDone    
    mov     r4, r5
    bl      removebulletenemy
    mov     r5, r6
    bl      makeBlack           //making destruct black
    lsr     r9, #1              //Shrink /4
    ldr     r10, [r6, #20]
    sub     r10, #1
    ldr	    r5, =bullet
    ldr	    r11, [r5, #16] 
    cmp     r11, r12
    bleq    removebullet
    str     r10, [r6, #20]
    str     r9, [r6, #12]       //store updated destruct
destructHitCheckDone:
    pop     {r0-r12,lr}
    bx      lr

destructHitCheck2:
    push    {r0-r12,lr}
    ldr     r0, [r5]            //load bullet.p.x
    ldr     r1, [r5, #4]        //load bullet.p.y
    ldr     r12,[r5, #16]
    ldr     r6, =destructoid2    //load @
    ldr     r2, [r6]            //destruct.x
    ldr     r3, [r6, #4]        //destruct.y
    ldr     r9, [r6, #12]       //destruct.length
    add     r7, r2, r9          //d.x + l
    add     r8, r3, r9          //d.y + l

    cmp     r2, r0              // destruct.x <  bullet.p.x
    bge     destructHitCheckDone2
    cmp     r0, r7              // bullet.p.x < hero.x + l
    bge     destructHitCheckDone2
    cmp     r3, r1              // destruct.y < bullet.p.y
    bge     destructHitCheckDone2
    cmp     r1, r8             // bullet.p.y < hero.y + l
    bge     destructHitCheckDone2    
    mov     r4, r5
    bl      removebulletenemy
    mov     r5, r6
    bl      makeBlack           //making destruct black
    lsr     r9, #1              //shrink /4
    ldr     r10, [r6, #20]
    sub     r10, #1
    ldr	    r5, =bullet
    ldr	    r11, [r5, #16] 
    cmp     r11, r12
    bleq    removebullet
    str     r10, [r6, #20]
    str     r9, [r6, #12]       //store updated destruct
destructHitCheckDone2:
    pop     {r0-r12,lr}
    bx      lr

destructHitCheck3:
    push    {r0-r12,lr}
    ldr     r0, [r5]            //load bullet.p.x
    ldr     r1, [r5, #4]        //load bullet.p.y
    ldr     r12,[r5, #16]
    ldr     r6, =destructoid3    //load @
    ldr     r2, [r6]            //destruct.x
    ldr     r3, [r6, #4]        //destruct.y
    ldr     r9, [r6, #12]       //destruct.length
    add     r7, r2, r9          //d.x + l
    add     r8, r3, r9          //d.y + l

    cmp     r2, r0              // destruct.x <  bullet.p.x
    bge     destructHitCheckDone3
    cmp     r0, r7              // bullet.p.x < hero.x + l
    bge     destructHitCheckDone3
    cmp     r3, r1              // destruct.y < bullet.p.y
    bge     destructHitCheckDone3
    cmp     r1, r8             // bullet.p.y < hero.y + l
    bge     destructHitCheckDone3    
    mov     r4, r5
    bl      removebulletenemy
    mov     r5, r6
    bl      makeBlack           //making destruct black
    lsr     r9, #1              //shrink /4
    ldr     r10, [r6, #20]
    sub     r10, #1
    ldr	    r5, =bullet
    ldr	    r11, [r5, #16] 
    cmp     r11, r12
    bleq    removebullet
    str     r10, [r6, #20]
    str     r9, [r6, #12]       //store updated destruct
destructHitCheckDone3:
    pop     {r0-r12,lr}
    bx      lr

destructHitCheck4:
    push    {r0-r12,lr}
    ldr     r0, [r5]            //load bullet.p.x
    ldr     r1, [r5, #4]        //load bullet.p.y
    ldr     r12,[r5, #16]
    ldr     r6, =destructoid4    //load @
    ldr     r2, [r6]            //destruct.x
    ldr     r3, [r6, #4]        //destruct.y
    ldr     r9, [r6, #12]       //destruct.length
    add     r7, r2, r9          //d.x + l
    add     r8, r3, r9          //d.y + l

    cmp     r2, r0              // destruct.x <  bullet.p.x
    bge     destructHitCheckDone4
    cmp     r0, r7              // bullet.p.x < hero.x + l
    bge     destructHitCheckDone4
    cmp     r3, r1              // destruct.y < bullet.p.y
    bge     destructHitCheckDone4
    cmp     r1, r8             // bullet.p.y < hero.y + l
    bge     destructHitCheckDone4    
    mov     r4, r5
    bl      removebulletenemy
    mov     r5, r6
    bl      makeBlack           //making destruct black
    lsr     r9, #1              //shrink /4
    ldr     r10, [r6, #20]
    sub     r10, #1
    ldr	    r5, =bullet
    ldr	    r11, [r5, #16] 
    cmp     r11, r12
    bleq    removebullet
    str     r10, [r6, #20]
    str     r9, [r6, #12]       //store updated destruct
destructHitCheckDone4:
    pop     {r0-r12,lr}
    bx      lr
