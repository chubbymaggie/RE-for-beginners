include(`commons.m4').LC0:
	.string	"a[%d]=%d\n"
main:
; _EN(`save FP and LR in stack frame')_RU(`сохранить FP и LR в стековом фрейме'):
	stp	x29, x30, [sp, -112]!
; _EN(`set stack frame')_RU(`установить стековый фрейм') (FP=SP)
	add	x29, sp, 0
; _EN(`setting initial counter variable at 0 (WZR is the register always holding zero)')_RU(`установить начальное значение счетчика в 0 (WZR это регистр всегда содержащий ноль)'):
	str	wzr, [x29,108]
; _EN(`jump to loop condition checking code')_RU(`перейти на код проверки условия цикла'):
	b	.L2
.L3:
; _EN(`load value of "i" variable')_RU(`загрузить значение переменной "i"'):
	ldr	w0, [x29,108]
; _EN(`multiplicate it by')_RU(`умножить на') 2:
	lsl	w2, w0, 1
; _EN(`find a place of an array in local stack')_RU(`найти место массива в локальном стеке'):
	add	x0, x29, 24
; _EN(`load 32-bit integer from local stack and sign extend it to 64-bit one')_RU(`загрузить 32-битное число из локального стека и расширить его до 64-битного учитывая знак'):
	ldrsw	x1, [x29,108]
; _EN(`calculate address of element')_RU(`вычислить адрес элемента') (X0+X1<<2=array address+i*4) _EN(`and store')_RU(`и записать') W2 (i*2) _EN(`there')_RU(`там'):
	str	w2, [x0,x1,lsl 2]
; _EN(`increment counter')_RU(`инкремент счетчика') (i):
	ldr	w0, [x29,108]
	add	w0, w0, 1
	str	w0, [x29,108]
.L2:
; _EN(`check if we finished')_RU(``проверить, закончили ли''):
	ldr	w0, [x29,108]
	cmp	w0, 19
; _EN(`jump to L3 (loop body begin) if not')_RU(``перейти на L3 (начало тела цикла), если нет''):
	ble	.L3
; _EN(`second part of the function begins here')_RU(`здесь начинается вторая часть функции').
; _EN(`setting initial counter variable at')_RU(`устанавливаем первичного значение счетчика в') 0.
; _EN(``by the way, the same place in the local stack was used for counter,'')_RU(``кстати, это же место в локальном стеке было уже использовано под счетчик'')
; _EN(`because the same local variable (i) is being used as counter')_RU(`потому что та же локальная переменная (i) используется как счетчик').
	str	wzr, [x29,108]
	b	.L4
.L5:
; _EN(`calculate array address')_RU(`вычислить адрес массива'):
	add	x0, x29, 24
; _EN(`load "i" value')_RU(`загрузить переменную "i"'):
	ldrsw	x1, [x29,108]
; _EN(`load value from the array at the address')_RU(`загрузить значение из массива по адресу') (X0+X1<<2 = _EN(`address of array')_RU(`адрес массива') + i*4)
	ldr	w2, [x0,x1,lsl 2]
; _EN(`load address of the')_RU(`загрузить адрес строки') "a[%d]=%d\n" _EN(`string'):
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
; _EN(`load "i" variable to W1 and pass it to printf() as second argument')_RU(`загрузить переменную "i" в W1 и передать её в printf() как второй аргумент'):
	ldr	w1, [x29,108]
; W2 _EN(`still contains the value of array element which was just loaded')_RU(`всё еще содержит загруженный элемент из массива').
; _EN(`call')_RU(`вызов') printf():
	bl	printf
; _EN(`increment "i" variable')_RU(`инкремент переменной "i"'):
	ldr	w0, [x29,108]
	add	w0, w0, 1
	str	w0, [x29,108]
.L4:
; _EN(`are we finished')_RU(`закончили')?
	ldr	w0, [x29,108]
	cmp	w0, 19
; _EN(`jump to the loop body begin if not')_RU(``перейти на начало тела цикла, если нет''):
	ble	.L5
; _return 0
	mov	w0, 0
; _EN(`restore FP and LR')_RU(`восстановить FP и LR'):
	ldp	x29, x30, [sp], 112
	ret
