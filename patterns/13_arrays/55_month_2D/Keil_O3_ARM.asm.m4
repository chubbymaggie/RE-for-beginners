include(`commons.m4'); R0 = _EN(`month')_RU(`месяц')
        LDR      r1,|L0.104|
; R1 = _EN(`pointer to the table')_RU(`указатель на таблицу')
        ADD      r0,r0,r0,LSL #2
; R0 = R0+R0<<2 = R0+R0*4 = _EN(`month')_RU(`месяц')*5
        ADD      r0,r1,r0,LSL #1
; R0 = R1+R0<<2 = _EN(`pointer to the table')_RU(`указатель на таблицу') + _EN(`month')_RU(`месяц')*5*2 = _EN(`pointer to the table')_RU(`указатель на таблицу') + _EN(`month')_RU(`месяц')*10
        BX       lr
