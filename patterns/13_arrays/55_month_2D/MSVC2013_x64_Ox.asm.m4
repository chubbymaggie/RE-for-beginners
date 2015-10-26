include(`commons.m4')month2	DB	04aH
	DB	061H
	DB	06eH
	DB	075H
	DB	061H
	DB	072H
	DB	079H
	DB	00H
	DB	00H
	DB	00H
...

get_month2 PROC
; _EN(`sign-extend input argument and promote to 64-bit value')_RU(``расширить входное значение до 64-битного, учитывая знак'')
	movsxd	rax, ecx 
	lea	rcx, QWORD PTR [rax+rax*4]
; RCX=_EN(`month')_RU(`месяц')+_EN(`month')_RU(`месяц')*4=_EN(`month')_RU(`месяц')*5
	lea	rax, OFFSET FLAT:month2
; RAX=_EN(`pointer to table')_RU(`указатель на таблицу')
	lea	rax, QWORD PTR [rax+rcx*2]
; RAX=_EN(`pointer to table')_RU(`указатель на таблицу') + RCX*2=_EN(`pointer to table')_RU(`указатель на таблицу') + _EN(`month')_RU(`месяц')*5*2=_EN(`pointer to table')_RU(`указатель на таблицу') + _EN(`month')_RU(`месяц')*10
	ret	0
get_month2 ENDP
