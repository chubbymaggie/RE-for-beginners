include(`commons.m4')f12:
	cmp	w0, 1
	beq	.L31
	cmp	w0, 2
	beq	.L32
	cbz	w0, .L35
; _EN(`default case')_RU(`метка по умолчанию')
	adrp	x0, .LC15	; "something unknown"
	add	x0, x0, :lo12:.LC15
	b	puts
.L35:
	adrp	x0, .LC12	; "zero"
	add	x0, x0, :lo12:.LC12
	b	puts
.L32:
	adrp	x0, .LC14	; "two"
	add	x0, x0, :lo12:.LC14
	b	puts
.L31:
	adrp	x0, .LC13	; "one"
	add	x0, x0, :lo12:.LC13
	b	puts
