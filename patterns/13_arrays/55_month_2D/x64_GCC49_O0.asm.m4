include(`commons.m4')get_month2:
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR [rbp-4], edi
	mov	eax, DWORD PTR [rbp-4]
	movsx	rdx, eax
; RDX = _EN(``sign-extended input value'')_RU(``входное значение, расширенное учитывая знак'')
	mov	rax, rdx
; RAX = _EN(`month')_RU(`месяц')
	sal	rax, 2
; RAX = _EN(`month')_RU(`месяц')<<2 = _EN(`month')_RU(`месяц')*4
	add	rax, rdx
; RAX = RAX+RDX = _EN(`month')_RU(`месяц')*4+_EN(`month')_RU(`месяц') = _EN(`month')_RU(`месяц')*5
	add	rax, rax
; RAX = RAX*2 = _EN(`month')_RU(`месяц')*5*2 = _EN(`month')_RU(`месяц')*10
	add	rax, OFFSET FLAT:month2
; RAX = _EN(`month')_RU(`месяц')*10 + _EN(`pointer to the table')_RU(`указатель на таблицу')
	pop	rbp
	ret
