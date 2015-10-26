include(`commons.m4')str_trim:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	x0, [x29,24] ; _EN(`copy input argument into local stack')_RU(`скопировать входной аргумент в локальный стек')
	ldr	x0, [x29,24] ; s
	bl	strlen
	str	x0, [x29,40] ; _RU(`переменная ')str_len _EN(`variable in local stack')_RU(`в локальном стеке')
	b	.L2
; _EN(`main loop begin')_RU(`начало главного цикла')
.L5:
	ldrb	w0, [x29,39]
; W0=c
	cmp	w0, 13       ; _EN(`is it')_RU(`это') '\r'?
	beq	.L3
	ldrb	w0, [x29,39]
; W0=c
	cmp	w0, 10       ; _EN(`is it')_RU(`это') '\n'?
	bne	.L4          ; _EN(`goto exit if it is not')_RU(``перейти в конец, если нет'')
.L3:
	ldr	x0, [x29,40]
; X0=str_len
	sub	x0, x0, #1
; X0=str_len-1
	ldr	x1, [x29,24]
; X1=s
	add	x0, x1, x0
; X0=s+str_len-1
	strb	wzr, [x0]    ; _EN(`write byte at')_RU(`записать байт на') s+str_len-1
; _EN(`decrement')_RU(`декремент') str_len:
	ldr	x0, [x29,40]
; X0=str_len
	sub	x0, x0, #1
; X0=str_len-1
	str	x0, [x29,40]
; _EN(`save X0 (or str\_len-1) to local stack')_RU(`сохранить X0 (или str\_len-1) в локальном стеке')
.L2:
	ldr	x0, [x29,40]
; str_len==0?
	cmp	x0, xzr
; _EN(`goto exit then')_RU(``перейти на выход, если да'')
	beq	.L4
	ldr	x0, [x29,40]
; X0=str_len
	sub	x0, x0, #1
; X0=str_len-1
	ldr	x1, [x29,24]
; X1=s
	add	x0, x1, x0
; X0=s+str_len-1
; _EN(`load byte at address')_RU(`загрузить байт по адресу') s+str_len-1 _EN(`to')_RU(`в') W0
	ldrb	w0, [x0]
	strb	w0, [x29,39] ; _EN(`store loaded byte to')_RU(`сохранить загруженный байт в') "c"
	ldrb	w0, [x29,39] ; _EN(`reload it')_RU(`перезагрузить его')
; _EN(`is it zero byte')_RU(`это нулевой байт')?
	cmp	w0, wzr
; _EN(``goto exit, if it's zero or to L5 if it's not'')_RU(``перейти на конец, если это ноль, или на L5, если нет'')
	bne	.L5
.L4:
; _return s
	ldr	x0, [x29,24]
	ldp	x29, x30, [sp], 48
	ret
