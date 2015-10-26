include(`commons.m4')f_unsigned:
	stp	x29, x30, [sp, -48]!
; W0=a, W1=b
	cmp	w0, w1
	add	x29, sp, 0
	str	x19, [sp,16]
	mov	w19, w0
	bhi	.L25	; Branch if HIgher _RU(``(переход, если выше)'')(a>b)
	cmp	w19, w1
	beq	.L26	; Branch if Equal _RU(``(переход, если равно)'')(a==b)
.L23:
	bcc	.L27	; Branch if Carry Clear _RU(``(если нет переноса)'')(_EN(`if less than')_RU(``если меньше, чем'')) (a<b)
; _EN(``function epilogue, impossible to be here'')_RU(``эпилог функции, сюда попасть невозможно'')
	ldr	x19, [sp,16]
	ldp	x29, x30, [sp], 48
	ret
.L27:
	ldr	x19, [sp,16]
	adrp	x0, .LC11	; "a<b"
	ldp	x29, x30, [sp], 48
	add	x0, x0, :lo12:.LC11
	b	puts
.L25:
	adrp	x0, .LC9	; "a>b"
	str	x1, [x29,40]
	add	x0, x0, :lo12:.LC9
	bl	puts
	ldr	x1, [x29,40]
	cmp	w19, w1
	bne	.L23	; Branch if Not Equal _RU(``(переход, если не равно)'')
.L26:
	ldr	x19, [sp,16]
	adrp	x0, .LC10	; "a==b"
	ldp	x29, x30, [sp], 48
	add	x0, x0, :lo12:.LC10
	b	puts
