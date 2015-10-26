include(`commons.m4')d_max:
; _EN(`save input arguments in')_RU(`сохранить входные аргументы в') "Register Save Area"
	sub	sp, sp, #16
	str	d0, [sp,8]
	str	d1, [sp]
; _EN(`reload values')_RU(`перезагрузить значения')
	ldr	x1, [sp,8]
	ldr	x0, [sp]
	fmov	d0, x1
	fmov	d1, x0
; D0 - a, D1 - b
	fcmpe	d0, d1
	ble	.L76
; a>b; _EN(`load')_RU(`загрузить') D0 (a) _EN(`into')_RU(`в') X0
	ldr	x0, [sp,8]
	b	.L74
.L76:
; a<=b; _EN(`load')_RU(`загрузить') D1 (b) _EN(`into')_RU(`в') X0
	ldr	x0, [sp]
.L74:
; _EN(`result in')_RU(`результат в') X0
	fmov	d0, x0
; _EN(`result in')_RU(`результат в') D0
	add	sp, sp, 16
	ret
