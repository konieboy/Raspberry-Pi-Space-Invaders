//Updates the data of the hero depending on what buttons are pressed by the player
//It then updates the data of the hero and enemies acordingly
.section    .init
.globl     update_hero_data

.section .text 

update_hero_data:
    push    {r0-r12,lr}
    ldr     r8, =0xFFBF         //load left bitmap
    cmp     r4, r8              //cmp left bitmap to input
    beq     LEFT                //branch to LEFT
    ldr     r8, =0xFF7F         //load right bitmap
    cmp     r4, r8              //cmp right bitmap to input
    beq     RIGHT               //branch to RIGHT
    ldr     r8, =0xFFEF         //load up bitmap
    cmp     r4, r8              //cmp up bitmap to input
    beq     UP                  //branch to UP    
    ldr     r8, =0xFFDF         //load down bitmap
    cmp     r4, r8              //cmp down bitmap to input
    beq     DOWN                //branch to DOWN 
    ldr     r8, =0xFEFF         //load 'A' bitmap
    cmp     r4, r8              //cmp 'A' bitmap to input
    beq     A                   //branch to A   
    ldr     r8, =0xFFF7         //load 'A' bitmap
    cmp     r4, r8              //cmp 'A' bitmap to input
    beq     START               //branch to A   
    b       update_bullet  

LEFT:
    ldr		r5, =hero         //load address of hero to r5
    ldr     r1, [r5]          //x  
    ldr     r2, [r5, #16]     //load delta
    bl      makeBlack         //making hero black
    ldr     r3, =0xf000       //reload color for hero
    str		r3,	[r5, #8]      //store color for hero
    cmp     r1, #32           //checking hero left bound
    subgt   r1, r2            //position x - delta
    str     r1, [r5]          //Store new position x value
    b       update_bullet

RIGHT:
    ldr		r5, =hero         //load address of hero to r5
    ldr     r1, [r5]          //x  
    ldr     r2, [r5, #16]     //load delta
    bl      makeBlack         //making hero black
    ldr     r3, =0xf000       //reload color for hero
    str		r3,	[r5, #8]      //store color for hero
    cmp     r1, #952         //checking hero right bound    
    addlt   r1, r2            //position x + delta
    str     r1, [r5]          //Store new position x value
    b       update_bullet

UP:
  /*  ldr		r5, =hero         //load address of hero to r5
    ldr     r1, [r5, #4]      //y  
    ldr     r2, [r5, #16]     //load delta
    bl      makeBlack         //making hero black
    ldr     r3, =0xf000       //reload color for hero
    str		r3,	[r5, #8]      //store color for hero
    sub     r1, r2            //position y - delta
    */str     r1, [r5, #4]      //Store new position y value
    b       update_bullet
DOWN:
    ldr		r5, =hero         //load address of hero to r5
    ldr     r1, [r5, #4]      //y  
    ldr     r2, [r5, #16]     //load delta
    bl      makeBlack         //making hero black
    ldr     r3, =0xf000       //reload color for hero
    str		r3,	[r5, #8]      //store color for hero
    cmp     r1, #720          //checking hero bottom bound  
    addlt   r1, r2            //position y + delta
    str     r1, [r5, #4]      //Store new position y value
    b       update_bullet

START:
    bl      snes_input
    ldr     r8, =0xFFFF
    cmp     r4, r8
    beq     pauseScreen
    b       START

A:
    ldr		r5, =hero         //load address of hero to r5
    ldr     r6, =bullet       //load address of bullet to r6
    ldr     r7, [r6, #20]     //load bullet counter
    cmp     r7, #1            //compare number of bullets
    beq     Adone    
    mov     r7, #1 
    str     r7, [r6, #20]
    ldr     r1, [r5]          //load x of hero
    ldr     r2, [r5, #4]      //load y of hero
    ldr     r3, [r6, #12]     //load bullet height
    add     r2, r3            //move bullet above hero
    add     r1, r3            //move bullet center to hero
    str     r1, [r6]          //Store bullet x position
    str     r2, [r6, #4]      //Store bullet y position
    ldr     r4, =0xD8A7       //load new color  
    str     r4, [r6, #8]      //store bullet color
Adone:   
    b       update_bullet

update_bullet:
    ldr     r5, =bullet         //bullet address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //load bullet counter
    bl      makeBlack           //making bullet black
    ldr     r3, =0xf666         //reload color for bullet
    str		r3,	[r5, #8]        //store color for bullet
    cmp     r1, #-20            //checking bullet upper bound
    subgt   r1, r2              //add speed/offset to y
    cmp     r1, #-10
    movlt   r4, #0              //bullet counter = 0 bullet OFS
    strlt   r4, [r5, #20]       //bullet out of screen store ctr
    str     r1, [r5, #4]        //store new y    

    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct

    b       update_pawn

update_pawn:
    ldr     r5, =pawn           //pawn address
    ldr     r1, [r5]            //pawn x
    ldr     r2, [r5, #20]       //pawn health
    ldr     r3, [r5, #24]       //pawn score value 
    ldr     r4, [r5, #16]       //pawn inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0320         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is pawn dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store pawn value         
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it
    b       update_pawn2   

update_pawn2:
    ldr     r5, =pawn2          //pawn address
    ldr     r1, [r5]            //pawn x
    ldr     r2, [r5, #20]       //pawn health
    ldr     r3, [r5, #24]       //pawn score value 
    ldr     r4, [r5, #16]       //pawn inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0320         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is pawn dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store pawn value   
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it            
    b       update_pawn3

update_pawn3:
    ldr     r5, =pawn3           //pawn address
    ldr     r1, [r5]            //pawn x
    ldr     r2, [r5, #20]       //pawn health
    ldr     r3, [r5, #24]       //pawn score value 
    ldr     r4, [r5, #16]       //pawn inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0320         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is pawn dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store pawn value         
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it      
    b       update_pawn4

update_pawn4:
    ldr     r5, =pawn4           //pawn address
    ldr     r1, [r5]            //pawn x
    ldr     r2, [r5, #20]       //pawn health
    ldr     r3, [r5, #24]       //pawn score value 
    ldr     r4, [r5, #16]       //pawn inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0320         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is pawn dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store pawn value  
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it             
    b       update_pawn5

update_pawn5:
    ldr     r5, =pawn5           //pawn address
    ldr     r1, [r5]            //pawn x
    ldr     r2, [r5, #20]       //pawn health
    ldr     r3, [r5, #24]       //pawn score value 
    ldr     r4, [r5, #16]       //pawn inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0320         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is pawn dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store pawn value 
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it              
    b       update_pawn6

update_pawn6:
    ldr     r5, =pawn6           //pawn address
    ldr     r1, [r5]            //pawn x
    ldr     r2, [r5, #20]       //pawn health
    ldr     r3, [r5, #24]       //pawn score value 
    ldr     r4, [r5, #16]       //pawn inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0320         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is pawn dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store pawn value   
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it            
    b       update_pawn7

update_pawn7:
    ldr     r5, =pawn7           //pawn address
    ldr     r1, [r5]            //pawn x
    ldr     r2, [r5, #20]       //pawn health
    ldr     r3, [r5, #24]       //pawn score value 
    ldr     r4, [r5, #16]       //pawn inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0320         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is pawn dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store pawn value   
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it            
    b       update_pawn8

update_pawn8:
    ldr     r5, =pawn8           //pawn address
    ldr     r1, [r5]            //pawn x
    ldr     r2, [r5, #20]       //pawn health
    ldr     r3, [r5, #24]       //pawn score value 
    ldr     r4, [r5, #16]       //pawn inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0320         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is pawn dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store pawn value    
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it           
    b       update_pawn9

update_pawn9:
    ldr     r5, =pawn9           //pawn address
    ldr     r1, [r5]            //pawn x
    ldr     r2, [r5, #20]       //pawn health
    ldr     r3, [r5, #24]       //pawn score value 
    ldr     r4, [r5, #16]       //pawn inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0320         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is pawn dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store pawn value 
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it              
    b       update_pawn10

update_pawn10:
    ldr     r5, =pawn10           //pawn address
    ldr     r1, [r5]            //pawn x
    ldr     r2, [r5, #20]       //pawn health
    ldr     r3, [r5, #24]       //pawn score value 
    ldr     r4, [r5, #16]       //pawn inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0320         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is pawn dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store pawn value     
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it          
    b       update_knight

update_knight:
    ldr     r5, =knight         //knight address
    ldr     r1, [r5]            //knight x
    ldr     r2, [r5, #20]       //knight health
    ldr     r3, [r5, #24]       //knight score value 
    ldr     r4, [r5, #16]       //knight inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0451         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is knight dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store knight value
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it               
    b       update_knight2

update_knight2:
    ldr     r5, =knight2         //knight address
    ldr     r1, [r5]            //knight x
    ldr     r2, [r5, #20]       //knight health
    ldr     r3, [r5, #24]       //knight score value 
    ldr     r4, [r5, #16]       //knight inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0451         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is knight dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store knight value  
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it             
    b       update_knight3

update_knight3:
    ldr     r5, =knight3         //knight address
    ldr     r1, [r5]            //knight x
    ldr     r2, [r5, #20]       //knight health
    ldr     r3, [r5, #24]       //knight score value 
    ldr     r4, [r5, #16]       //knight inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0451         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is knight dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store knight value  
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it             
    b       update_knight4

update_knight4:
    ldr     r5, =knight4         //knight address
    ldr     r1, [r5]            //knight x
    ldr     r2, [r5, #20]       //knight health
    ldr     r3, [r5, #24]       //knight score value 
    ldr     r4, [r5, #16]       //knight inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0451         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is knight dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store knight value         
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it      
    b       update_knight5

update_knight5:
    ldr     r5, =knight5         //knight address
    ldr     r1, [r5]            //knight x
    ldr     r2, [r5, #20]       //knight health
    ldr     r3, [r5, #24]       //knight score value 
    ldr     r4, [r5, #16]       //knight inc
    bl      makeBlack           //making pawn black
    ldr     r3, =0x0451         //reload color for pawn
    str		r3,	[r5, #8]        //store color for pawn
    cmp     r2, #0              //is knight dead?
    moveq   r3, #5              //move 5 score to pawn.score
    streq   r3, [r5, #24]       //store knight value       
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it        
    b       update_queen

update_queen:
    ldr     r5, =queen          //queen address
    ldr     r1, [r5]            //queen x
    ldr     r2, [r5, #20]       //queen health
    ldr     r3, [r5, #24]       //queen score value 
    ldr     r4, [r5, #16]       //queen inc
    bl      makeBlack           //making queen black
    ldr     r3, =0x8010         //reload color for queen
    str		r3,	[r5, #8]        //store color for queen
    cmp     r2, #0              //is queen dead?
    moveq   r3, #5              //move 5 score to queen.score
    streq   r3, [r5, #24]       //store queen value  
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it             
    b       update_queen2

update_queen2:
    ldr     r5, =queen2          //queen address
    ldr     r1, [r5]            //queen x
    ldr     r2, [r5, #20]       //queen health
    ldr     r3, [r5, #24]       //queen score value 
    ldr     r4, [r5, #16]       //queen inc
    bl      makeBlack           //making queen black
    ldr     r3, =0x8010         //reload color for queen
    str		r3,	[r5, #8]        //store color for queen
    cmp     r2, #0              //is queen dead?
    moveq   r3, #5              //move 5 score to queen.score
    streq   r3, [r5, #24]       //store queen value    
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it           
    b       update_queen3

update_queen3:
    ldr     r5, =queen3         //queen address
    ldr     r1, [r5]            //queen x
    ldr     r2, [r5, #20]       //queen health
    ldr     r3, [r5, #24]       //queen score value 
    ldr     r4, [r5, #16]       //queen inc
    bl      makeBlack           //making queen black
    ldr     r3, =0x8010         //reload color for queen
    str		r3,	[r5, #8]        //store color for queen
    cmp     r2, #0              //is queen dead?
    moveq   r3, #5              //move 5 score to queen.score
    streq   r3, [r5, #24]       //store queen value     
    bl      hitcheck			//check if hit   
    bl      enemyMove           //move it move it

update_destructoid:
    ldr     r5, =destructoid    //destructoid address
    ldr     r1, [r5]            //destructoid x
    ldr     r2, [r5, #20]       //destructoid health
    ldr     r3, [r5, #24]       //destructoid score value 
    ldr     r4, [r5, #16]       //destructoid inc
    bl      makeBlack           //making destructoid black
    cmp     r2, #0
    ldrgt   r3, =0xCC27         //reload color for destructoid
    strgt	r3,	[r5, #8]        //store color for destructoid

update_destructoid2:
    ldr     r5, =destructoid2    //destructoid address
    ldr     r1, [r5]            //destructoid x
    ldr     r2, [r5, #20]       //destructoid health
    ldr     r3, [r5, #24]       //destructoid score value 
    ldr     r4, [r5, #16]       //destructoid inc
    bl      makeBlack           //making destructoid black
    cmp     r2, #0
    ldrgt   r3, =0xCC27         //reload color for destructoid
    strgt	r3,	[r5, #8]        //store color for destructoid

update_destructoid3:
    ldr     r5, =destructoid3    //destructoid address
    ldr     r1, [r5]            //destructoid x
    ldr     r2, [r5, #20]       //destructoid health
    ldr     r3, [r5, #24]       //destructoid score value 
    ldr     r4, [r5, #16]       //destructoid inc
    bl      makeBlack           //making destructoid black
    cmp     r2, #0
    ldrgt   r3, =0xCC27         //reload color for destructoid
    strgt	r3,	[r5, #8]        //store color for destructoid

update_destructoid4:
    ldr     r5, =destructoid4    //destructoid address
    ldr     r1, [r5]            //destructoid x
    ldr     r2, [r5, #20]       //destructoid health
    ldr     r3, [r5, #24]       //destructoid score value 
    ldr     r4, [r5, #16]       //destructoid inc
    bl      makeBlack           //making destructoid black
    cmp     r2, #0
    ldrgt   r3, =0xCC27         //reload color for destructoid
    strgt   r3,	[r5, #8]        //store color for destructoid

update_bullet_p:
    ldr     r5, =bullet_p       //bullet_p address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //load reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0320         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =pawn           //address pawn
    ldreq   r0, [r6]            //takes pawn x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes pawn x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_p2    //if dead next bullet
    str   r4, [r5, #20]       //store counter

update_bullet_p2:
    ldr     r5, =bullet_p2       //bullet_p address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0320         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =pawn2           //address pawn
    ldreq   r0, [r6]            //takes pawn x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes pawn x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_p3    //if dead next bullet
    str   r4, [r5, #20]       //store counter

update_bullet_p3:
    ldr     r5, =bullet_p3       //bullet_p address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0320         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =pawn3           //address pawn
    ldreq   r0, [r6]            //takes pawn x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes pawn x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_p4    //if dead next bullet
    str   r4, [r5, #20]       //store counter
    
update_bullet_p4:
    ldr     r5, =bullet_p4       //bullet_p address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0320         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =pawn4           //address pawn
    ldreq   r0, [r6]            //takes pawn x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes pawn x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_p5    //if dead next bullet
    str   r4, [r5, #20]       //store counter
    
update_bullet_p5:
    ldr     r5, =bullet_p5       //bullet_p address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0320         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =pawn5           //address pawn
    ldreq   r0, [r6]            //takes pawn x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes pawn x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_p6    //if dead next bullet
    str   r4, [r5, #20]       //store counter
    
update_bullet_p6:
    ldr     r5, =bullet_p6       //bullet_p address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0320         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =pawn6           //address pawn
    ldreq   r0, [r6]            //takes pawn x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes pawn x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_p7    //if dead next bullet
    str   r4, [r5, #20]       //store counter
    
update_bullet_p7:
    ldr     r5, =bullet_p7       //bullet_p address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0320         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =pawn7           //address pawn
    ldreq   r0, [r6]            //takes pawn x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes pawn x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_p8    //if dead next bullet
    str   r4, [r5, #20]       //store counter
    
update_bullet_p8:
    ldr     r5, =bullet_p8       //bullet_p address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0320         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =pawn8           //address pawn
    ldreq   r0, [r6]            //takes pawn x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes pawn x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_p9    //if dead next bullet
    str   r4, [r5, #20]       //store counter
    
update_bullet_p9:
    ldr     r5, =bullet_p9       //bullet_p address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0320         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =pawn9           //address pawn
    ldreq   r0, [r6]            //takes pawn x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes pawn x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_p10    //if dead next bullet
    str   r4, [r5, #20]       //store counter
    
update_bullet_p10:
    ldr     r5, =bullet_p10       //bullet_p address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0320         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =pawn10           //address pawn
    ldreq   r0, [r6]            //takes pawn x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes pawn x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_k    //if dead next bullet
    str   r4, [r5, #20]       //store counter

update_bullet_k:
    ldr     r5, =bullet_k      //bullet_k address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0451         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =knight          //address knight
    ldreq   r0, [r6]            //takes knight x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes knight x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_k2    //if dead next bullet
    str   r4, [r5, #20]       //store counter

update_bullet_k2:
    ldr     r5, =bullet_k2      //bullet_k address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0451         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =knight2          //address knight
    ldreq   r0, [r6]            //takes knight x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes knight x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_k3    //if dead next bullet
    str   r4, [r5, #20]       //store counter

update_bullet_k3:
    ldr     r5, =bullet_k3      //bullet_k address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0451         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =knight3          //address knight
    ldreq   r0, [r6]            //takes knight x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes knight x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_k4    //if dead next bullet
    str   r4, [r5, #20]       //store counter

update_bullet_k4:
    ldr     r5, =bullet_k4      //bullet_k address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0451         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =knight4          //address knight
    ldreq   r0, [r6]            //takes knight x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes knight x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_k5    //if dead next bullet
    str   r4, [r5, #20]       //store counter

update_bullet_k5:
    ldr     r5, =bullet_k5      //bullet_k address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x0451         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =knight5          //address knight
    ldreq   r0, [r6]            //takes knight x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes knight x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_q    //if dead next bullet
    str   r4, [r5, #20]       //store counter

update_bullet_q:
    ldr     r5, =bullet_q      //bullet_k address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x8010         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =queen          //address knight
    ldreq   r0, [r6]            //takes knight x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes knight x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_q2    //if dead next bullet
    str   r4, [r5, #20]       //store counter

update_bullet_q2:
    ldr     r5, =bullet_q2      //bullet_k address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x8010         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =queen2         //address knight
    ldreq   r0, [r6]            //takes knight x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes knight x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     update_bullet_q3    //if dead next bullet
    str   r4, [r5, #20]       //store counter

update_bullet_q3:
    ldr     r5, =bullet_q3      //bullet_k address
    ldr     r1, [r5, #4]        //bullet y
    ldr     r2, [r5, #16]       //bullet speed
    ldr     r4, [r5, #20]       //store reload timer
    bl      makeBlack           //drawBlack
    ldr     r3, =0x8010         //load bullet color
    str     r3, [r5, #8]
    cmp     r4, #0              //can shoot?
    ldreq   r6, =queen3         //address knight
    ldreq   r0, [r6]            //takes knight x for bullet_p.x
    ldreq   r1, [r6, #4]        //takes knight x for bullet_p.y
    ldrne   r0, [r5]            //if bullet in flight then
    ldrne   r1, [r5, #4]        //take x and y from bullet
    subne   r4, #1              //dec reload timer
    moveq   r4, #100            //if new bullet set timer
    cmp     r1, #792            //check upper bound
    addlt   r1, r2              //y + speed
    str     r0, [r5]            //store bullet.p.x
    str     r1, [r5, #4]        //store bullet.p.y
    bl      heroHitCheck        //check if bullet hit hero
    bl      destructHitCheck    //check if bullet hit destruct
    bl      destructHitCheck2    //check if bullet hit destruct
    bl      destructHitCheck3    //check if bullet hit destruct
    bl      destructHitCheck4    //check if bullet hit destruct
    ldr     r7, [r6, #20]       //check pawn hp
    cmp     r7, #0              //check if dead
    beq     done_update_data    //if dead next bullet
    str   r4, [r5, #20]       //store counter
    
done_update_data:
    bl      getScore
    bl      checkWin
    bl      checkLoss
    mov     r1, r1
    pop     {r0-r12,lr}
    bx      lr

.globl makeBlack
makeBlack:           //used to draw black any object    
    push    {lr}
    ldr     r3, =0x0000       
    str		r3,	[r5, #8]      
    bl      update_hero_video      
    pop     {lr}
    bx      lr

checkWin:
    push    {r0,r1,r5,lr}
    ldr     r0, =pawn
    add     r2, r0, #576
checkWinLoop:
    ldr     r1, [r0, #20]
    cmp     r1, #0
    bgt     outOfWinLoop
    add     r0, #32
    cmp     r0, r2
    bge     winLoop
    b       checkWinLoop
outOfWinLoop:
    pop     {r0,r1,r5,lr}
    bx      lr
	
checkLoss:
	push	{lr}
	ldr		r0, =hero
	ldr		r1, [r0,#20]
	cmp		r1, #0
	ble		lossLoop
	pop		{lr}
	bx		lr









