include(`commons.m4')_eos$ = -4                       ; size = 4
_str$ = 8                        ; size = 4
_strlen PROC
    push    ebp
    mov     ebp, esp
    push    ecx
    mov     eax, DWORD PTR _str$[ebp]  ; _EN(`place pointer to string from')_RU(`взять указатель на символ из') "str"
    mov     DWORD PTR _eos$[ebp], eax  ; _EN(`place it to local variable')_RU(`и переложить его в нашу локальную переменную') "eos"
$LN2@strlen_:
    mov     ecx, DWORD PTR _eos$[ebp]  ; ECX=eos
    
    ; _EN(`take 8-bit byte from address in ECX and place it as 32-bit value to EDX with sign extension')_RU(``взять байт, на который указывает ECX и положить его в EDX расширяя до 32-х бит, учитывая знак'')

    movsx   edx, BYTE PTR [ecx]             
    mov     eax, DWORD PTR _eos$[ebp]  ; EAX=eos
    add     eax, 1                     ; _increment EAX
    mov     DWORD PTR _eos$[ebp], eax  ; _EN(`place EAX back to')_RU(`положить eax назад в') "eos"
    test    edx, edx                   ; EDX _EN(`is zero')_RU(`ноль')?
    je      SHORT $LN1@strlen_         ; _EN(``yes, then finish loop'')_RU(``да, то что лежит в EDX это ноль, выйти из цикла'')
    jmp     SHORT $LN2@strlen_         ; _EN(`continue loop')_RU(`продолжаем цикл')
$LN1@strlen_:
    
    ; _EN(`here we calculate the difference between two pointers')_RU(`здесь мы вычисляем разницу двух указателей')

    mov    eax, DWORD PTR _eos$[ebp]         
    sub    eax, DWORD PTR _str$[ebp]
    sub    eax, 1                      ; _EN(`subtract 1 and return result')_RU(`отнимаем от разницы еще единицу и возвращаем результат')
    mov    esp, ebp
    pop    ebp
    ret    0
_strlen_ ENDP
