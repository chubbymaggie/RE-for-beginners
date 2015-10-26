include(`commons.m4')    MOV R4, 2 ; _EN(`initialization')_RU(`инициализация')
    B check
body:
    ; _EN(`loop body')_RU(`тело цикла')
    ; _EN(`do something here')_RU(`делаем тут что-нибудь')
    ; _EN(``use counter in R4, but do not modify it!'')_RU(``используем переменную счетчика в R4, но не изменяем её!'')
    ADD R4,R4, `#'1 ; _increment
check:
    CMP R4, #10
    BLT body
