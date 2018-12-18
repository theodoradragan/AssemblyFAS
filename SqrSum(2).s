.data
x: .word 3
y: .word 4
msg: .asciz "La somme est : %d \n"
.text
.global main

sqr:
 mov r3, r0
 mul r0, r3, r3
 bx lr

sumsqr:
 sub sp, sp, #8
 str lr, [sp]

 // first parameter of sumsqr is in r0
 // second parameter of sumsqr is in r1
 // result will be in r2

 // sqr(r0)
 bl sqr
 mov r2, r0 

 // sqr(r1)
 mov r0, r1
 bl sqr
 add r2, r0

 // Result in r0
 mov r0, r2

 ldr lr, [sp]
 add sp, sp, #8
 bx lr

main:
 ldr r2, =x
 ldr r0, [r2]
 ldr r3, =y
 ldr r1, [r3]

 bl sumsqr

 mov r1, r0
 ldr r0, =msg
 bl printf

 bl exit