@
@ Assembler equivalent od a select .. case statement
@ using the Pico SDK
@
@ SELECT NUMBER
@ 	CASE 1:
@		statements
@	CASE 2: 
@ 		statements
@	CASE ELSE:
@		statements
@	END SELECT
@
@ R1 regsiter will hold the input number

.thumb_func
.global main

main:
	MOV R1, #2	@ Load number to be tested in R1
case1:	CMP R1, #1	@ Compare to 1
	BNE case2	@ Jump to next case is R1 is not equal to 1
	MOV R3, #1	@ Dummy statement
	B end		@ Jump out 
case2:  CMP R1, #2	@ Second case
	BNE else
	MOV R3, #2
	B end
else:	MOV R3, #3
end:
	b end		@ infinite loop
