include(`commons.m4'); _EN(`AL is random at this point')_RU(`AL в этом месте имеет случайное значение')
00000000: AE         scasb
; _EN(`CF is set according subtracting random memory byte from AL.')_RU(`CF устанавливается по результату вычитания случайного байта памяти из AL.')
; _EN(`so it is somewhat random at this point')_RU(``так что он здесь случаен, в каком-то смысле'')
00000001: D6         setalc
; _EN(`AL is set to 0xFF if CF=1 or to 0 if otherwise')_RU(`AL выставляется в 0xFF если CF=1 или в 0 если наоборот')
00000002: 242D       and         al,02D ;'-'
; _EN(`AL here is 0x2D or 0')_RU(`AL здесь 0x2D либо 0')
00000004: 042F       add         al,02F ;'/'
; _EN(`AL here is 0x5C or 0x2F')_RU(`AL здесь 0x5C либо 0x2F')
00000006: CD29       int         029       ; _EN(`output AL to screen')_RU(`вывести AL на экране')
00000008: EBF6       jmps        000000000 ; _EN(`loop endlessly')_RU(`бесконечный цикл')
