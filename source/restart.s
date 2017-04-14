//Reloads the original data back into all the game objects

.section .text
.globl restart

restart:
		push	{r0,r1,lr}
/*
		ldr		r0, =FrameBufferInit
		mov		r1, #1024
		str		r1, [r0]
		mov		r1, #768
		str		r1, [r0, #4]
		mov		r1, #1024
		str		r1, [r0, #8]
		mov		r1, #768
		str		r1, [r0, #12]
		mov		r1, #0
		str		r1, [r0, #16]
		mov		r1, #16
		str		r1, [r0, #20]
		mov		r1, #0
		str		r1, [r0, #24]
		mov		r1, #0
		str		r1, [r0, #28]
		mov		r1, #0
		str		r1, [r0, #32]
		mov		r1, #0
		str		r1, [r0, #36]
*/
		ldr		r0, =hero
		mov		r1, #480
		str		r1, [r0]
		mov		r1, #724
		str		r1, [r0, #4]
		mov		r1, #50
		str		r1, [r0, #20]

		ldr		r0, =pawn
		mov		r1, #25
		str		r1, [r0]
		mov		r1, #300
		str		r1, [r0, #4]
		mov		r1, #1
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]
		
		ldr		r0, =pawn2
		mov		r1, #100
		str		r1, [r0]
		mov		r1, #300
		str		r1, [r0, #4]
		mov		r1, #1
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]

		ldr		r0, =pawn3
		mov		r1, #175
		str		r1, [r0]
		mov		r1, #300
		str		r1, [r0, #4]
		mov		r1, #1
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]

		ldr		r0, =pawn4
		mov		r1, #250
		str		r1, [r0]
		mov		r1, #300
		str		r1, [r0, #4]
		mov		r1, #1
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]		
		
		ldr		r0, =pawn5
        ldr     r1, =0x145
		str		r1, [r0]
		mov		r1, #300
		str		r1, [r0, #4]
		mov		r1, #1
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]
		
		ldr		r0, =pawn6
		mov		r1, #400
		str		r1, [r0]
		mov		r1, #300
		str		r1, [r0, #4]
		mov		r1, #1
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]		
		
		ldr		r0, =pawn7
        ldr     r1, =0x1db
		str		r1, [r0]
		mov		r1, #300
		str		r1, [r0, #4]
		mov		r1, #1
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]		
		
		ldr		r0, =pawn8
        ldr     r1, =0x226
		str		r1, [r0]
		mov		r1, #300
		str		r1, [r0, #4]
		mov		r1, #1
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]		
		
		ldr		r0, =pawn9
        ldr     r1, =0x271
		str		r1, [r0]
		mov		r1, #300
		str		r1, [r0, #4]
		mov		r1, #1
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]		
		
		ldr		r0, =pawn10
		mov		r1, #700
		str		r1, [r0]
		mov		r1, #300
		str		r1, [r0, #4]
		mov		r1, #1
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]		
		
		ldr		r0, =knight
		mov		r1, #50
		str		r1, [r0]
		mov		r1, #200
		str		r1, [r0, #4]
		mov		r1, #3
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]		
		
		ldr		r0, =knight2
		mov		r1, #200
		str		r1, [r0]
		mov		r1, #200
		str		r1, [r0, #4]
		mov		r1, #3
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]
		
		ldr		r0, =knight3
        ldr     r1, =0x15e
		str		r1, [r0]
		mov		r1, #200
		str		r1, [r0, #4]
		mov		r1, #3
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]
		
		ldr		r0, =knight4
		mov		r1, #500
		str		r1, [r0]
		mov		r1, #200
		str		r1, [r0, #4]
		mov		r1, #3
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]
		
		ldr		r0, =knight5
        ldr     r1, =0x28a
		str		r1, [r0]
		mov		r1, #200
		str		r1, [r0, #4]
		mov		r1, #3
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]
		
		ldr		r0, =queen
		mov		r1, #200
		str		r1, [r0]
		mov		r1, #100
		str		r1, [r0, #4]
		mov		r1, #5
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]
		
		ldr		r0, =queen2
		mov		r1, #400
		str		r1, [r0]
		mov		r1, #100
		str		r1, [r0, #4]
		mov		r1, #5
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]
		
		ldr		r0, =queen3
		mov		r1, #600
		str		r1, [r0]
		mov		r1, #100
		str		r1, [r0, #4]
		mov		r1, #5
		str		r1, [r0, #20]
		mov		r1, #45
		str		r1, [r0,#28]
		
		ldr		r0, =destructoid
		mov		r1, #100
		str		r1, [r0]
        ldr     r1, =0x262
		str		r1, [r0, #4]
		mov		r1, #82
		str		r1, [r0, #12]
		mov		r1, #3
		str		r1, [r0, #20]

		ldr		r0, =destructoid2
		mov		r1, #300
		str		r1, [r0]
        ldr     r1, =0x262
		str		r1, [r0, #4]
		mov		r1, #82
		str		r1, [r0, #12]
		mov		r1, #3
		str		r1, [r0, #20]
		
		ldr		r0, =destructoid3
		mov		r1, #500
		str		r1, [r0]
        ldr     r1, =0x262
		str		r1, [r0, #4]
		mov		r1, #82
		str		r1, [r0, #12]
		mov		r1, #3
		str		r1, [r0, #20]
		
		ldr		r0, =destructoid4
		mov		r1, #700
		str		r1, [r0]
        ldr     r1, =0x262
		str		r1, [r0, #4]
		mov		r1, #82
		str		r1, [r0, #12]
		mov		r1, #3
		str		r1, [r0, #20]
		
		ldr		r0, =bullet
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #0
		str		r1, [r0, #4]
		mov		r1, #0
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_p
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #77
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_p2
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #44
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_p3
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #97
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_p4
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #82
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_p5
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #78
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_p6
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #99
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_p7
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #35
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_p8
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #95
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_p9
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #14
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_p10
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #40
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_k
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #78
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_k2
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #75
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_k3
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #62
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_k4
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #79
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_k5
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #3
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_q
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #46
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_q2
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #49
		str		r1, [r0, #20]
		
		ldr		r0, =bullet_q3
		mov		r1, #0
		str		r1, [r0]
		mov		r1, #792
		str		r1, [r0, #4]
		mov		r1, #78
		str		r1, [r0, #20]

		pop		{r0,r1,lr}
        bx      lr