.data
x: .word 10
y: .word 20
msg: .asciz "x est : %d et y est : %d \n"

.text
.global main

swap:
 ldr r3, =x		// Put address of x in r3
 ldr r1, [r3]	// Put value of r3 in r1
 ldr r4, =y		// Put address of y in r4
 ldr r2, [r4]	// Put value of r4 in r2
 sub sp, sp, #8	// Alloc 8 bytes on stack
 str r1, [sp]	// Put value of r1 in stack
 mov r1, r2		// Put value of r2 in r1
 ldr r2, [sp]	// Put value of sommet of stack in r2
 add sp, sp, #8	// Disalloc stack
 str r1, [r3]	// put value of r1 in r3
 str r2, [r4]	// put value of r2 in r4
 bx lr
 

main:
 bl swap

 ldr r0, =msg

 ldr r3, =x
 ldr r1, [r3]

 ldr r4, =y
 ldr r2, [r4]

 bl printf
 bl exit