include(`commons.m4'); _EN(``work with 64-bit values: add val1 to val2.'')_RU(``работа с 64-битными значениями: прибавить val1 к val2.'')
; _EN(``.lo mean lowest 32 bits, .hi means highest.'')_RU(``.lo означает младшие 32 бита, .hi - старшие'')
ADD val1.lo, val2.lo
ADC val1.hi, val2.hi ; _EN(`use CF set or cleared at the previous instruction')_RU(`использовать CF выставленный или очищенный в предыдущей инструкции')
