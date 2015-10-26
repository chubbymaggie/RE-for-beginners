include(`commons.m4')00000000: B001         mov         al,1        ; _EN(`set 40x25 video mode')_RU(`установить видеорежим 40x25')
00000002: CD10         int         010
00000004: 30FF         xor         bh,bh       ; _EN(`set video page for int 10h call')_RU(`установить видеостраницу для вызова int 10h')
00000006: B9D007       mov         cx,007D0    ; _EN(`2000 characters to output')_RU(`вывод 2000 символов')
00000009: 31C0         xor         ax,ax
0000000B: 9C           pushf                   ; _EN(`push flags')_RU(`сохранить флаги')
; _EN(`get random value from timer chip')_RU(`узнать случайное число из чипа таймера')
0000000C: FA           cli                     ; _EN(`disable interrupts')_RU(`запретить прерывания')
0000000D: E643         out         043,al      ; _EN(`write 0 to port 43h')_RU(`записать 0 в порт 43h')
; _EN(`read 16-bit value from port 40h')_RU(`прочитать 16-битное значение из порта 40h')
0000000F: E440         in          al,040
00000011: 88C4         mov         ah,al
00000013: E440         in          al,040
00000015: 9D           popf                    ; _EN(`enable interrupts by restoring IF flag')_RU(`разрешить прерывания возвращая значение флага IF')
00000016: 86C4         xchg        ah,al
; _EN(`here we have 16-bit pseudorandom value')_RU(`здесь мы имеем псевдослучайное 16-битное значение')
00000018: D1E8         shr         ax,1
0000001A: D1E8         shr         ax,1
; _EN(`CF currently have second bit from the value')_RU(`в CF сейчас находится второй бит из значения')
0000001C: B05C         mov         al,05C ;'\'
; _EN(``if CF=1, skip the next instruction'')_RU(``если CF=1, пропускаем следующую инструкцию'')
0000001E: 7202         jc          000000022
; _EN(``if CF=0, reload AL register with another character'')_RU(``если CF=0, загружаем в регистр AL другой символ'')
00000020: B02F         mov         al,02F ;'/'
; _EN(`output character')_RU(`вывод символа')
00000022: B40E         mov         ah,00E
00000024: CD10         int         010
00000026: E2E1         loop        000000009 ; _EN(`loop 2000 times')_RU(`цикл в 2000 раз')
00000028: CD20         int         020       ; _EN(`exit to DOS')_RU(`возврат в DOS')
