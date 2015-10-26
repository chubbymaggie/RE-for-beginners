include(`commons.m4')_a$ = 8             ; size = 4
_f    PROC
    push   ebp
    mov    ebp, esp
    mov    eax, DWORD PTR _a$[ebp]
    cdq            ; _EN(`sign extend EAX to EDX:EAX')_RU(`знаковое расширение EAX до EDX:EAX')
    mov    ecx, 9
    idiv   ecx
    pop    ebp
    ret    0
_f  ENDP
