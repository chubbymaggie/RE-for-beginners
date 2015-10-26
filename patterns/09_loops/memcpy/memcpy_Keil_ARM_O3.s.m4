include(`commons.m4')my_memcpy PROC
; R0 = _EN(`destination address')_RU(`целевой адрес')
; R1 = _EN(`source address')_RU(`исходный адрес')
; R2 = _EN(`size of block')_RU(`размер блока')

; _EN(`initialize counter (i) at 0')_RU(`инициализировать счетчик (i) в 0')
        MOV      r3,#0
|L0.4|
; _EN(`all bytes copied?')_RU(`все байты скопированы?')
        CMP      r3,r2
; _EN(``the following block is executed only if "less than" condition,'')_RU(``следующий блок исполнится только в случае условия "меньше чем",'')
; _EN(``i.e., if'')_RU(``т.е. если'') R2<R3 _or i<size.
; _EN(`load byte at')_RU(`загружаем байт по адресу') R1+i:
        LDRBCC   r12,[r1,r3]
; _EN(`store byte at')_RU(`записываем байт по адресу') R1+i:
        STRBCC   r12,[r0,r3]
; i++
        ADDCC    r3,r3,#1
; _EN(`the last instruction of the "conditional block".')_RU(`последняя инструкция "условного блока".')
; _EN(`jump to loop begin if')_RU(``перейти на начало цикла, если'') i<size
; _EN(`do nothing otherwise')_RU(``в противном случае, ничего не делать'') (_EN(``i.e., if'')_RU(``т.е. если'') i>=size)
        BCC      |L0.4|
; _return
        BX       lr
        ENDP
