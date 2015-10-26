include(`commons.m4')_key$ = 8                ; size = 4
_len$ = 12               ; size = 4
_hash$ = 16              ; size = 4
_crc    PROC
    mov    edx, DWORD PTR _len$[esp-4]
    xor    ecx, ecx ; _EN(`i will be stored in ECX')_RU(`i будет лежать в регистре ECX')
    mov    eax, edx
    test   edx, edx
    jbe    SHORT $LN1@crc
    push   ebx
    push   esi
    mov    esi, DWORD PTR _key$[esp+4] ; ESI = key
    push   edi
$LL3@crc:

; _EN(`work with bytes using only 32-bit registers. byte from address key+i we store into EDI')_RU(`работаем с байтами используя 32-битные регистры. в EDI положим байт с адреса key+i')

    movzx  edi, BYTE PTR [ecx+esi] 
    mov    ebx, eax ; EBX = (hash = len)
    and    ebx, 255 ; EBX = hash & 0xff

; XOR EDI, EBX (EDI=EDI^EBX) - _EN(`this operation uses all 32 bits of each register')_RU(`эта операция задействует все 32 бита каждого регистра')
; _EN(``but other bits (8-31) are cleared all time, so it's OK'')_RU(``но остальные биты (8-31) будут обнулены всегда, так что все ОК'')
; _EN(``these are cleared because, as for EDI, it was done by MOVZX instruction above'')_RU(``они обнулены потому что для EDI это было сделано инструкцией MOVZX выше'')
; _EN(``high bits of EBX was cleared by AND EBX, 255 instruction above (255 = 0xff)'')_RU(``а старшие биты EBX были сброшены инструкцией AND EBX, 255 (255 = 0xff)'')

    xor    edi, ebx

; EAX=EAX>>8; _EN(``bits 24-31 taken "from nowhere" will be cleared'')_RU(``образовавшиеся "из ниоткуда" биты в результате (биты 24-31) будут заполнены нулями'')
    shr    eax, 8

; EAX=EAX^crctab[EDI*4] - _EN(``choose EDI-th element from crctab[] table'')_RU(``выбираем элемент из таблицы crctab[] под номером EDI'')
    xor    eax, DWORD PTR _crctab[edi*4]
    inc    ecx            ; i++
    cmp    ecx, edx       ; i<len ?
    jb     SHORT $LL3@crc ; _EN(`yes')_RU(`да')
    pop    edi
    pop    esi
    pop    ebx
$LN1@crc:
    ret    0
_crc    ENDP
