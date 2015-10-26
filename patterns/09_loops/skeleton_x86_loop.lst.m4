include(`commons.m4')    ; _EN(`count from 10 to 1')_RU(`считать от 10 до 1')
    MOV ECX, 10
body:
    ; _EN(`loop body')_RU(`тело цикла')
    ; _EN(`do something here')_RU(`делаем тут что-нибудь')
    ; _EN(``use counter in ECX, but do not modify it!'')_RU(``используем переменную счетчика в ECX, но не изменяем её!'')
    LOOP body
