f:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x19, [sp,16]
	str	w0, [x29,44]
	str	w1, [x29,40]
	ldr	w0, [x29,44]
	cmp	w0, wzr
	bne	.L2
	ldr	w0, [x29,40]
	add	w0, w0, 1
	b	.L3
.L2:
	ldr	w0, [x29,40]
	cmp	w0, wzr
	bne	.L4
	ldr	w0, [x29,44]
	sub	w0, w0, #1
	mov	w1, 1
	bl	ack
	b	.L3
.L4:
	ldr	w0, [x29,44]
	sub	w19, w0, #1
	ldr	w0, [x29,40]
	sub	w1, w0, #1
	ldr	w0, [x29,44]
	bl	ack
	mov	w1, w0
	mov	w0, w19
	bl	ack
.L3:
	ldr	x19, [sp,16]
	ldp	x29, x30, [sp], 48
	ret
