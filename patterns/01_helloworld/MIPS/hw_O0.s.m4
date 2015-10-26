include(`commons.m4')$LC0:
	.ascii	"Hello, world!\012\000"
main:
; _EN(`function prologue.')_RU(`пролог функции')
; _EN(`save the RA ($\$$31) and FP in the stack')_RU(`сохранить RA ($\$$31) и FP в стеке'):
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
; _EN(`set the FP (stack frame pointer)')_RU(`установить FP (указатель стекового фрейма)'):
	move	$fp,$sp
; _EN(`set the')_RU(`установить') GP:
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
; _EN(`load the address of the text string')_RU(`загрузить адрес текстовой строки'):
	lui	$2,%hi($LC0)
	addiu	$4,$2,%lo($LC0)
; _EN(`load the address of puts() using the GP')_RU(`загрузить адрес функции puts() используя GP'):
	lw	$2,%call16(puts)($28)
	nop
; _EN(`call')_RU(`вызвать') puts():
	move	$25,$2
	jalr	$25
	nop  ; branch delay slot

; _EN(`restore the GP from the local stack')_RU(`восстановить GP из локального стека'):
	lw	$28,16($fp)
; _EN(`set register')_RU(`установить регистр') $2 ($V0) _EN(`to zero')_RU(`в ноль'):
	move	$2,$0
; _EN(`function epilogue')_RU(`эпилог функции').
; _EN(`restore the')_RU(`восстановить') SP:
	move	$sp,$fp
; _EN(`restore the')_RU(`восстановить') RA:
	lw	$31,28($sp)
; _EN(`restore the')_RU(`восстановить') FP:
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
; _EN(`jump to the')_RU(`переход на') RA:
	j	$31
	nop  ; branch delay slot
