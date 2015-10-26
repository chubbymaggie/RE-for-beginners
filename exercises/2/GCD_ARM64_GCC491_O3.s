f:
	mov	w3, w0
	mov	w0, w1
	cbz	w3, .L8
	mov	w0, w3
	cbz	w1, .L8
	mov	w6, 31
	orr	w5, w3, w1
	neg	w2, w3
	neg	w7, w5
	and	w2, w2, w3
	clz	w2, w2
	sub	w2, w6, w2
	and	w5, w7, w5
	mov	w4, w6
	clz	w5, w5
	lsr	w0, w3, w2
	sub	w5, w6, w5
	b	.L13
.L22:
	bls	.L12
	eor	w1, w1, w2
	eor	w0, w1, w2
.L12:
	cmp	w0, 1
	sub	w1, w1, w0
	beq	.L11
.L13:
	neg	w2, w1
	cmp	w1, wzr
	and	w2, w2, w1
	clz	w2, w2
	sub	w3, w4, w2
	csel	w2, w3, w2, ne
	lsr	w1, w1, w2
	cmp	w0, w1
	eor	w2, w1, w0
	bne	.L22
.L11:
	lsl	w0, w0, w5
.L8:
	ret
