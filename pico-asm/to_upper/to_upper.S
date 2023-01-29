@
@ Assembler program to replace lower case
@ character with upper case characters
@ using the Pico SDK
@
@ R0 - string parameter to printf
@ R3 - address of output string
@ R4 - address of input string
@ R5 - current character being processed
@

.thumb_func
.global main

main:
	bl stdio_init_all

start:		@ add a breakpoint here to skip the initialization
	ldr r4, =instr
	ldr r3, =outstr
loop:
	ldrb r5, [r4]	@load character
	add r4, #1
	cmp r5, #'z'
	bgt cont
	cmp r5, #'a'
	blt cont
	sub r5, #('a' - 'A')
cont:
	strb r5, [r3]
	add r3, #1
	cmp r5, #0
	bne loop
loop2:
	ldr r0, =outstr
	bl printf
	b loop2

.data

.align 4
instr:	.asciz	"This is our Test string that we will convert.\n"
outstr: .fill	255,1,0
