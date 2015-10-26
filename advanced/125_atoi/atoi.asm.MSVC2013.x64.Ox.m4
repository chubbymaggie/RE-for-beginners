include(`commons.m4')s$ = 8
my_atoi	PROC
; _EN(`load first character')_RU(`загрузить первый символ')
	movzx	r8d, BYTE PTR [rcx]
; _EN(`EAX is allocated for "rt" variable')_RU(`EAX выделен для переменной "rt"')
; _EN(`it's 0 at start')_RU(`в начале там 0')
	xor	eax, eax
; _EN(``first character is zero-byte, i.e., string terminator?'')_RU(``первый символ - это нулевой байт, т.е. конец строки?'')
; _EN(`exit then')_RU(`тогда выходим').
	test	r8b, r8b
	je	SHORT $LN9@my_atoi
$LL2@my_atoi:
	lea	edx, DWORD PTR [rax+rax*4]
; EDX=RAX+RAX*4=rt+rt*4=rt*5
	movsx	eax, r8b
; EAX=_EN(`input character')_RU(`входной символ')
; _EN(`load next character to')_RU(`загрузить следующий символ в') R8D
	movzx	r8d, BYTE PTR [rcx+1]
; _EN(`shift pointer in RCX to the next character')_RU(`передвинуть указатель в RCX на следующий символ'):
	lea	rcx, QWORD PTR [rcx+1]
	lea	eax, DWORD PTR [rax+rdx*2]
; EAX=RAX+RDX*2=_EN(`input character')_RU(`входной символ') + rt*5*2=_EN(`input character')_RU(`входной символ') + rt*10
; _EN(`correct digit by subtracting')_RU(`скорректировать цифру вычитая') 48 (0x30 _or '0')
	add	eax, -48				; ffffffffffffffd0H
; _EN(`was last character zero')_RU(`последний символ был нулем')?
	test	r8b, r8b
; _EN(``jump to loop begin, if not'')_RU(``перейти на начало цикла, если нет'')
	jne	SHORT $LL2@my_atoi
$LN9@my_atoi:
	ret	0
my_atoi	ENDP
