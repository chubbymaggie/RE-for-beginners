include(`commons.m4').LC2:
	.string	"a=%d; b=%d; c=%d; d=%d; e=%d; f=%d; g=%d; h=%d\n"
f3:
; _EN(`grab more space in stack')_RU(`взять больше места в стеке'):
	sub	sp, sp, #32
; _EN(`save FP and LR in stack frame')_RU(`сохранить FP и LR в стековом фрейме'):
	stp	x29, x30, [sp,16]
; _EN(`set stack frame')_RU(`установить стековый фрейм') (FP=SP):
	add	x29, sp, 16
	adrp	x0, .LC2 ; "a=%d; b=%d; c=%d; d=%d; e=%d; f=%d; g=%d; h=%d\n"
	add	x0, x0, :lo12:.LC2
	mov	w1, 8		; 9th argument
	str	w1, [sp]	; store 9th argument in the stack
	mov	w1, 1
	mov	w2, 2
	mov	w3, 3
	mov	w4, 4
	mov	w5, 5
	mov	w6, 6
	mov	w7, 7
	bl	printf
	sub	sp, x29, #16
; _EN(`restore FP and LR')_RU(`восстановить FP и LR')
	ldp	x29, x30, [sp,16]
	add	sp, sp, 32
	ret
