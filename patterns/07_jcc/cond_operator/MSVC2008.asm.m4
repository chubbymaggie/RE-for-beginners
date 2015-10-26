include(`commons.m4')$SG746	DB	'it is ten', 00H
$SG747	DB	'it is not ten', 00H

tv65 = -4 ; _EN(`this will be used as a temporary variable')_RU(`будет использовано как временная переменная')
_a$ = 8	
_f	PROC
	push	ebp
	mov	ebp, esp
	push	ecx
; _EN(`compare input value with')_RU(`сравнить входное значение с') 10
	cmp	DWORD PTR _a$[ebp], 10
; _EN(`jump to')_RU(`переход на') $LN3@f _EN(`if not equal')_RU(`если не равно')
	jne	SHORT $LN3@f
; _EN(`store pointer to the string into temporary variable')_RU(`сохранить указатель на строку во временной переменной'):
	mov	DWORD PTR tv65[ebp], OFFSET $SG746 ; 'it is ten'
; _EN(`jump to exit')_RU(`перейти на выход')
	jmp	SHORT $LN4@f
$LN3@f:
; _EN(`store pointer to the string into temporary variable')_RU(`сохранить указатель на строку во временной переменной'):
	mov	DWORD PTR tv65[ebp], OFFSET $SG747 ; 'it is not ten'
$LN4@f:
; _EN(`this is exit. copy pointer to the string from temporary variable to EAX.')_RU(`это выход. скопировать указатель на строку из временной переменной в EAX.')
	mov	eax, DWORD PTR tv65[ebp]
	mov	esp, ebp
	pop	ebp
	ret	0
_f	ENDP
