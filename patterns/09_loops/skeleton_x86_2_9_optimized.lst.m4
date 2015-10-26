include(`commons.m4')    mov [counter], 2 ; _EN(`initialization')_RU(`инициализация')
    jmp check
body:
    ; _EN(`loop body')_RU(`тело цикла')
    ; _EN(`do something here')_RU(`делаем тут что-нибудь')
    ; _EN(`use counter variable in local stack')_RU(`используем переменную счетчика в локальном стеке')
    add [counter], 1 ; _increment
check:
    cmp [counter], 9
    jle body
