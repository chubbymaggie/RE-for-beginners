include(`commons.m4')my_abs PROC
        CMP      r0,`#'0
; _RU(`исполнить инструкцию')_EN(`execute') "Reverse Subtract" _RU(``только в случае, если входное значение меньше 0'')_EN(`instruction only if input value is less than 0'):
        RSBLT    r0,r0,`#'0
        BX       lr
        ENDP
