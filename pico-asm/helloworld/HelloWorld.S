@
@ Assembler program to print out "Hello World"
@ using the Pico SDK
@
@ R0 - first parameter to printf
@ R1 - second parameter to printf
@ R7 - index counter
@

.thumb_func
.global main

main:
	mov r7, #0
	bl stdio_init_all
loop:
	ldr r0, =helloworld
	add r7, #1
	mov r1, r7
	bl printf
	b loop

.data
	.align 4
helloworld: .asciz "Hello World %X\n"
