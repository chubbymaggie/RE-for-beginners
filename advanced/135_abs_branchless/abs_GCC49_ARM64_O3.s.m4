include(`commons.m4')my_abs:
; _EN(`sign-extend input 32-bit value to X0 64-bit register:')_RU(``расширить входное 32-битное значение до 64-битного в регистре X0, учитывая знак:'')
	sxtw	x0, w0
	eor	x1, x0, x0, asr 63
; X1=X0^(X0>>63) _EN(`(shift is arithmetical)')_RU(`(арифметический сдвиг)')
	sub	x0, x1, x0, asr 63
; X0=X1-(X0>>63)=X0^(X0>>63)-(X0>>63) _EN(`(all shifts are arithmetical)')_RU(`(все сдвиги -- арифметические)')
	ret
