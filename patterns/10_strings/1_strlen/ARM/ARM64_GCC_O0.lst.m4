include(`commons.m4')my_strlen:
; _EN(`function prologue')_RU(`пролог функции')
	sub	sp, sp, #32
; _EN(`first argument (str) will be stored in')_RU(`первый аргумент (str) будет записан в') [sp,8]
	str	x0, [sp,8]
	ldr	x0, [sp,8]
; _EN(`copy "str" to "eos" variable')_RU(`скопировать переменную "str" в "eos"')
	str	x0, [sp,24]
	nop
.L62:
; eos++
	ldr	x0, [sp,24]  ; _EN(`load')_RU(`загрузить') "eos" _EN(`to')_RU(`в') X0
	add	x1, x0, 1    ; _increment X0
	str	x1, [sp,24]  ; _EN(`save')_RU(`сохранить') X0 _EN(`to')_RU(`в') "eos"
; _EN(`load byte from memory at address in X0 to W0')_RU(`загрузить байт из памяти по адресу в X0 в W0')
	ldrb	w0, [x0]
; _EN(`is it zero? (WZR is the 32-bit register always contain zero)')_RU(`это ноль? (WZR это 32-битный регистр всегда содержащий ноль)')
	cmp	w0, wzr
; _EN(`jump if not zero')_RU(`переход если не ноль') (Branch Not Equal)
	bne	.L62
; _EN(`zero byte found. now calculate difference.')_RU(`найден нулевой байт. вычисляем разницу.')
; _EN(`load')_RU(`загрузить') "eos" _EN(`to')_RU(`в') X1
	ldr	x1, [sp,24]
; _EN(`load')_RU(`загрузить') "str" _EN(`to')_RU(`в') X0
	ldr	x0, [sp,8]
; _EN(`calculate difference')_RU(`вычислить разницу')
	sub	x0, x1, x0
; _EN(`decrement result')_RU(`декремент результата')
	sub	w0, w0, #1
; _EN(`function epilogue')_RU(`эпилог функции')
	add	sp, sp, 32
	ret
