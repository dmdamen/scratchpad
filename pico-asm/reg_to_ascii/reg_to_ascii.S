@
@ Assembler program to convert a register to ascii
@

.thumb_func
.global main

main:
	bl stdio_init_all

printexample:
	@ Load r4 with 0x12AB
	mov r4, #0x12
	lsl r4, #8
	mov r7, #0xAB
	add r4, r7
	ldr r1, =hexstr
	add r1, #9 	@ we start filling the string from the back

	@ The loop i = 8 to 1 step - 1
	mov r5, #8
loop4:
	mov r6, r4	@ select character
	mov r7, #0xf
	and r6, r7	@ focus on high byte only
	cmp r6, #10	@ if chararcter is < 10
	BGE letter
	add r6, #'0'
	b cont
letter:
	add r6, #('a' - 10)
cont:
	strb r6, [r1]	@holds the address of the final string
	sub r1, #1
	lsr r4, #4
	sub r5, #1
	bne loop4
repeat:
	ldr r0, =printstr
	ldr r1, =hexstr
	bl printf
	b repeat


.data
	.align 4

hexstr: 	.asciz "0x12345678"
printstr:	.asciz "Register = %s\n"
