include(`commons.m4').LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
.LC3:
	.string	"What you entered? Huh?"
f6:
; _EN(`save FP and LR in stack frame')_RU(`сохранить FP и LR в стековом фрейме'):
	stp	x29, x30, [sp, -32]!
; _EN(`set stack frame')_RU(`установить стековый фрейм') (FP=SP)
	add	x29, sp, 0
; _EN(`load pointer to the "Enter X:" string:')_RU(`загрузить указатель на строку "Enter X:"')
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
; _EN(`load pointer to the "\%d" string')_RU(`загрузить указатель на строку "\%d"'):
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; _EN(`calculate address of x variable in the local stack')_RU(`вычислить адрес переменной x в локальном стеке')
	add	x1, x29, 28
	bl	__isoc99_scanf
; scanf() _EN(`returned result in')_RU(`возвращает результат в') W0.
; _EN(`check it')_RU(`проверяем его'):
	cmp	w0, 1
; BNE _EN(`is')_RU(`это') Branch if Not Equal _RU(``(переход, если не равно)'')
; _EN(`so if')_RU(`так что если') W0<>0, _EN(`jump to L2 will be occurred')_RU(`произойдет переход на L2')
	bne	.L2
; _EN(`at this moment')_RU(`в этот момент') W0=1, _EN(`meaning no error')_RU(``означая, что ошибки не было'')
; _EN(`load x value from the local stack')_RU(`загрузить значение x из локального стека')
	ldr	w1, [x29,28]
; _EN(`load pointer to the "You entered \%d...\textbackslash{}n" string')_RU(`загрузить указатель на строку "You entered \%d...\textbackslash{}n"'):
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; _EN(``skip the code, which print the'')_RU(``пропустить код, печатающий строку'') "What you entered? Huh?" _EN(`string'):
	b	.L3
.L2:
; _EN(`load pointer to the')_RU(`загрузить указатель на строку') "What you entered? Huh?" _EN(`string'):
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	puts
.L3:
; _return 0
	mov	w0, 0
; _EN(`restore FP and LR')_RU(`восстановить FP и LR'):
	ldp	x29, x30, [sp], 32
	ret
