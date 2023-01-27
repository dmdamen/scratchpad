@
@ Exersize adding two 96-bit numbers
@

.thumb_func
.global main

main:

@ Adding:
@ 	0x12345678 (R0)   0xFFFF0000 (R1)   0xF1234567 (R2)
@	0x76543210 (R3)   0x00010000 (R4)   0x10000000 (R5)
@       0x88888889        0x00000001        0x01234567

@ First 96-bit number
@ Load first word into R0
	mov r0,#0x12	@first byte
	lsl r0,#24	
	mov r7,#0x34	@second byte
	lsl r7,#16
	add r0,r7
	mov r7,#0x56	@third byte
	lsl r7,#8
	add r0,r7
	mov r7,#0x78	@fourth byte
	add r0,r7	
@ Load second word into R1
        mov r1,#0xFF	@first byte
	lsl r1,#24	
	mov r7,#0xFF	@second byte
	lsl r7,#16
	add r1,r7
@ Load third word into R2
	mov r2,#0xF1	@first byte
	lsl r2,#24	
	mov r7,#0x23	@second byte
	lsl r7,#16
	add r2,r7
	mov r7,#0x45	@third byte
	lsl r7,#8
	add r2,r7
	mov r7,#0x67	@fourth byte
	add r2,r7	
	
@ Second 96-bit number
@ Load first word into R3
	mov r3,#0x76	@first byte
	lsl r3,#24	
	mov r7,#0x54	@second byte
	lsl r7,#16
	add r3,r7
	mov r7,#0x32	@third byte
	lsl r7,#8
	add r3,r7
	mov r7,#0x10	@fourth byte
	add r3,r7
@ Load second word into R4
	mov r4,#0x00	@first byte
	lsl r4,#24	
	mov r7,#0x01	@second byte
	lsl r7,#16
	add r4,r7
@ Load third word into R5
	mov r5,#0x10
	lsl r5,#24

before:
	add r2,r5 	@add lowest words
	adc r1,r4
	adc r0,r3

after:

	b .

.data
	.align 4

