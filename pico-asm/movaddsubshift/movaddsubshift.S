@
@ Examples of the MOV/ADD/SUB/Shift instructions
@

.thumb_func
.global main


main:
	bl stdio_init_all

after:
	mov r2,#3 	@ Move 3 into register R2
	mov r1,r2 	@ R1 is now also 3
	movs r1,r2	@ the S explicitly states we want the first version
	mov r9,r2 	@ R9 now is 3

@ We shouldn't play with SP or PC until we know what we're doing.

	@ mov sp,r10 	@ SP = R13
	@ mov pc,r11 	@ PC = R15

	add r4,r2,#7 	@ This immediate allows 3 bits, so 0-7
			@ R3 is now 10 (3+7)
	add r4,r4,#255	@ This one allows 8 bits, so 0-255
			@ R4 is now 265 (10 + 255)
	add r4,#255	@ Alternate for R4 = R4 + 255
			@ R4 is now 520 (265 + 255)
	mov r7,#23	@ Can't load high registers with immediate
	mov r11,r7	@ So, load R7 and move it
	mov r7,#54
	mov r10,r7	@ If one source register is the destination, it can be omitted
	add r10,r10,r11	@ The one instruction to allow high registers
			@ R10 is now 77 (23 + 54)
	add sp,sp,#508	@ shouldn't do this without matching substraction
	sub sp,sp,#508	@ Undo the damage
	add r4,sp,#1020	@ 8 bit immediate but multiples of 4 so 0-1020 valid

@ Need to check R4 in the debugger since it depends on the value of SP
@ when I ran I got 0x200423fc but if the SDK changes, this could change.
@ Repeat the above shifts using the Assembler mnemonics.

	mov r3,#8	@ will use this to shift or rotate 1-byte
	mov r2,#0xff	@ R2 = 255
	mov r1,#4	@ R1 = 4
	lsl r1,r1,#2	@ shift R1 left 2 bits
	lsl r1,#2	@ shorter form if the registers are the same
	lsl r1,r2,#8	@ shift r2 right  by one bytes and place the result in R1
	lsl r1,r3	@ shift r1 right by the value in r3
	asr r1,#8	@ Arithmetic shift r1 right by one byte
	ror r1, r3	@ rotate r1 right by value of r3

@ Load 0x12345678 into R3
@ Initialize R3 with the leftmost byte
	mov r3,#0x12	@ load the first 8 bits
	lsl r3,#24	@ shift into place (24 bits)
@ Load the next byte into R1
	mov r1,#0x34	@ load the second byte
	lsl r1,#16	@ shift it into place (16 bits)
	add r3,r1	@ add it into r3
@ repeat for the third byte
	mov r1,#0x56	@ load the third byte
	lsl r1,#8	@ shift it into place (8 bits)
	add r3,r1	@ add it to the sum
@ for the last byte we do not need a shift
	mov r1,#0x78	@ Load the fourth byte
	add r3,r1

@ Other registers for our upcoming 64-bit addition
	mov r2,#0x12
	mov r4,#0x54
	mov r5,#0xf0
	lsl r5,#24	@ shift f0 over to the high byte

@ 64-bit addition (rigged to cause a carry)
@ Do sum:
@	R2 R3  0x12 0x12345678
@	R4 R5  0x54 0xF0000000
@	-----  ---------------
@	R0 R1  0x67 0x02345678

	add r1,r3,r5	@ lower order word
	adc r2,r4	@ higher order word
	mov r0,r2	@ move the result to where we want it
@ save r0, r1 since printf will overwrite them
	mov r6,r0	@ R6 = R0
	mov r7,r1	@ R7 = R1

@ print out the sum
loop:
	mov r1,r6	@ R1 is param2
	mov r2,r7	@ R2 is param3
	ldr r0,=sumstr	@ Load address of sumstr to param1
	bl printf	@ call printf
	b loop		@ loop in case uart monitoring not started

.data
	.align 4	@ must be alinged
sumstr:
	.asciz "The sum is %x %x\n"
