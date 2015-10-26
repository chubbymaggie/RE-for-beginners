include(`commons.m4'); RCX = _EN(`pointer to the input string')_RU(`указатель на входную строку')
; RAX = _EN(`current string length')_RU(`текущая длина строки')
	or	rax, -1
label:
	inc	rax
	cmp	BYTE PTR [rcx+rax], 0
	jne	SHORT label
; RAX = _EN(`string length')_RU(`длина строки')
