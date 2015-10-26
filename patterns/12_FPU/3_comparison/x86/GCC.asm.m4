include(`commons.m4')d_max proc near

b               = qword ptr -10h
a               = qword ptr -8
a_first_half    = dword ptr  8
a_second_half   = dword ptr  0Ch
b_first_half    = dword ptr  10h
b_second_half   = dword ptr  14h

    push    ebp
    mov     ebp, esp
    sub     esp, 10h

; _EN(`put a and b to local stack')_RU(`переложим a и b в локальный стек'):

    mov     eax, [ebp+a_first_half]
    mov     dword ptr [ebp+a], eax
    mov     eax, [ebp+a_second_half]
    mov     dword ptr [ebp+a+4], eax
    mov     eax, [ebp+b_first_half]
    mov     dword ptr [ebp+b], eax
    mov     eax, [ebp+b_second_half]
    mov     dword ptr [ebp+b+4], eax

; _EN(`load a and b to FPU stack')_RU(`загружаем a и b в стек FPU'):

    fld     [ebp+a]
    fld     [ebp+b]

; _EN(`current stack state')_RU(`текущее состояние стека'): ST(0) - b; ST(1) - a

    fxch    st(1) ; _EN(`this instruction swapping ST(1) and ST(0)')_RU(`эта инструкция меняет ST(1) и ST(0) местами')

; _EN(`current stack state')_RU(`текущее состояние стека'): ST(0) - a; ST(1) - b

    fucompp    ; _EN(``compare a and b and pop two values from stack, i.e., a and b'')_RU(``сравнить a и b и выдернуть из стека два значения, т.е. a и b'')
    fnstsw  ax ; _EN(`store FPU status to AX')_RU(`записать статус FPU в AX')
    sahf       ; _EN(``load SF, ZF, AF, PF, and CF flags state from AH'')_RU(``загрузить состояние флагов SF, ZF, AF, PF, и CF из AH'')
    setnbe  al ; _EN(``store 1 to AL, if CF=0 and ZF=0'')_RU(``записать 1 в AL, если CF=0 и ZF=0'')
    test    al, al            ; AL==0 ?
    jz      short loc_8048453 ; _EN(`yes')_RU(`да')
    fld     [ebp+a]
    jmp     short locret_8048456

loc_8048453:
    fld     [ebp+b]

locret_8048456:
    leave
    retn
d_max endp
