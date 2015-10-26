include(`commons.m4')s$ = 8
str_trim PROC

; RCX _EN(`is the first function argument and it always holds pointer to the string')_RU(``это первый аргумент функции, и он всегда будет указывать на строку'')

; _EN(`this is strlen() function inlined right here')_RU(`это функция strlen() встроенная в код прямо здесь'):
; _EN(`set')_RU(`установить') RAX _EN(`to')_RU(`в') 0xFFFFFFFFFFFFFFFF (-1)
	or	rax, -1
$LL14@str_trim:
	inc	rax
	cmp	BYTE PTR [rcx+rax], 0
	jne	SHORT $LL14@str_trim
; _EN(`is string length zero? exit then')_RU(`длина строки 0? тогда на выход')
	test	eax, eax
$LN18@str_trim:
	je	SHORT $LN15@str_trim
; RAX _EN(`holds string length')_RU(`содержит длину строки')
; _EN(``here is probably disassembler (or assembler printing routine) error,'')_RU(``это похоже на ошибку дизассемблера (или ф-ции вывода в ассемблере),'')
; _EN(``LEA RDX... should be here instead of LEA EDX...'')_RU(``здесь должно быть LEA RDX... вместо LEA EDX...'')
	lea	edx, DWORD PTR [rax-1]
; _EN(``idle instruction: EAX will be reset at the next instruction's execution'')_RU(``бессмысленная инструкция: EAX будет сброшен следующей инструкцией'')
	mov	eax, edx 
; _EN(`load character at address')_RU(`загрузить символ по адресу') s[str_len-1]
	movzx	eax, BYTE PTR [rdx+rcx]
; _EN(`save also pointer to the last character to')_RU(`также сохранить указатель на последний символ в') R8
	lea	r8, QWORD PTR [rdx+rcx]
	cmp	al, 13	; is it '\r'?
	je	SHORT $LN2@str_trim
	cmp	al, 10  ; is it '\n'?
	jne	SHORT $LN15@str_trim
$LN2@str_trim:
; _EN(`store 0 to that place')_RU(`записать 0 в этом месте')
	mov	BYTE PTR [r8], 0
	mov	eax, edx
; _EN(``check character for 0, but conditional jump is above...'')_RU(``проверить символ на 0, но условный переход выше...'')
	test	edx, edx
	jmp	SHORT $LN18@str_trim
$LN15@str_trim:
; _return "s"
	mov	rax, rcx
	ret	0
str_trim ENDP
