include(`commons.m4')_fmt$ = 8
_die	PROC
	; _RU(`загрузить первый аргумент (строка формата)')_EN(`load 1st argument (format-string)')
	mov	ecx, DWORD PTR _fmt$[esp-4]
	; _RU(`установить указатель на второй аргумент')_EN(`get pointer to the 2nd argument')
	lea	eax, DWORD PTR _fmt$[esp]
	push	eax 		; _RU(`передать указатель')_EN(`pass pointer')
	push	ecx
	call	_vprintf
	add	esp, 8
	push	0
	call	_exit
$LN3@die:
	int	3
_die	ENDP
