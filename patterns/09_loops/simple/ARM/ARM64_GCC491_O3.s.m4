include(`commons.m4')printing_function:
; _EN(`prepare second argument of')_RU(`подготовить второй аргумент') printf():
	mov	w1, w0
; _EN(`load address of the "f(\%d)\textbackslash{}n" string')_RU(`загрузить адрес строки "f(\%d)\textbackslash{}n"')
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; _EN(`just branch here instead of branch with link and return')_RU(`здесь просто переход вместо перехода с сохранением адреса и инструкции возврата'):
	b	printf
main:
; _EN(`save FP and LR in the local stack')_RU(`сохранить FP и LR в локальном стеке'):
	stp	x29, x30, [sp, -32]!
; _EN(`set up stack frame')_RU(`установить стековый фрейм'):
	add	x29, sp, 0
; _EN(`save contents of X19 register in the local stack')_RU(`сохранить содержимое регистра X19 в локальном стеке'):
	str	x19, [sp,16]
; _EN(`we will use W19 register as counter')_RU(`будем использовать регистр W19 как счетчик').
; _EN(`set initial value of 2 to it')_RU(`установить начальное значение в 2'):
	mov	w19, 2
.L3:
; _EN(`prepare first argument of')_RU(`подготовить первый аргумент') printing_function():
	mov	w0, w19
; _EN(`increment counter register')_RU(`инкремент регистра счетчика').
	add	w19, w19, 1
; _EN(`W0 here still holds value of counter value before increment')_RU(`W0 все еще содержит значение счетчика перед инкрементом').
	bl	printing_function
; _EN(`is it end')_RU(`конец')?
	cmp	w19, 10
; _EN(``no, jump to the loop body begin'')_RU(``нет, перейти на начало тела цикла''):
	bne	.L3
; _return 0
	mov	w0, 0
; _EN(`restore contents of X19 register')_RU(`восстановить содержимое регистра X19'):
	ldr	x19, [sp,16]
; _EN(`restore FP and LR values')_RU(`восстановить значения FP и LR'):
	ldp	x29, x30, [sp], 32
	ret
.LC0:
	.string	"f(%d)\n"
