include(`commons.m4')    MOV EBX, 2 ; _EN(`initialization')_RU(`инициализация')
    JMP check
body:
    ; _EN(`loop body')_RU(`тело цикла')
    ; _EN(`do something here')_RU(`делаем тут что-нибудь')
    ; _EN(``use counter in EBX, but do not modify it!'')_RU(``используем переменную счетчика в EBX, но не изменяем её!'')
    INC EBX ; _increment
check:
    CMP EBX, 9
    JLE body
