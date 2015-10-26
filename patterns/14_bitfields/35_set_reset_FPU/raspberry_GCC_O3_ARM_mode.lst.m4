include(`commons.m4')my_abs
; _EN(`copy from S0 to R2')_RU(`скопировать из S0 в R2'):
                FMRS    R2, S0
; _EN(`clear bit')_RU(`очистить бит'):
                BIC     R3, R2, #0x80000000
; _EN(`copy from R3 to S0')_RU(`скопировать из R3 в S0'):
                FMSR    S0, R3
                BX      LR

set_sign
; _EN(`copy from S0 to R2')_RU(`скопировать из S0 в R2'):
                FMRS    R2, S0
; _EN(`do OR')_RU(`применить ИЛИ'):
                ORR     R3, R2, #0x80000000
; _EN(`copy from R3 to S0')_RU(`скопировать из R3 в S0'):
                FMSR    S0, R3
                BX      LR

negate
; _EN(`copy from S0 to R2')_RU(`скопировать из S0 в R2'):
                FMRS    R2, S0
; _EN(`do ADD')_RU(`применить операцию сложения'):
                ADD     R3, R2, #0x80000000
; _EN(`copy from R3 to S0')_RU(`скопировать из R3 в S0'):
                FMSR    S0, R3
                BX      LR
