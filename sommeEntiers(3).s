.data
n: .word 10
enter:	.asciz "Entrer n : "
scan:	.asciz "%d"
return: .word	0
msg: .asciz "La somme des entiers est : %d \n"
.text
.global main

// C code would be like :
// sum (x)
// if x = 0 return 0
// else return x + sum(x-1)

sum:
 sub sp, sp, #8 // making place for lr
 str lr, [sp]
 cmp r0, #0
 ble sum0
 sub sp, sp, #8 // making place for current number (r0)
 str r0, [sp]
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
 mov r0, #0 // optional, we already had 0 in r0, but just to respect the pattern.
 sub sp, sp, #8
 str r0, [sp] // storing the value 0 for sum(0)
 b endsum

main:

 // to read n from stdin and put it in r0
 ldr r0, =enter
 bl printf
 ldr r0, =scan
 ldr r1, =return
 bl scanf
 ldr r1, =return
 ldr r2, [r1]
 mov r0,r2

 bl sum
 mov r1, r0
 ldr r0, =msg
 bl printf
 bl exit
