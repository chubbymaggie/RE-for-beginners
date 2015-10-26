include(`commons.m4').text:0000A44D                 mov     esi, [ebp+arg_C] ; key
.text:0000A450                 mov     edx, [ebp+arg_4] ; string
.text:0000A453 loc_A453:
.text:0000A453                 xor     eax, eax
.text:0000A455                 mov     al, [edx+edi] ; _EN(`load encrypted byte')_RU(`загружаем байт для дешифровки')
.text:0000A458                 xor     eax, esi      ; _EN(`decrypt it')_RU(`дешифруем его')
.text:0000A45A                 add     esi, 3        ; _EN(`change key for the next byte')_RU(`изменяем ключ для следующего байта')
.text:0000A45D                 inc     edi
.text:0000A45E                 cmp     edi, ecx
.text:0000A460                 mov     [ebp+edi+var_55], al
.text:0000A464                 jl      short loc_A453
