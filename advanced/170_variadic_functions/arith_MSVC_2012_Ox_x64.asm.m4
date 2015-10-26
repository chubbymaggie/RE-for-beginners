include(`commons.m4')$SG3013	DB	'%d', 0aH, 00H

v$ = 8
arith_mean PROC
	mov	DWORD PTR [rsp+8], ecx   ; _arg1
	mov	QWORD PTR [rsp+16], rdx  ; _arg2
	mov	QWORD PTR [rsp+24], r8   ; _arg3
	mov	eax, ecx                 ; sum = _arg1
	lea	rcx, QWORD PTR v$[rsp+8] ; _RU(`указатель на второй аргумент')_EN(`pointer to the 2nd argument')
	mov	QWORD PTR [rsp+32], r9   ; _arg4
	mov	edx, DWORD PTR [rcx]     ; _RU(`загрузить второй аргумент')_EN(`load 2nd argument')
	mov	r8d, 1                   ; count=1
	cmp	edx, -1                  ; _RU(`второй аргумент равен')_EN(`2nd argument is') -1?
	je	SHORT $LN8@arith_mean    ; _RU(``если так, то выход'')_EN(`exit if so')
$LL3@arith_mean:
	add	eax, edx	         ; sum = sum + _RU(`загруженный аргумент')_EN(`loaded argument')
	mov	edx, DWORD PTR [rcx+8]   ; _RU(`загрузить следующий аргумент')_EN(`load next argument')
	lea	rcx, QWORD PTR [rcx+8]   ; _RU(``сдвинуть указатель, чтобы он указывал на аргумент за следующим'')_EN(`shift pointer to point to the argument after next')
	inc	r8d                      ; count++
	cmp	edx, -1                  ; _RU(`загруженный аргумент равен')_EN(`is loaded argument') -1?
	jne	SHORT $LL3@arith_mean    ; _RU(``перейти на начал цикла, если нет'')_EN(``go to loop begin if it's not'')
$LN8@arith_mean:
; _RU(`вычислить результат деления')_EN(`calculate quotient')
	cdq
	idiv	r8d
	ret	0
arith_mean ENDP

main	PROC
	sub	rsp, 56
	mov	edx, 2
	mov	DWORD PTR [rsp+40], -1
	mov	DWORD PTR [rsp+32], 15
	lea	r9d, QWORD PTR [rdx+8]
	lea	r8d, QWORD PTR [rdx+5]
	lea	ecx, QWORD PTR [rdx-1]
	call	arith_mean
	lea	rcx, OFFSET FLAT:$SG3013
	mov	edx, eax
	call	printf
	xor	eax, eax
	add	rsp, 56
	ret	0
main	ENDP
