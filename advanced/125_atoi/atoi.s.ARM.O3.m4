include(`commons.m4')my_atoi PROC
; R1 _EN(`will contain pointer to character')_RU(`будет содержать указатель на символ')
        MOV      r1,r0
; R0 _EN(`will contain "rt" variable')_RU(`будет содержать переменную "rt"')
        MOV      r0,#0
        B        |L0.28|
|L0.12|
        ADD      r0,r0,r0,LSL #2
; R0=R0+R0<<2=rt*5
        ADD      r0,r2,r0,LSL #1
; R0=_EN(`input character')_RU(`входной символ') + rt*5<<1 = _EN(`input character')_RU(`входной символ') + rt*10
; _EN(`correct whole thing by subtracting')_RU(``скорректировать, вычитая'') '0' _EN(`from')_RU(`из') rt:
        SUB      r0,r0,#0x30
; _EN(`shift pointer to the next character')_RU(`сдвинуть указатель на следующий символ'):
        ADD      r1,r1,#1
|L0.28|
; _EN(`load input character to')_RU(`загрузить входной символ в') R2
        LDRB     r2,[r1,#0]
; _EN(``is it null byte? if no, jump to loop body.'')_RU(``это нулевой байт? если нет, перейти на начало цикла.'')
        CMP      r2,#0
        BNE      |L0.12|
; _EN(`exit if null byte')_RU(``выйти, если это нулевой байт'').
; _EN(``"rt" variable is still in R0 register, ready to be used in caller function'')_RU(``переменная "rt" всё еще в регистре R0, готовая для использования в вызывающей ф-ции'')
        BX       lr
        ENDP
