include(`commons.m4')00000000: B9D007   mov    cx,007D0 ; _EN(`limit output to 2000 characters')_RU(`вывести только 2000 символов')
00000003: 31C0     xor    ax,ax    ; _EN(`command to timer chip')_RU(`команда чипу таймера')
00000005: E643     out    043,al
00000007: E440     in     al,040   ; _EN(`read 8-bit of timer')_RU(`читать 8 бит из таймера')
00000009: D1E8     shr    ax,1     ; _EN(`get second bit to CF flag')_RU(`переместить второй бит в флаг CF')
0000000B: D1E8     shr    ax,1
0000000D: B05C     mov    al,05C   ; _EN(`prepare')_RU(`подготовить') '\'
0000000F: 7202     jc     000000013
00000011: B02F     mov    al,02F   ; _EN(`prepare')_RU(`подготовить ') '/'
; _EN(`output character to screen')_RU(`вывести символ на экран')
00000013: B40E     mov    ah,00E
00000015: CD10     int    010
00000017: E2EA     loop   000000003
; _EN(`exit to DOS')_RU(`выход в DOS')
00000019: CD20     int    020
