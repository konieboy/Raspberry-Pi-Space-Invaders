//Once the data is updated, this file draws all the objects onto the screen

.section    .init
.globl update_hero_video
.globl update_bullet_video
.globl update_pawn_video
.globl update_pawn2_video
.globl update_pawn3_video
.globl update_pawn4_video
.globl update_pawn5_video
.globl update_pawn6_video
.globl update_pawn7_video
.globl update_pawn8_video
.globl update_pawn9_video
.globl update_pawn10_video
.globl update_knight_video
.globl update_knight2_video
.globl update_knight3_video
.globl update_knight4_video
.globl update_knight5_video
.globl update_queen_video
.globl update_queen2_video
.globl update_queen3_video

.section .text 

update_hero_video:
    push    {r1-r12,lr}
    
    bl      border            //draw game board

	ldr		r0, =FrameBufferInit         
    ldr     r0, [r0, #32]     //load frameBuffer
    
    ldr		r5, =hero         // load address of hero to r0
    ldr     r1, [r5]          //load hero x position  
	ldr		r2, [r5, #4]      //load hero y position
	ldr		r3,	[r5, #8]      //load hero color
    ldr     r4, [r5, #12]     //load hero height
    bl      triangle  

update_bullet_video:
    ldr     r5, =bullet
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box    

update_pawn_video:
    ldr     r5, =pawn
    ldr     r1, [r5]          //load pawn x position  
	ldr		r2, [r5, #4]      //load pawn y position
	ldr		r3,	[r5, #8]      //load pawn color
    ldr     r4, [r5, #12]     //load pawn height
    bl      emptybox

update_pawn2_video:
    ldr     r5, =pawn2
    ldr     r1, [r5]          //load pawn x position  
	ldr		r2, [r5, #4]      //load pawn y position
	ldr		r3,	[r5, #8]      //load pawn color
    ldr     r4, [r5, #12]     //load pawn height
    bl      emptybox

update_pawn3_video:
    ldr     r5, =pawn3
    ldr     r1, [r5]          //load pawn x position  
	ldr		r2, [r5, #4]      //load pawn y position
	ldr		r3,	[r5, #8]      //load pawn color
    ldr     r4, [r5, #12]     //load pawn height
    bl      emptybox

update_pawn4_video:
    ldr     r5, =pawn4
    ldr     r1, [r5]          //load pawn x position  
	ldr		r2, [r5, #4]      //load pawn y position
	ldr		r3,	[r5, #8]      //load pawn color
    ldr     r4, [r5, #12]     //load pawn height
    bl      emptybox

update_pawn5_video:
    ldr     r5, =pawn5
    ldr     r1, [r5]          //load pawn x position  
	ldr		r2, [r5, #4]      //load pawn y position
	ldr		r3,	[r5, #8]      //load pawn color
    ldr     r4, [r5, #12]     //load pawn height
    bl      emptybox

update_pawn6_video:
    ldr     r5, =pawn6
    ldr     r1, [r5]          //load pawn x position  
	ldr		r2, [r5, #4]      //load pawn y position
	ldr		r3,	[r5, #8]      //load pawn color
    ldr     r4, [r5, #12]     //load pawn height
    bl      emptybox

update_pawn7_video:
    ldr     r5, =pawn7
    ldr     r1, [r5]          //load pawn x position  
	ldr		r2, [r5, #4]      //load pawn y position
	ldr		r3,	[r5, #8]      //load pawn color
    ldr     r4, [r5, #12]     //load pawn height
    bl      emptybox

update_pawn8_video:
    ldr     r5, =pawn8
    ldr     r1, [r5]          //load pawn x position  
	ldr		r2, [r5, #4]      //load pawn y position
	ldr		r3,	[r5, #8]      //load pawn color
    ldr     r4, [r5, #12]     //load pawn height
    bl      emptybox

update_pawn9_video:
    ldr     r5, =pawn9
    ldr     r1, [r5]          //load pawn x position  
	ldr		r2, [r5, #4]      //load pawn y position
	ldr		r3,	[r5, #8]      //load pawn color
    ldr     r4, [r5, #12]     //load pawn height
    bl      emptybox

update_pawn10_video:
    ldr     r5, =pawn10
    ldr     r1, [r5]          //load pawn x position  
	ldr		r2, [r5, #4]      //load pawn y position
	ldr		r3,	[r5, #8]      //load pawn color
    ldr     r4, [r5, #12]     //load pawn height
    bl      emptybox

update_knight_video:
    ldr     r5, =knight
    ldr     r1, [r5]          //load knight x position  
	ldr		r2, [r5, #4]      //load knight y position
	ldr		r3,	[r5, #8]      //load knight color
    ldr     r4, [r5, #12]     //load knight height
    bl      emptybox

update_knight2_video:
    ldr     r5, =knight2
    ldr     r1, [r5]          //load knight x position  
	ldr		r2, [r5, #4]      //load knight y position
	ldr		r3,	[r5, #8]      //load knight color
    ldr     r4, [r5, #12]     //load knight height
    bl      emptybox

update_knight3_video:
    ldr     r5, =knight3
    ldr     r1, [r5]          //load knight x position  
	ldr		r2, [r5, #4]      //load knight y position
	ldr		r3,	[r5, #8]      //load knight color
    ldr     r4, [r5, #12]     //load knight height
    bl      emptybox

update_knight4_video:
    ldr     r5, =knight4
    ldr     r1, [r5]          //load knight x position  
	ldr		r2, [r5, #4]      //load knight y position
	ldr		r3,	[r5, #8]      //load knight color
    ldr     r4, [r5, #12]     //load knight height
    bl      emptybox

update_knight5_video:
    ldr     r5, =knight5
    ldr     r1, [r5]          //load knight x position  
	ldr		r2, [r5, #4]      //load knight y position
	ldr		r3,	[r5, #8]      //load knight color
    ldr     r4, [r5, #12]     //load knight height
    bl      emptybox

update_queen_video:
    ldr     r5, =queen
    ldr     r1, [r5]          //load queen x position  
	ldr		r2, [r5, #4]      //load queen y position
	ldr		r3,	[r5, #8]      //load queen color
    ldr     r4, [r5, #12]     //load queen height
    bl      emptybox

update_queen2_video:
    ldr     r5, =queen2
    ldr     r1, [r5]          //load queen x position  
	ldr		r2, [r5, #4]      //load queen y position
	ldr		r3,	[r5, #8]      //load queen color
    ldr     r4, [r5, #12]     //load queen height
    bl      emptybox

update_queen3_video:
    ldr     r5, =queen3
    ldr     r1, [r5]          //load queen x position  
	ldr		r2, [r5, #4]      //load queen y position
	ldr		r3,	[r5, #8]      //load queen color
    ldr     r4, [r5, #12]     //load queen height
    bl      emptybox

update_destructoid_video:
    ldr     r5, =destructoid
    ldr     r1, [r5]          //load destructoid x position  
	ldr		r2, [r5, #4]      //load destructoid y position
	ldr		r3,	[r5, #8]      //load destructoid color
    ldr     r4, [r5, #12]     //load destructoid height
    bl      emptybox

update_destructoid2_video:
    ldr     r5, =destructoid2
    ldr     r1, [r5]          //load destructoid x position  
	ldr		r2, [r5, #4]      //-load destructoid y position
	ldr		r3,	[r5, #8]      //load destructoid color
    ldr     r4, [r5, #12]     //load destructoid height
    bl      emptybox

update_destructoid3_video:
    ldr     r5, =destructoid3
    ldr     r1, [r5]          //load destructoid x position  
	ldr		r2, [r5, #4]      //load destructoid y position
	ldr		r3,	[r5, #8]      //load destructoid color
    ldr     r4, [r5, #12]     //load destructoid height
    bl      emptybox

update_destructoid4_video:
    ldr     r5, =destructoid4
    ldr     r1, [r5]          //load destructoid x position  
	ldr		r2, [r5, #4]      //load destructoid y position
	ldr		r3,	[r5, #8]      //load destructoid color
    ldr     r4, [r5, #12]     //load destructoid height
    bl      emptybox

update_bullet_p_video:
    ldr     r5, =bullet_p
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_p2_video:
    ldr     r5, =bullet_p2
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_p3_video:
    ldr     r5, =bullet_p3
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_p4_video:
    ldr     r5, =bullet_p4
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_p5_video:
    ldr     r5, =bullet_p5
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_p6_video:
    ldr     r5, =bullet_p6
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_p7_video:
    ldr     r5, =bullet_p7
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_p8_video:
    ldr     r5, =bullet_p8
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box
    
update_bullet_p9_video:
    ldr     r5, =bullet_p9
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_p10_video:
    ldr     r5, =bullet_p10
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_k_video:
    ldr     r5, =bullet_k
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_k2_video:
    ldr     r5, =bullet_k2
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_k3_video:
    ldr     r5, =bullet_k3
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_k4_video:
    ldr     r5, =bullet_k4
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_k5_video:
    ldr     r5, =bullet_k5
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_q_video:
    ldr     r5, =bullet_q
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_q2_video:
    ldr     r5, =bullet_q2
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_bullet_q3_video:
    ldr     r5, =bullet_q3
    ldr     r1, [r5]          //load bullet x position  
	ldr		r2, [r5, #4]      //load bullet y position
	ldr		r3,	[r5, #8]      //load bullet color
    ldr     r4, [r5, #12]     //load bullet height
    bl      box

update_score_video:
    bl displayScore

    pop     {r1-r12,lr}
    bx      lr













