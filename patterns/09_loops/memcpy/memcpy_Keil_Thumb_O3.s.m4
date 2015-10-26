include(`commons.m4')my_memcpy PROC
; R0 = _EN(`destination address')_RU(`целевой адрес')
; R1 = _EN(`source address')_RU(`исходный адрес')
; R2 = _EN(`size of block')_RU(`размер блока')

        PUSH     {r4,lr}
; _EN(`initialize counter (i) at 0')_RU(`инициализировать счетчик (i) в 0')
        MOVS     r3,#0
; _EN(``condition checked at the end of function, so jump there:'')_RU(``условие проверяется в конце ф-ции, так что переходим туда:'')
        B        |L0.12|
|L0.6|
; _EN(`load byte at')_RU(`загружаем байт по адресу') R1+i:
        LDRB     r4,[r1,r3]
; _EN(`store byte at')_RU(`записываем байт по адресу') R1+i:
        STRB     r4,[r0,r3]
; i++
        ADDS     r3,r3,#1
|L0.12|
; i<size?
        CMP      r3,r2
; _EN(`jump to the loop begin if it's so:')_RU(``перейти на начало цикла, если это так'')
        BCC      |L0.6|
        POP      {r4,pc}
        ENDP
