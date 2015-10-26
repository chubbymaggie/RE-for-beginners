ack:
	stp	x29, x30, [sp, -160]!
	add	x29, sp, 0
	stp	d8, d9, [sp,96]
	stp	x19, x20, [sp,16]
	stp	d10, d11, [sp,112]
	stp	x21, x22, [sp,32]
	stp	d12, d13, [sp,128]
	stp	x23, x24, [sp,48]
	stp	d14, d15, [sp,144]
	stp	x25, x26, [sp,64]
	stp	x27, x28, [sp,80]
	cbz	w0, .L2
	sub	w0, w0, #1
	fmov	s10, w0
	b	.L4
.L46:
	fmov	w0, s10
	mov	w1, 1
	sub	w0, w0, #1
	fmov	s10, w0
	fmov	w0, s13
	cbz	w0, .L2
.L4:
	fmov	s13, s10
	cbz	w1, .L46
	sub	w1, w1, #1
	fmov	s11, s10
	b	.L7
.L48:
	fmov	w0, s11
	mov	w1, 1
	sub	w0, w0, #1
	fmov	s11, w0
	fmov	w0, s14
	cbz	w0, .L47
.L7:
	fmov	s14, s11
	cbz	w1, .L48
	sub	w1, w1, #1
	fmov	s12, s11
	b	.L10
.L50:
	fmov	w0, s12
	mov	w1, 1
	sub	w0, w0, #1
	fmov	s12, w0
	fmov	w0, s15
	cbz	w0, .L49
.L10:
	fmov	s15, s12
	cbz	w1, .L50
	sub	w1, w1, #1
	fmov	s8, s12
	b	.L13
.L52:
	fmov	w0, s8
	mov	w1, 1
	sub	w0, w0, #1
	fmov	s8, w0
	fmov	w0, s9
	cbz	w0, .L51
.L13:
	fmov	s9, s8
	cbz	w1, .L52
	sub	w1, w1, #1
	fmov	w22, s8
	b	.L16
.L54:
	mov	w1, 1
	sub	w22, w22, #1
	cbz	w28, .L53
.L16:
	mov	w28, w22
	cbz	w1, .L54
	sub	w1, w1, #1
	mov	w21, w22
	b	.L19
.L56:
	mov	w1, 1
	sub	w21, w21, #1
	cbz	w24, .L55
.L19:
	mov	w24, w21
	cbz	w1, .L56
	sub	w1, w1, #1
	mov	w20, w21
	b	.L22
.L58:
	mov	w1, 1
	sub	w20, w20, #1
	cbz	w25, .L57
.L22:
	mov	w25, w20
	cbz	w1, .L58
	sub	w1, w1, #1
	mov	w26, w20
	b	.L25
.L60:
	mov	w1, 1
	sub	w26, w26, #1
	cbz	w27, .L59
.L25:
	mov	w27, w26
	cbz	w1, .L60
	sub	w1, w1, #1
	mov	w19, w26
	b	.L28
.L62:
	mov	w23, w19
	mov	w1, 1
	sub	w19, w19, #1
	cbz	w23, .L61
.L28:
	add	w0, w19, 1
	cbz	w1, .L62
	sub	w1, w1, #1
	mov	w23, w19
	sub	w19, w19, #1
	bl	ack
	mov	w1, w0
	cbnz	w23, .L28
.L61:
	add	w1, w1, 1
	sub	w26, w26, #1
	cbnz	w27, .L25
.L59:
	add	w1, w1, 1
	sub	w20, w20, #1
	cbnz	w25, .L22
.L57:
	add	w1, w1, 1
	sub	w21, w21, #1
	cbnz	w24, .L19
.L55:
	add	w1, w1, 1
	sub	w22, w22, #1
	cbnz	w28, .L16
.L53:
	fmov	w0, s8
	add	w1, w1, 1
	sub	w0, w0, #1
	fmov	s8, w0
	fmov	w0, s9
	cbnz	w0, .L13
.L51:
	fmov	w0, s12
	add	w1, w1, 1
	sub	w0, w0, #1
	fmov	s12, w0
	fmov	w0, s15
	cbnz	w0, .L10
.L49:
	fmov	w0, s11
	add	w1, w1, 1
	sub	w0, w0, #1
	fmov	s11, w0
	fmov	w0, s14
	cbnz	w0, .L7
.L47:
	fmov	w0, s10
	add	w1, w1, 1
	sub	w0, w0, #1
	fmov	s10, w0
	fmov	w0, s13
	cbnz	w0, .L4
.L2:
	add	w0, w1, 1
	ldp	d8, d9, [sp,96]
	ldp	x19, x20, [sp,16]
	ldp	d10, d11, [sp,112]
	ldp	x21, x22, [sp,32]
	ldp	d12, d13, [sp,128]
	ldp	x23, x24, [sp,48]
	ldp	d14, d15, [sp,144]
	ldp	x25, x26, [sp,64]
	ldp	x27, x28, [sp,80]
	ldp	x29, x30, [sp], 160
	ret
