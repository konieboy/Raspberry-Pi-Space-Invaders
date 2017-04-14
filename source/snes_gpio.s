//gets the input of the SNES controler

.section .text
.globl initsnes

//takes nothing, returns buttons in r4

initsnes:
    
    	push    {lr}
	
    //Setting Clock to output
	ldr r0, =0x20200004	//address for GPFSEL1
	ldr r1, [r0]
	mov r2, #7		//(b0111)
	lsl r2, #3
	
	bic r1, r2		//clear pin 11 bits
	mov r3, #1		//output function code
	lsl r3, #3		// r3 = 0 001 000
	orr r1, r3
	str r1, [r0]		//write back to GPFSEL1

	//Setting Latch to output
	ldr r0, =0x20200000	//address for GPFSEL0
	ldr r1, [r0]
	mov r2, #7		//(b0111)
	lsl r2, #27		//shifting to pin 9
	
	bic r1, r2		//clear pin 9 bits
	mov r3, #1		//output function code
	lsl r3, #27		// r3 = 0 001 000
	orr r1, r3
	str r1, [r0]		//write back to GPFSEL0

	//Setting Data to input
	ldr r0, =0x20200004	//address for GPFSEL1
	ldr r1, [r0]
	mov r2, #7		//(b0111)

	bic r1, r2		//clear pin 10 bits
	str r1, [r0]		//write back to GPFSEL1

	pop {lr}
	bx lr
.globl snes_input
snes_input:
	push {lr}
	buttons .req r4
	mov buttons, #0		//clearing the buttons register

	//writing 1 to Clock
	mov r0, #1
	bl writeC

	//writing 1 to Latch
	mov r0, #1
	bl writeL

	//wait 12 microseconds
	mov r0, #12
	bl wait
	
	//write 0 to Latch
	mov r0, #0
	bl writeL

	mov r5, #0	//counter
pulseLoop:
	mov r0, #6
	bl wait		//wait 6ms
	mov r0, #0
	bl writeC	//write 0 to clock
	mov r0, #6
	bl wait		//wait
	bl readD
	lsl r0, r5	//shift input to appropriate spot
	orr buttons, r0	//put input into buttons
	mov r0, #1
	bl writeC	//write clock to 1
	add r5, #1	//incrememnt counter
	cmp r5, #16	//compare to 16
	blt pulseLoop
    
    pop    {lr}    
    bx  lr    

haltloop:
	b haltloop
	
writeC:
	mov r1, #11
	ldr r2, =0x20200000
	mov r3, #1
	lsl r3, r1		//shifting to pin 11
	teq r0, #0
	streq r3, [r2, #40]	//GPRCLR1
	strne r3, [r2, #28]	//GPRSET1
	bx lr

writeL:
	mov r1, #9
	ldr r2, =0x20200000
	mov r3, #1
	lsl r3, r1		//shifting to pin 9
	teq r0, #0
	streq r3, [r2, #40]	//GPRCLR1
	strne r3, [r2, #28]	//GPRSET1
	bx lr

readD:
	mov r0, #10		//Data Line
	ldr r2, =0x20200000
	ldr r1, [r2, #52]	//GPLEV0
	mov r3, #1
	lsl r3, r0		//align to pin 10
	and r1, r3		//mask everything else
	teq r1, #0
	moveq r0, #0		//return 1 or 0
	movne r0, #1

wait:	
	ldr r3, =0x20003004	//address of clock
	ldr r1, [r3]		//read clock
	add r1, r0		//add microseconds
	waitLoop:
		ldr r2, [r3]
		cmp r1, r2
		bhi waitLoop
	bx lr

.section .data

