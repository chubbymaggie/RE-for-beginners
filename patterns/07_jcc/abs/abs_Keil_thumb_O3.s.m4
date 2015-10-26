include(`commons.m4')my_abs PROC
        CMP      r0,`#'0
; _RU(`входное значение равно нулю или больше нуля')_EN(`is input value equal to zero or greater than zero')?
; _RU(``в таком случае, пропустить инструкцию RSBS'')_EN(`skip RSBS instruction then')
        BGE      |L0.6|
; _RU(`отнять входное значение от 0')_EN(`subtract input value from') 0:
        RSBS     r0,r0,`#'0
|L0.6|
        BX       lr
        ENDP
