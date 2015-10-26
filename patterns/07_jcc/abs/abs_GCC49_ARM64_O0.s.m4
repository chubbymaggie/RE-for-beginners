include(`commons.m4')my_abs:
	sub	sp, sp, `#'16
	str	w0, [sp,12]
	ldr	w0, [sp,12]
; _RU(`сравнить входное значение с содержимым регистра WZR')_EN(`compare input value with contents of WZR register')
; _RU(`(который всегда содержит ноль)')_EN(`(which always holds zero)')
	cmp	w0, wzr
	bge	.L2
	ldr	w0, [sp,12]
	neg	w0, w0
	b	.L3
.L2:
	ldr	w0, [sp,12]
.L3:
	add	sp, sp, 16
	ret
