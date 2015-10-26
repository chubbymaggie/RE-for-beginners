include(`commons.m4')$SG792	DB	'it is ten', 00H
$SG793	DB	'it is not ten', 00H

_a$ = 8 ; size = 4
_f	PROC
; _EN(`compare input value with')_RU(`сравнить входное значение с') 10
	cmp	DWORD PTR _a$[esp-4], 10
	mov	eax, OFFSET $SG792 ; 'it is ten'
; _EN(`jump to')_RU(`переход на') $LN4@f _EN(`if equal')_RU(`если равно')
	je	SHORT $LN4@f
	mov	eax, OFFSET $SG793 ; 'it is not ten'
$LN4@f:
	ret	0
_f	ENDP
