//Creates a delay by continualy subtracting 1 from a large number (that the user sets as an aurgument)

.section    .init
.globl     delay

.section .text 
delay:
    subs     r3, #1
    bne     delay
    bxeq    lr
