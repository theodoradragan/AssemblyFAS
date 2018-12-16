.data
.text
.global

// C code would be like :
// sum (x)
// if x = 0 return 0
// else return x + sum(x-1)

sum:
 sub sp, sp, #8 // making place for lr
 str lr, [sp]
 cmp r0, #0
 ble sum0
 sub sp, sp, #8 // making place for current argument of function
 sub r0 , #1
 bl sum

endsum:
 ldr r1, [sp]
 add sp, sp, #8
 add r0, r1
 ldr lr, [sp]
 add sp, sp, #8
 bx lr

sum0:
 mov r0, #0 // optional, we already had 0 in r0, but just to respect the pattern. and maybe understand my work later on.
 sub sp, sp, #8
 str r0, [sp] // storing the value 0 for sum(0)
 b endsum