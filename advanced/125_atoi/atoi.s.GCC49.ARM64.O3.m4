include(`commons.m4')define(`_input_digit',`_EN(`input digit')_RU(`входная цифра')')my_atoi:
; _EN(`load input character into')_RU(`загрузить входной символ в') W1
	ldrb	w1, [x0]
	mov	x2, x0
; X2=_EN(`address of input string')_RU(`адрес входной строки')
; _EN(`is loaded character zero')_RU(`загруженный символ - 0')?
; _EN(``jump to exit if it's so'')_RU(``перейти на выход, если это так'')
; W1 _EN(`will contain 0 in this case')_RU(`будет содержать 0 в этом случае').
; _EN(`it will be reloaded into W0 at L4')_RU(`он будет перезагружен в W0 на L4').
	cbz	w1, .L4
; W0 _EN(`will contain "rt" variable')_RU(`будет содержать переменную "rt"')
; _EN(`initialize it at zero')_RU(`инициализировать её нулем'):
	mov	w0, 0
.L3:
; _EN(`subtract')_RU(`вычесть') 48 _or '0' _EN(`from input variable and put result into')_RU(`из входной переменной и оставить результат в') W3:
	sub	w3, w1, #48
; _EN(`load next character at address')_RU(`загрузить следующий символ по адресу') X2+1 _EN(`into')_RU(`в') W1 _EN(`with pre-increment')_RU(`с пре-инкрементом'):
	ldrb	w1, [x2,1]!
	add	w0, w0, w0, lsl 2
; W0=W0+W0<<2=W0+W0*4=rt*5
	add	w0, w3, w0, lsl 1
; W0=_input_digit + W0<<1 = _input_digit + rt*5*2 = _input_digit + rt*10
; _EN(``if the character we just loaded is not null byte, jump to the loop begin'')_RU(``если только что загруженный символ - это нулевой байт, перейти на начало цикла'')
	cbnz	w1, .L3
; _EN(``variable to be returned (rt) is in W0, ready to be used in caller function'')_RU(``значение для возврата (rt) в W0, готовое для использования в вызывающей ф-ции'')
	ret
.L4:
	mov	w0, w1
	ret
