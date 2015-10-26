f:
	ldr	w3, [x0]
	mov	w4, 0
	ldr	w2, [x0,4]
	ldr	w10, [x1]
	ldr	w9, [x1,4]
	ldr	w8, [x1,8]
	ldr	w7, [x1,12]
.L2:
	mov	w5, 31161
	add	w6, w10, w2, lsl 4
	movk	w5, 0x9e37, lsl 16
	add	w1, w9, w2, lsr 5
	add	w4, w4, w5
	eor	w1, w6, w1
	add	w5, w2, w4
	mov	w6, 14112
	eor	w1, w1, w5
	movk	w6, 0xc6ef, lsl 16
	add	w3, w3, w1
	cmp	w4, w6
	add	w5, w3, w4
	add	w6, w8, w3, lsl 4
	add	w1, w7, w3, lsr 5
	eor	w1, w6, w1
	eor	w1, w1, w5
	add	w2, w2, w1
	bne	.L2
	str	w3, [x0]
	str	w2, [x0,4]
	ret
