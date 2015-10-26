include(`commons.m4')f PROC
; _EN(`compare input value with')_RU(`сравнить входное значение с') 10
        CMP      r0,#0xa
; _EN(``if comparison result is EQual, copy pointer to the "it is ten" string into R0'')_RU(``если результат сравнения EQual (равно), скопировать указатель на строку "it is ten" в R0'')
        ADREQ    r0,|L0.16| ; "it is ten"
; _EN(``if comparison result is Not Equal, copy pointer to the "it is not ten" string into R0'')_RU(``если результат сравнения Not Equal (не равно), скопировать указатель на строку "it is not ten" в R0'')
        ADRNE    r0,|L0.28| ; "it is not ten"
        BX       lr
        ENDP

|L0.16|
        DCB      "it is ten",0
|L0.28|
        DCB      "it is not ten",0
