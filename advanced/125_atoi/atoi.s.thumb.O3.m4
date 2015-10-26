include(`commons.m4')my_atoi PROC
; R1 _EN(`will be pointer to the input character')_RU(`будет указателем на входной символ')
        MOVS     r1,r0
; R0 _EN(`is allocated to "rt" variable')_RU(`выделен для переменной "rt"')
        MOVS     r0,#0
        B        |L0.16|
|L0.6|
        MOVS     r3,#0xa
; R3=10
        MULS     r0,r3,r0
; R0=R3*R0=rt*10
; _EN(`shift pointer to the next character')_RU(`передвинуть указатель на следующий символ'):
        ADDS     r1,r1,#1
; _EN(`correct whole thing by subtracting '0' character from it')_RU(``скорректировать, вычитая символ нуля''):
        SUBS     r0,r0,#0x30
        ADDS     r0,r2,r0
; rt=R2+R0=_EN(`input character')_RU(`входной символ') + (rt*10 - '0')
|L0.16|
; _EN(`load input character to')_RU(`загрузить входной символ в') R2
        LDRB     r2,[r1,#0]
; _EN(`is it zero')_RU(`это ноль')?
        CMP      r2,#0
; _EN(`jump to loop body if it is not')_RU(``перейти на тело цикла, если нет'')
        BNE      |L0.6|
; _EN(``rt variable in R0 now, ready to be used in caller function'')_RU(``переменная rt сейчас в R0, готовая для использования в вызывающей ф-ции'')
        BX       lr
        ENDP
