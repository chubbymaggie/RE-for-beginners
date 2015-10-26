include(`commons.m4')f PROC
; _EN(`compare input value with')_RU(`сравнить входное значение с') 10
        CMP      r0,#0xa
; _EN(`jump to')_RU(`переход на') |L0.8| _if EQual _RU(`(равно)')
        BEQ      |L0.8|
        ADR      r0,|L0.12| ; "it is not ten"
        BX       lr
|L0.8|
        ADR      r0,|L0.28| ; "it is ten"
        BX       lr
        ENDP

|L0.12|
        DCB      "it is not ten",0
|L0.28|
        DCB      "it is ten",0
