include(`commons.m4').LC0:
	.string	"Enter X:"
.LC1:
	.string	"%d"
.LC2:
	.string	"You entered %d...\n"
scanf_main:
; _EN(``subtract 32 from SP, then save FP and LR in stack frame'')_RU(``вычесть 32 из SP, затем сохранить FP и LR в стековом фрейме''):
	stp	x29, x30, [sp, -32]!
; _EN(`set stack frame')_RU(`установить стековый фрейм') (FP=SP)
	add	x29, sp, 0
; _EN(`load pointer to the "Enter X:" string:')_RU(`загрузить указатель на строку "Enter X:"')
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; X0=_EN(`pointer to the "Enter X:" string')_RU(`указатель на строку "Enter X:"')
; _EN(`print it')_RU(`вывести её'):
	bl	puts
; _EN(`load pointer to the "\%d" string')_RU(`загрузить указатель на строку "\%d"'):
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
; _EN(`find a space in stack frame for "x" variable')_RU(`найти место в стековом фрейме для переменной "x"') (X1=FP+28):
	add	x1, x29, 28
; X1=_EN(`address of "x" variable')_RU(`адрес переменной "x"')
; _EN(`pass the address to scanf() and call it')_RU(`передать адрес в scanf() и вызвать её'):
	bl	__isoc99_scanf
; _EN(`load 32-bit value from the variable in stack frame')_RU(`загрузить 32-битное значение из переменной в стековом фрейме'):
	ldr	w1, [x29,28]
; W1=x
; _EN(`load pointer to the "You entered \%d...\textbackslash{}n" string')_RU(`загрузить указатель на строку "You entered \%d...\textbackslash{}n"')
; printf() _EN(`will take text string from X0 and "x" variable from X1 (or W1)')_RU(`возьмет текстовую строку из X0 и переменную "x" из X1 (или W1)')
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
; _return 0
	mov	w0, 0
; _EN(``restore FP and LR, then add 32 to SP'')_RU(``восстановить FP и LR, затем прибавить 32 к SP''):
	ldp	x29, x30, [sp], 32
	ret
