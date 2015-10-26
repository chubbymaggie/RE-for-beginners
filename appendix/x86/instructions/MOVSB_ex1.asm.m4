include(`commons.m4'); _EN(`copy 15 bytes from ESI to EDI')_RU(`скопировать 15 байт из ESI в EDI')
CLD         ; _EN(`set direction to "forward"')_RU(`установить направление на "вперед"')
MOV ECX, 3
REP MOVSD   ; _EN(`copy 12 bytes')_RU(`скопировать 12 байт')
MOVSW       ; _EN(`copy 2 more bytes')_RU(`скопировать еще 2 байта')
MOVSB       ; _EN(`copy remaining byte')_RU(`скопировать оставшийся байт')
