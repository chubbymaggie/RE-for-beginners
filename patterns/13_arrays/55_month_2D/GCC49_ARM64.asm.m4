include(`commons.m4'); W0 = _EN(`month')_RU(`месяц')
	sxtw	x0, w0
; X0 = _EN(`sign-extended input value')_RU(`расширить входное значение учитывая знак')
	adrp	x1, .LANCHOR1
	add	x1, x1, :lo12:.LANCHOR1
; X1 = _EN(`pointer to the table')_RU(`указатель на таблицу')
	add	x0, x0, x0, lsl 2
; X0 = X0+X0<<2 = X0+X0*4 = X0*5
	add	x0, x1, x0, lsl 1
; X0 = X1+X0<<1 = X1+X0*2 = _EN(`pointer to the table')_RU(`указатель на таблицу') + X0*10
	ret
