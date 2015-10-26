include(`commons.m4')                MOV             R1, R0
                MOV             R0, #0
                MOV             R2, #1
                MOV             R3, R0
loc_2E54
                TST             R1, R2,LSL R3 ; _EN(`set flags according to')_RU(`установить флаги в соответствии с') R1 & (R2<<R3)
                ADD             R3, R3, #1    ; R3++
                ADDNE           R0, R0, `#'1    ; _EN(``if ZF flag is cleared by TST, then'')_RU(``если флаг ZF сброшен TST, то'') R0++
                CMP             R3, #32
                BNE             loc_2E54
                BX              LR
