include(`commons.m4')fmt$ = 48
die	PROC
	; _RU(`сохранить первые 4 аргумента в')_EN(`save first 4 arguments in') Shadow Space
	mov	QWORD PTR [rsp+8], rcx
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+32], r9
	sub	rsp, 40
	lea	rdx, QWORD PTR fmt$[rsp+8] ; _RU(`передать указатель на первый аргумент')_EN(`pass pointer to the 1st argument')
	; RCX _RU(`здесь всё еще указывает на первый аргумент (строку формата) ф-ции')_EN(`here is still points to the 1st argument (format-string) of') die()
	; _RU(`так что')_EN(`so') vprintf() _RU(`возьмет его прямо из')_EN(`will take it right from') RCX
	call	vprintf
	xor	ecx, ecx
	call	exit
	int	3
die	ENDP
