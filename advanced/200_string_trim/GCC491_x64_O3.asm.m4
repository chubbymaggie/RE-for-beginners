include(`commons.m4')str_trim:
	push	rbx
	mov	rbx, rdi
; RBX _EN(`will always be')_RU(`всегда будет') "s"
	call	strlen
; _EN(`check for')_RU(`проверить на') str_len==0 _EN(`and exit if it's so')_RU(``и выйти, если это так'')
	test	rax, rax
	je	.L9
	lea	rdx, [rax-1]
; RDX _EN(`will always contain')_RU(`всегда будет содержать значение') str_len-1 _EN(``value, not'')_RU(``, но не'') str_len
; _EN(`so RDX is more like buffer index variable')_RU(`так что RDX будет скорее индексом буфера')
	lea	rsi, [rbx+rdx]      ; RSI=s+str_len-1
	movzx	ecx, BYTE PTR [rsi] ; _EN(`load character')_RU(`загрузить символ')
	test	cl, cl
	je	.L9                 ; _EN(``exit if it's zero'')_RU(``выйти, если это ноль'')
	cmp	cl, 10
	je	.L4
	cmp	cl, 13              ; _EN(``exit if it's not'')_RU(``выйти, если это не'') '\n' _EN(`and not')_RU(`и не') '\r'
	jne	.L9
.L4:
; _EN(`this is weird instruction. we need RSI=s-1 here.')_RU(`это странная инструкция. нам здесь нужно RSI=s-1')
; _EN(``it's possible to get it by'')_RU(``это можно сделать, используя'') MOV RSI, EBX / DEC RSI
; _EN(`but this is two instructions instead of one')_RU(`но это две инструкции между одной')
	sub	rsi, rax
; RSI = s+str_len-1-str_len = s-1
; _EN(`main loop begin')_RU(`начало главного цикла')
.L12:
	test	rdx, rdx
; _EN(`store zero at address')_RU(`записать ноль по адресу') s-1+str_len-1+1 = s-1+str_len = s+str_len-1
	mov	BYTE PTR [rsi+1+rdx], 0  
; _EN(`check for')_RU(`проверка на') str_len-1==0. _EN(`exit if so')_RU(``выход, если да'').
	je	.L9
	sub	rdx, 1                   ; _EN(`equivalent to')_RU(`эквивалент') str_len--
; _EN(`load next character at address')_RU(`загрузить следующий символ по адресу') s+str_len-1
	movzx	ecx, BYTE PTR [rbx+rdx]  
	test	cl, cl                   ; _EN(`is it zero? exit then')_RU(`это ноль? тогда выход')
	je	.L9
	cmp	cl, 10                   ; _EN(`is it')_RU(`это') '\n'?
	je	.L12
	cmp	cl, 13                   ; _EN(`is it')_RU(`это') '\r'?
	je	.L12
.L9:
; _return "s"
	mov	rax, rbx
	pop	rbx
	ret
