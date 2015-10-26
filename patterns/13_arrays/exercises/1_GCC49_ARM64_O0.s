s:
	sub	sp, sp, #48
	str	x0, [sp,24]
	str	x1, [sp,16]
	str	x2, [sp,8]
	str	wzr, [sp,44]
	b	.L2
.L5:
	str	wzr, [sp,40]
	b	.L3
.L4:
	ldr	w1, [sp,44]
	mov	w0, 100
	mul	w0, w1, w0
	sxtw	x1, w0
	ldrsw	x0, [sp,40]
	add	x0, x1, x0
	lsl	x0, x0, 3
	ldr	x1, [sp,8]
	add	x0, x1, x0
	ldr	w2, [sp,44]
	mov	w1, 100
	mul	w1, w2, w1
	sxtw	x2, w1
	ldrsw	x1, [sp,40]
	add	x1, x2, x1
	lsl	x1, x1, 3
	ldr	x2, [sp,24]
	add	x1, x2, x1
	ldr	x2, [x1]
	ldr	w3, [sp,44]
	mov	w1, 100
	mul	w1, w3, w1
	sxtw	x3, w1
	ldrsw	x1, [sp,40]
	add	x1, x3, x1
	lsl	x1, x1, 3
	ldr	x3, [sp,16]
	add	x1, x3, x1
	ldr	x1, [x1]
	fmov	d0, x2
	fmov	d1, x1
	fadd	d0, d0, d1
	fmov	x1, d0
	str	x1, [x0]
	ldr	w0, [sp,40]
	add	w0, w0, 1
	str	w0, [sp,40]
.L3:
	ldr	w0, [sp,40]
	cmp	w0, 99
	ble	.L4
	ldr	w0, [sp,44]
	add	w0, w0, 1
	str	w0, [sp,44]
.L2:
	ldr	w0, [sp,44]
	cmp	w0, 199
	ble	.L5
	add	sp, sp, 48
	ret
