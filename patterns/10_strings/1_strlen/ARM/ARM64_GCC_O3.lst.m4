include(`commons.m4')my_strlen:
	mov	x1, x0
	; X1 _EN(``is now temporary pointer (eos), acting like cursor'')_RU(``теперь временный регистр (eos), работающий, как курсор'')
.L58:
	; _EN(``load byte from X1 to W2, increment X1 (post-index)'')_RU(``загрузить байт из X1 в W2, инкремент X1 (пост-индекс)'')
	ldrb	w2, [x1],1
	; Compare and Branch if NonZero: _EN(``compare W2 with 0, jump to .L58 if it is not'')_RU(``сравнить W0 с нулем, перейти на .L58 если не ноль'')
	cbnz	w2, .L58
	; _EN(`calculate difference between initial pointer in X0 and current address in X1')_RU(`вычислить разницу между изначальным указателем в X0 и текущим адресом в X1')
	sub	x0, x1, x0
	; _EN(`decrement lowest 32-bit of result')_RU(`декремент младших 32-х бит результата')
	sub	w0, w0, #1
	ret
