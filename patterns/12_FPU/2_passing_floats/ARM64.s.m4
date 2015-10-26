include(`commons.m4')f:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	ldr	d1, .LC1 ; _EN(`load')_RU(`загрузить') 1.54 _EN(`into')_RU(`в') D1
	ldr	d0, .LC0 ; _EN(`load')_RU(`загрузить') 32.01 _EN(`into')_RU(`в') D0
	bl	pow
; _EN(`result of')_RU(`результат') pow() _in D0
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 16
	ret
.LC0:
; 32.01 _EN(`in IEEE 754 format')_RU(`в формате IEEE 754')
	.word	-1374389535
	.word	1077936455
.LC1:
; 1.54 _EN(`in IEEE 754 format')_RU(`в формате IEEE 754')
	.word	171798692
	.word	1073259479
.LC2:
	.string	"32.01 ^ 1.54 = %lf\n"
