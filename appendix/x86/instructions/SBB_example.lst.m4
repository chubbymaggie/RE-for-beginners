include(`commons.m4'); _EN(``work with 64-bit values: subtract val2 from val1.'')_RU(``работа с 64-битными значениями: вычесть val2 из val1'')
; _EN(``.lo mean lowest 32 bits, .hi means highest.'')_RU(``.lo означает младшие 32 бита, .hi - старшие'')
SUB val1.lo, val2.lo
SBB val1.hi, val2.hi ; _EN(`use CF set or cleared at the previous instruction')_RU(`использовать CF выставленный или очищенный в предыдущей инструкции')
