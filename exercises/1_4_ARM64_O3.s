func:
	ldrb	w6, [x1]
	mov	x2, x0
	cbz	w6, .L2
	ldrb	w2, [x0]
	cbz	w2, .L24
.L17:
	ldrb	w2, [x0]
	cbz	w2, .L5
	cmp	w6, w2
	mov	x5, x0
	mov	x2, x1
	beq	.L18
	b	.L5
.L4:
	ldrb	w4, [x2]
	cmp	w3, w4
	cbz	w4, .L8
	bne	.L8
.L18:
	ldrb	w3, [x5,1]!
	add	x2, x2, 1
	cbnz	w3, .L4
.L8:
	ldrb	w2, [x2]
	cbz	w2, .L27
.L5:
	ldrb	w2, [x0,1]!
	cbnz	w2, .L17
.L24:
	mov	x2, 0
.L2:
	mov	x0, x2
	ret
.L27:
	mov	x2, x0
	mov	x0, x2
	ret
