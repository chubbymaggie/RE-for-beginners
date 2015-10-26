include(`commons.m4')_str$ = 8			; size = 4
_strlen PROC
	mov	edx, DWORD PTR _str$[esp-4] ; EDX -> _EN(`pointer to the string')_RU(`указатель на строку')
	mov	eax, edx                    ; _EN(`move to')_RU(`переложить в') EAX
$LL2@strlen:
	mov	cl, BYTE PTR [eax]          ; CL = *EAX
	inc	eax                         ; EAX++
	test	cl, cl                      ; CL==0?
	jne	SHORT $LL2@strlen           ; _EN(``no, continue loop'')_RU(``нет, продолжаем цикл'')
	sub	eax, edx                    ; _EN(`calculate pointers difference')_RU(`вычисляем разницу указателей')
	dec	eax                         ; _EN(`decrement')_RU(`декремент') EAX
	ret	0
_strlen ENDP
