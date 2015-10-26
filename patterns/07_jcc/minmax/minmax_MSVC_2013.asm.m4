include(`commons.m4')_a$ = 8		
_b$ = 12	
_my_min	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _a$[ebp]
; _EN(`compare A and B')_RU(`сравнить A и B'):
	cmp	eax, DWORD PTR _b$[ebp]
; _EN(``jump, if A is greater or equal to B'')_RU(``переход, если A больше или равно B''):
	jge	SHORT $LN2@my_min
; _EN(`reload A to EAX if otherwise and jump to exit')_RU(`перезагрузить A в EAX в противном случае и перейти на выход')
	mov	eax, DWORD PTR _a$[ebp]
	jmp	SHORT $LN3@my_min
	jmp	SHORT $LN3@my_min ; _EN(`this is redundant')_RU(`это избыточная') JMP
$LN2@my_min:
; _return B
	mov	eax, DWORD PTR _b$[ebp]
$LN3@my_min:
	pop	ebp
	ret	0
_my_min	ENDP

_a$ = 8		
_b$ = 12	
_my_max	PROC
	push	ebp
	mov	ebp, esp
	mov	eax, DWORD PTR _a$[ebp]
; _EN(`compare A and B')_RU(`сравнить A и B'):
	cmp	eax, DWORD PTR _b$[ebp]
; _EN(``jump if A is less or equal to B'')_RU(``переход, если A меньше или равно B''):
	jle	SHORT $LN2@my_max
; _EN(`reload A to EAX if otherwise and jump to exit')_RU(`перезагрузить A в EAX в противном случае и перейти на выход')
	mov	eax, DWORD PTR _a$[ebp]
	jmp	SHORT $LN3@my_max
	jmp	SHORT $LN3@my_max ; _EN(`this is redundant')_RU(`это избыточная') JMP
$LN2@my_max:
; _return B
	mov	eax, DWORD PTR _b$[ebp]
$LN3@my_max:
	pop	ebp
	ret	0
_my_max	ENDP
