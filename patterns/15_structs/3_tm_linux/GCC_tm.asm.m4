include(`commons.m4')main proc near
     push    ebp
     mov     ebp, esp
     and     esp, 0FFFFFFF0h
     sub     esp, 40h
     mov     dword ptr [esp], 0 ; _EN(`first argument for')_RU(`первый аргумент для') time()
     call    time
     mov     [esp+3Ch], eax
     lea     eax, [esp+3Ch]  ; _EN(`take pointer to what time() returned')_RU(`берем указатель на то что вернула time()')
     lea     edx, [esp+10h]  ; _EN(`at ESP+10h struct tm will begin')_RU(`по ESP+10h будет начинаться структура struct tm')
     mov     [esp+4], edx    ; _EN(`pass pointer to the structure begin')_RU(`передаем указатель на начало структуры')
     mov     [esp], eax      ; _EN(`pass pointer to result of')_RU(`передаем указатель на результат') time()
     call    localtime_r
     mov     eax, [esp+24h]  ; tm_year
     lea     edx, [eax+76Ch] ; edx=eax+1900
     mov     eax, offset format ; "Year: %d\n"
     mov     [esp+4], edx
     mov     [esp], eax
     call    printf
     mov     edx, [esp+20h]      ; tm_mon
     mov     eax, offset aMonthD ; "Month: %d\n"
     mov     [esp+4], edx
     mov     [esp], eax
     call    printf
     mov     edx, [esp+1Ch]     ; tm_mday
     mov     eax, offset aDayD  ; "Day: %d\n"
     mov     [esp+4], edx
     mov     [esp], eax
     call    printf
     mov     edx, [esp+18h]     ; tm_hour
     mov     eax, offset aHourD ; "Hour: %d\n"
     mov     [esp+4], edx
     mov     [esp], eax
     call    printf
     mov     edx, [esp+14h]        ; tm_min
     mov     eax, offset aMinutesD ; "Minutes: %d\n"
     mov     [esp+4], edx
     mov     [esp], eax
     call    printf
     mov     edx, [esp+10h]
     mov     eax, offset aSecondsD ; "Seconds: %d\n"
     mov     [esp+4], edx          ; tm_sec
     mov     [esp], eax
     call    printf
     leave
     retn
main endp
