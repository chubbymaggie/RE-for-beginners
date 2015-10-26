include(`commons.m4'); R0 = _EN(`month')_RU(`месяц')
        MOVS     r1,#0xa
; R1 = 10
        MULS     r0,r1,r0
; R0 = R1*R0 = 10*_EN(`month')_RU(`месяц')
        LDR      r1,|L0.68|
; R1 = _EN(`pointer to the table')_RU(`указатель на таблицу')
        ADDS     r0,r0,r1
; R0 = R0+R1 = 10*_EN(`month')_RU(`месяц') + _EN(`pointer to the table')_RU(`указатель на таблицу')
        BX       lr
