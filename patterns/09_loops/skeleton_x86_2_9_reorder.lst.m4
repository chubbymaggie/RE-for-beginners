include(`commons.m4')    MOV REG, 2 ; _EN(`initialization')_RU(`инициализация')
body:
    ; _EN(`loop body')_RU(`тело цикла')
    ; _EN(`do something here')_RU(`делаем тут что-нибудь')
    ; _EN(``use counter in REG, but do not modify it!'')_RU(``используем переменную счетчика в REG, но не изменяем её!'')
    INC REG ; _increment
    CMP REG, 10
    JL body
