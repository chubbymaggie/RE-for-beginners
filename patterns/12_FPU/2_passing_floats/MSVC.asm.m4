include(`commons.m4')CONST    SEGMENT
__real@40400147ae147ae1 DQ 040400147ae147ae1r    ; 32.01
__real@3ff8a3d70a3d70a4 DQ 03ff8a3d70a3d70a4r    ; 1.54
CONST    ENDS

_main    PROC
    push   ebp
    mov    ebp, esp
    sub    esp, 8  ; _EN(`allocate space for the first variable')_RU(`выделить место для первой переменной')
    fld    QWORD PTR __real@3ff8a3d70a3d70a4
    fstp   QWORD PTR [esp]
    sub    esp, 8  ; _EN(`allocate space for the second variable')_RU(`выделить место для второй переменной')
    fld    QWORD PTR __real@40400147ae147ae1
    fstp   QWORD PTR [esp]
    call   _pow
    add    esp, 8  ; _EN(``"return back" place of one variable.'')_RU(``"вернуть" место от одной переменной.'')

; _EN(`in local stack here 8 bytes still reserved for us.')_RU(`в локальном стеке сейчас все еще зарезервировано 8 байт для нас.')
; _EN(`result now in ST(0)')_RU(`результат сейчас в ST(0)')

    fstp   QWORD PTR [esp] ; _EN(`move result from ST(0) to local stack for printf()')_RU(`перегрузить результат из ST(0) в локальный стек для printf()')
    push   OFFSET $SG2651
    call   _printf
    add    esp, 12
    xor    eax, eax
    pop    ebp
    ret    0
_main    ENDP
