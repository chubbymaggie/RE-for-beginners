include(`commons.m4')_v$ = 8
_arith_mean PROC NEAR
	mov	eax, DWORD PTR _v$[esp-4] ; _RU(`загрузить первый аргумент в')_EN(`load 1st argument into') sum
	push	esi
	mov	esi, 1		          ; count=1
	lea	edx, DWORD PTR _v$[esp]   ; _RU(`адрес первого аргумента')_EN(`address of the 1st argument')
$L838:
	mov	ecx, DWORD PTR [edx+4]    ; _RU(`загрузить следующий аргумент')_EN(`load next argument')
	add	edx, 4                    ; _RU(`сдвинуть указатель на следующий аргумент')_EN(`shift pointer to the next argument')
	cmp	ecx, -1                   ; _RU(`это')_EN(`is it') -1?
	je	SHORT $L856               ; _RU(``выйти, если это так'')_EN(`exit if so')
	add	eax, ecx                  ; sum = sum + _RU(`загруженный аргумент')_EN(`loaded argument')
	inc	esi                       ; count++
	jmp	SHORT $L838
$L856:
; _RU(`вычислить результат деления')_EN(`calculate quotient')

	cdq
	idiv	esi
	pop	esi
	ret	0
_arith_mean ENDP

$SG851	DB	'%d', 0aH, 00H

_main	PROC NEAR
	push	-1
	push	15
	push	10
	push	7
	push	2
	push	1
	call	_arith_mean
	push	eax
	push	OFFSET FLAT:$SG851 ; '%d'
	call	_printf
	add	esp, 32
	ret	0
_main	ENDP
