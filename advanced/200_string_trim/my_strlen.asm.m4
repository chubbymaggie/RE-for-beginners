include(`commons.m4'); RCX = _EN(`pointer to the input string')_RU(`указатель на входную строку')
; RAX = _EN(`current string length')_RU(`текущая длина строки')
        xor     rax, rax
label:
        cmp     byte ptr [rcx+rax], 0
        jz      exit
        inc     rax
        jmp     label
exit:
; RAX = _EN(`string length')_RU(`длина строки')
