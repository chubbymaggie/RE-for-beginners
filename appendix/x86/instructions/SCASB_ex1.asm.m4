include(`commons.m4')lea     edi, string
mov     ecx, 0FFFFFFFFh ; _EN(``scan $2^{32}-1$ bytes, i.e., almost "infinitely"'')_RU(``сканировать $2^{32}-1$ байт, т.е. почти "бесконечно"'')
xor     eax, eax        ; _EN(`0 is the terminator')_RU(`конец строки это 0')
repne scasb
add     edi, 0FFFFFFFFh ; _EN(`correct it')_RU(`скорректировать')

; _EN(`now EDI points to the last character of the ASCIIZ string.')_RU(`теперь EDI указывает на последний символ в ASCIIZ-строке.')

; _EN(``let's determine string length'')_RU(`узнать длину строки')
; _EN(`current')_RU(`сейчас') ECX = -1-strlen

not     ecx
dec     ecx

; _EN(`now ECX contain string length')_RU(`теперь в ECX хранится длина строки')
