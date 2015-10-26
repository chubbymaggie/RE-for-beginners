include(`commons.m4')month$ = 8
get_month2 PROC
	mov	DWORD PTR [rsp+8], ecx
	movsxd	rax, DWORD PTR month$[rsp]
; RAX = _EN(`sign-extended input value into 64-bit one')_RU(``расширенное до 64-битного входное значение, учитывая знак'')
	imul	rax, rax, 10
; RAX = RAX*10
	lea	rcx, OFFSET FLAT:month2
; RCX = _EN(`pointer to the table')_RU(`указатель на таблицу')
	add	rcx, rax
; RCX = RCX+RAX = _EN(`pointer to the table')_RU(`указатель на таблицу')+month*10
	mov	rax, rcx
; RAX = _EN(`pointer to the table')_RU(`указатель на таблицу')+_EN(`month')_RU(`месяц')*10
	mov	ecx, 1
; RCX = 1
	imul	rcx, rcx, 0
; RCX = 1*0 = 0
	add	rax, rcx
; RAX = _EN(`pointer to the table')_RU(`указатель на таблицу')+_EN(`month')_RU(`месяц')*10 + 0 = _EN(`pointer to the table')_RU(`указатель на таблицу')+_EN(`month')_RU(`месяц')*10
	ret	0
get_month2 ENDP

