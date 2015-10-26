include(`commons.m4'); _EN(`store 15 0xAA bytes to EDI')_RU(`записать 15 байт 0xAA в EDI')
CLD                 ; _EN(``set direction to "forward"'')_RU(``установить направление на "вперед"'')
MOV EAX, 0AAAAAAAAh
MOV ECX, 3
REP STOSD           ; _EN(`write 12 bytes')_RU(`записать 12 байт')
STOSW               ; _EN(`write 2 more bytes')_RU(`записать еще 2 байта')
STOSB               ; _EN(`write remaining byte')_RU(`записать оставшийся байт')
