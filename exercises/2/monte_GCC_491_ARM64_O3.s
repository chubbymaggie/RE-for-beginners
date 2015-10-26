f1:
	adrp	x2, .LANCHOR0
	mov	w3, 26125
	mov	w0, 62303
	movk	w3, 0x19, lsl 16
	movk	w0, 0x3c6e, lsl 16
	ldr	w1, [x2,#:lo12:.LANCHOR0]
	fmov	s0, 3.0e+0
	madd	w0, w1, w3, w0
	str	w0, [x2,#:lo12:.LANCHOR0]
	and	w0, w0, 8388607
	orr	w0, w0, 1073741824
	fmov	s1, w0
	fsub	s0, s1, s0
	ret
main_function:
	adrp	x7, .LANCHOR0
	mov	w3, 16960
	movk	w3, 0xf, lsl 16
	mov	w2, 0
	fmov	s2, 3.0e+0
	ldr	w1, [x7,#:lo12:.LANCHOR0]
	fmov	s3, 1.0e+0
.L5:
	mov	w6, 26125
	mov	w0, 62303
	movk	w6, 0x19, lsl 16
	movk	w0, 0x3c6e, lsl 16
	mov	w5, 26125
	mov	w4, 62303
	madd	w1, w1, w6, w0
	movk	w5, 0x19, lsl 16
	movk	w4, 0x3c6e, lsl 16
	and	w0, w1, 8388607
	add	w6, w2, 1
	orr	w0, w0, 1073741824
	madd	w1, w1, w5, w4
	fmov	s0, w0
	and	w0, w1, 8388607
	orr	w0, w0, 1073741824
	fmov	s1, w0
	fsub	s0, s0, s2
	fsub	s1, s1, s2
	fmul	s1, s1, s1
	fmadd	s0, s0, s0, s1
	fcmp	s0, s3
	csel	w2, w2, w6, pl
	subs	w3, w3, #1
	bne	.L5
	scvtf	s0, w2
	str	w1, [x7,#:lo12:.LANCHOR0]
	fmov	d1, 4.0e+0
	fcvt	d0, s0
	fmul	d0, d0, d1
	ldr	d1, .LC0
	fdiv	d0, d0, d1
	fcvt	s0, d0
	ret
.LC0:
	.word	0
	.word	1093567616
v1:
	.word	1013904223
v2:
	.word	1664525
.LANCHOR0 = . + 0
v3.3095:
	.word	305419896
