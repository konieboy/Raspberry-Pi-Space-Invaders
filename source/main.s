.section    .init
.globl     _start
_start:
    b       main
    
.section .text

main:
    mov     sp, #0x8000
	
	bl		EnableJTAG

/**********************************************
               CLEAR REGISTERS R0-R12
**********************************************/

    mov     r0, #0
    mov     r1, #0
    mov     r2, #0
    mov     r3, #0
    mov     r4, #0
    mov     r5, #0
    mov     r6, #0
    mov     r7, #0
    mov     r8, #0
    mov     r9, #0
    mov     r10, #0
    mov     r11, #0
    mov     r12, #0
    //mov     r13, #0
    //mov     r14, #0
    //mov     r15, #0

/**********************************************
    **game crashes pi and must be reconnected when you force quit**	
    Programed by Brendan, Ethan and Konrad
               PROGRAM START
**********************************************/
	bl		initsnes
	bl		InitFrameBuffer
        
	cmp		r0, #0
	beq		haltLoop$

.globl start	
start:
	mov r1, #0
	mov r2, #0
	ldr r3, =0x0
	mov r4, #1024
    bl      box
	b		startScreen					

.globl gameLoop
gameLoop:
    bl      snes_input
    bl      update_hero_data
    bl      update_hero_video
    b       gameLoop
					
    b       haltLoop$       

.globl haltLoop$
haltLoop$:
	b		haltLoop$

.section .data

.align 4
font:		.incbin	"font.bin"
