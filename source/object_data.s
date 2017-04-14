.section .init

.section .text   

.section .data
/*******************************
            OBJECT DATA
    Sets data for all the objects
    in the game
********************************/
object_data:    ldr	    r5, =bullet
    bl	    removebullet
.globl hero
hero:
    .int    480         //0 position x
    .int    724         //4 position y
    .int    0xF000      //8 player color    
    .int    40          //12 height
    .int    20          //16 move inc
	.int 	50			//20 current score
.globl pawn	
pawn:
    .int    25   	    //0 position x
    .int    300	        //4 position y
    .int    0x0320      //8 pawn color     
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	1			//20 health
	.int	5			//24 points awarded on death
    .int    45          //28 move ctr20
.globl pawn2
pawn2:
    .int    100 	    //0 position x
    .int    300	        //4 position y
    .int    0x0320      //8 pawn color     
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	1			//20 health
	.int	5			//24 points awarded on death
    .int    45        //28 move ctr
.globl pawn3
pawn3:
    .int    175 	    //0 position x
    .int    300	        //4 position y
    .int    0x0320      //8 pawn color     
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	1			//20 health
	.int	5			//24 points awarded on death
    .int    45        //28 move ctr
.globl pawn4
pawn4:
    .int    250 	    //0 position x
    .int    300	        //4 position y
    .int    0x0320      //8 pawn color     
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	1			//20 health
	.int	5			//24 points awarded on death
    .int    45        //28 move ctr
.globl pawn5
pawn5:
    .int    325 	    //0 position x
    .int    300	        //4 position y
    .int    0x0320      //8 pawn color     
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	1			//20 health
	.int	5			//24 points awarded on death
    .int    45        //28 move ctr
.globl pawn6
pawn6:
    .int    400 	    //0 position x
    .int    300	        //4 position y
    .int    0x0320      //8 pawn color     
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	1			//20 health
	.int	5			//24 points awarded on death
    .int    45        //28 move ctr=
.globl pawn7
pawn7:
    .int    475 	    //0 position x
    .int    300	        //4 position y
    .int    0x0320      //8 pawn color     
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	1			//20 health
	.int	5			//24 points awarded on death
    .int    45        //28 move ctr
.globl pawn8
pawn8:
    .int    550 	    //0 position x
    .int    300	        //4 position y
    .int    0x0320      //8 pawn color     
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	1			//20 health
	.int	5			//24 points awarded on death
    .int    45        //28 move ctr
.globl pawn9
pawn9:
    .int    625 	    //0 position x
    .int    300	        //4 position y
    .int    0x0320      //8 pawn color     
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	1			//20 health
	.int	5			//24 points awarded on death
    .int    45        //28 move ctr
.globl pawn10
pawn10:
    .int    700 	    //0 position x
    .int    300	        //4 position y
    .int    0x0320      //8 pawn color     
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	1			//20 health
	.int	5			//24 points awarded on death
    .int    45        //28 move ctr
.globl knight
knight:	
    .int    50 	        //0 position x
    .int    200	        //4 position y
    .int    0x0451      //8 knight color    
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	3			//20 health
	.int	10			//24 points awarded on death
    .int    45        //28 move ctr
.globl knight2
knight2:	
    .int    200	        //0 position x
    .int    200	        //4 position y
    .int    0x0451      //8 knight color    
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	3			//20 health
	.int	10			//24 points awarded on death
    .int    45        //28 move ctr
.globl knight3
knight3:	
    .int    350	        //0 position x
    .int    200	        //4 position y
    .int    0x0451      //8 knight color    
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	3			//20 health
	.int	10			//24 points awarded on death
    .int    45        //28 move ctr
.globl knight4
knight4:	
    .int    500         //0 position x
    .int    200	        //4 position y
    .int    0x0451      //8 knight color    
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	3			//20 health
	.int	10			//24 points awarded on death
    .int    45        //28 move ctr
.globl knight5
knight5:	
    .int    650 	    //0 position x
    .int    200	        //4 position y
    .int    0x0451      //8 knight color    
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	3			//20 health
	.int	10			//24 points awarded on death
    .int    45        //28 move ctr
.globl  queen
queen:	
    .int    200	        //0 position x
    .int    100	        //4 position y
    .int    0x8010      //8 queen color    
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	5			//20 health
	.int	100			//24 points awarded on death
    .int    45        //28 move ctr
.globl  queen2
queen2:	
    .int    400	        //0 position x
    .int    100	        //4 position y
    .int    0x8010      //8 queen color    
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	5			//20 health
	.int	100			//24 points awarded on death
    .int    45        //28 move ctr
.globl  queen3
queen3:	
    .int    600	        //0 position x
    .int    100	        //4 position y
    .int    0x8010      //8 queen color    
    .int    48          //12 height
    .int    6           //4 move inc
	.int 	5			//20 health
	.int	100			//24 points awarded on death
    .int    45        //28 move ctr

.globl destructoid
destructoid:	
    .int    100	        //0 position x
    .int    610	        //4 position y
    .int    0xCC27      //8 destructoid color    
    .int    82          //12 height
    .int    0           //16 move inc
	.int 	3			//20 health

.globl destructoid2
destructoid2:	
    .int    300	        //0 position x
    .int    610	        //4 position y
    .int    0xCC27      //8 destructoid color    
    .int    82          //12 height
    .int    0           //16 move inc
	.int 	3			//20 health

.globl destructoid3
destructoid3:	
    .int    500	        //0 position x
    .int    610	        //4 position y
    .int    0xCC27      //8 destructoid color    
    .int    82          //12 height
    .int    0           //16 move inc
	.int 	3			//20 health

.globl destructoid4
destructoid4:	
    .int    700	        //0 position x
    .int    610	        //4 position y
    .int    0xCC27      //8 destructoid color    
    .int    82          //12 height
    .int    0           //16 move inc
	.int 	3			//20 health
	
.globl bullet
bullet:	
    .int    0 	        //0 position x
    .int    0	        //4 position y
    .int    0x0000      //8 bullet color    
    .int    10          //12 height
    .int    40           //16 move inc
    .int    0           //20 bullet counter

.globl bullet_p
bullet_p:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0320      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    77          //20 reload

.globl bullet_p2
bullet_p2:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0320      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    44          //20 reload

.globl bullet_p3
bullet_p3:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0320      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    97          //20 reload

.globl bullet_p4
bullet_p4:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0320      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    82          //20 reload

.globl bullet_p5
bullet_p5:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0320      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    78          //20 reload

.globl bullet_p6
bullet_p6:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0320      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    99          //20 reload

.globl bullet_p7
bullet_p7:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0320      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    35          //20 reload

.globl bullet_p8
bullet_p8:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0320      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    95          //20 reload

.globl bullet_p9
bullet_p9:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0320      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    14          //20 reload

.globl bullet_p10
bullet_p10:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0320      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    40          //20 reload

.globl bullet_k
bullet_k:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0451      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    78          //20 reload

.globl bullet_k2
bullet_k2:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0451      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    75          //20 reload

.globl bullet_k3
bullet_k3:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0451      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    62          //20 reload

.globl bullet_k4
bullet_k4:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0451      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    79          //20 reload

.globl bullet_k5
bullet_k5:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x0451      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    3           //20 reload

.globl bullet_q
bullet_q:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x8010      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    46          //20 reload

.globl bullet_q2
bullet_q2:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x8010      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    49          //20 reload

.globl bullet_q3
bullet_q3:	
    .int    0	        //0 position x
    .int    792	        //4 position y
    .int    0x8010      //8 bullet color    
    .int    10          //12 height
    .int    20          //16 move inc
    .int    78          //20 reload

.globl snes_buttons     //maps 
snes_buttons:
    .int    65534       //0 B   0xFFFE
    .int    65533       //4 Y   0xFFFD
    .int    65531       //8 Sl  0xFFFB
    .int    65527       //12 St 0xFFF7
    .int    65519       //16 UP 0xFFEF
    .int    65503       //20 DN 0xFFDF
    .int    65471       //24 LT 0xFFBF
    .int    65407       //28 RT 0xFF7F
    .int    65279       //32 A  0xFEFF
    .int    65023       //36 X  0xFDFF
    .int    64511       //40 L  0xFBFF
    .int    63487       //44 R  0xF7FF

