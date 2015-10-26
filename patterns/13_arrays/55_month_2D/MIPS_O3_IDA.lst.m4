include(`commons.m4')                .globl get_month2
get_month2:
; $a0=_EN(`month')_RU(`месяц')
                sll     $v0, $a0, 3
; $v0 = $a0<<3 = _EN(`month')_RU(`месяц')*8
                sll     $a0, 1
; $a0 = $a0<<1 = _EN(`month')_RU(`месяц')*2
                addu    $a0, $v0
; $a0 = _EN(`month')_RU(`месяц')*2+_EN(`month')_RU(`месяц')*8 = _EN(`month')_RU(`месяц')*10
; _EN(`load address of the table')_RU(`загрузить адрес таблицы'):
                la      $v0, month2
; _EN(`sum up table address and index we calculated and return')_RU(`сложить адрес таблицы и вычисленный индекс и вернуть управление'):
                jr      $ra
                addu    $v0, $a0

month2:         .ascii "January"<0>      
                .byte 0, 0
aFebruary:      .ascii "February"<0>
                .byte    0
aMarch:         .ascii "March"<0>
                .byte 0, 0, 0, 0
aApril:         .ascii "April"<0>
                .byte 0, 0, 0, 0
aMay:           .ascii "May"<0>
                .byte 0, 0, 0, 0, 0, 0
aJune:          .ascii "June"<0>
                .byte 0, 0, 0, 0, 0
aJuly:          .ascii "July"<0>
                .byte 0, 0, 0, 0, 0
aAugust:        .ascii "August"<0>
                .byte 0, 0, 0
aSeptember:     .ascii "September"<0>
aOctober:       .ascii "October"<0>
                .byte 0, 0
aNovember:      .ascii "November"<0>
                .byte    0
aDecember:      .ascii "December"<0>
                .byte 0, 0, 0, 0, 0, 0, 0, 0, 0
