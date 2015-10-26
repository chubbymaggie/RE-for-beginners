include(`commons.m4')00000000: B05C       mov         al,05C    ;'\'
; _EN(`read AL byte from random place of memory')_RU(`читать байт в AL из случайного места в памяти')
00000002: AE         scasb
; _EN(`PF = parity(AL - random\_memory\_byte) = parity(5Ch - random\_memory\_byte)')_RU(`PF = четность(AL - случайный\_байт) = четность(5Ch - случайный\_байт)')
00000003: 7A02       jp          000000007
00000005: B02F       mov         al,02F    ;'/'
00000007: CD29       int         029       ; _EN(`output AL to screen')_RU(`вывод AL на экран')
00000009: EBF5       jmp         000000000 ; _EN(`loop endlessly')_RU(`бесконечный цикл')
