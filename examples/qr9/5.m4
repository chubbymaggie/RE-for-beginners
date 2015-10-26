include(`commons.m4').text:00541081 first_loop1_begin:
.text:00541081    xor     esi, esi        ; _EN(`ESI is loop 2 counter')_RU(`ESI это счетчик второго цикла')
.text:00541083
.text:00541083 first_loop2_begin:
.text:00541083    push    ebp             ; arg_0
.text:00541084    push    esi             ; _EN(`loop 1 counter')_RU(`счетчик первого цикла')
.text:00541085    push    edi             ; _EN(`loop 2 counter')_RU(`счетчик второго цикла')
.text:00541086    call    get_bit
.text:0054108B    add     esp, 0Ch
.text:0054108E    mov     [ebx+esi], al   ; _EN(`store to internal array')_RU(`записываем во внутренний массив')
.text:00541091    inc     esi             ; _EN(`increment loop 1 counter')_RU(`инкремент счетчика первого цикла')
.text:00541092    cmp     esi, 8
.text:00541095    jl      short first_loop2_begin
.text:00541097    inc     edi             ; _EN(`increment loop 2 counter')_RU(`инкремент счетчика второго цикла')

; _EN(`increment internal array pointer by 8 at each loop 1 iteration')_RU(`инкремент указателя во внутреннем массиве на 8 на каждой итерации первого цикла')
.text:00541098    add     ebx, 8
.text:0054109B    cmp     edi, 8
.text:0054109E    jl      short first_loop1_begin

