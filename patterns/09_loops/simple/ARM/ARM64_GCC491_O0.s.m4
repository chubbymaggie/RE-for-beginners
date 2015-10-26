include(`commons.m4').LC0:
	.string	"f(%d)\n"
printing_function:
; _EN(`save FP and LR in the local stack')_RU(`сохранить FP и LR в локальном стеке'):
	stp	x29, x30, [sp, -32]!
; _EN(`set up stack frame')_RU(`установить стековый фрейм'):
	add	x29, sp, 0
; _EN(`save contents of W0 register')_RU(`сохранить содержимое регистра W0'):
	str	w0, [x29,28]
; _EN(`load address of the "f(\%d)\textbackslash{}n" string')_RU(`загрузить адрес строки "f(\%d)\textbackslash{}n"')
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; _EN(`reload input value from the local stack to W1 register')_RU(`перезагрузить входное значение из локального стека в регистр W1'):
	ldr	w1, [x29,28]
; _EN(`call')_RU(`вызвать') printf()
	bl	printf
; _EN(`restore FP and LR values')_RU(`восстановить значения FP и LR'):
	ldp	x29, x30, [sp], 32
	ret
main:
; _EN(`save FP and LR in the local stack')_RU(`сохранить FP и LR в локальном стеке'):
	stp	x29, x30, [sp, -32]!
; _EN(`set up stack frame')_RU(`установить стековый фрейм'):
	add	x29, sp, 0
; _EN(`initialize counter')_RU(`инициализировать счетчик')
	mov	w0, 2
; _EN(`store it to the place allocated for it in the local stack')_RU(``сохранить его в месте, выделенном для него в локальном стеке''):
	str	w0, [x29,28]
; _EN(`skip loop body and jump to the loop condition check instructions')_RU(``пропустить тело цикла, и перейти на инструкции проверки условия цикла''):
	b	.L3
.L4:
; _EN(`load counter value to')_RU(`загрузить значение счетчика в') W0.
; _EN(`it will be the first argument of')_RU(`это будет первый аргумент ф-ции') printing_function():
	ldr	w0, [x29,28]
; _EN(`call')_RU(`вызвать') printing_function():
	bl	printing_function
; _EN(`increment counter value')_RU(`инкремент значения счетчика'):
	ldr	w0, [x29,28]
	add	w0, w0, 1
	str	w0, [x29,28]
.L3:
; _EN(`loop condition check')_RU(`проверка условия цикла').
; _EN(`load counter value')_RU(`загрузить значение счетчика'):
	ldr	w0, [x29,28]
; _EN(`is it')_RU(`это') 9?
	cmp	w0, 9
; _EN(`less or equal? then jump to loop body begin:')_RU(`меньше или равно? тогда перейти на начало тела цикла:')
; _EN(`do nothing otherwise')_RU(`иначе ничего не делаем').
	ble	.L4
; _return 0
	mov	w0, 0
; _EN(`restore FP and LR values')_RU(`восстановить значения FP и LR'):
	ldp	x29, x30, [sp], 32
	ret
