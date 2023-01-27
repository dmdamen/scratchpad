@
@ Assembler equivalent to a do .. until statement
@ using the Pico SDK
@
@ DO
@	statements
@ UNTIL SELECT
@
@ R1 regsiter will hold the input number

.thumb_func
.global main

main:
	mov r1, #5	@ i = 5

do:
	sub r1, #1	@ until i == 0
	bne do
loop:
	b loop
