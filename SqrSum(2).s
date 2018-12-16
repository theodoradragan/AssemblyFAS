.data
.text
.global main

sqr:
 mov r1, r0
 mul r0, r1, r1
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
 bl sqr
 bl exit