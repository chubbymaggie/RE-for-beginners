include(`commons.m4')my_memcpy:
; X0 = _EN(`destination address')_RU(`целевой адрес')
; X1 = _EN(`source address')_RU(`исходный адрес')
; X2 = _EN(`size of block')_RU(`размер блока')

; _EN(`initialize counter (i) at 0')_RU(`инициализировать счетчик (i) в 0')
	mov	x3, 0
.L2:
; _EN(`all bytes copied? exit then:')_RU(`все байты скопированы? тогда заканчиваем:')
	cmp	x3, x2
	beq	.L5
; _EN(`load byte at')_RU(`загружаем байт по адресу') X1+i:
	ldrb	w4, [x1,x3]
; _EN(`store byte at')_RU(`записываем байт по адресу') X1+i:
	strb	w4, [x0,x3]
	add	x3, x3, 1 ; i++
	b	.L2
.L5:
	ret
