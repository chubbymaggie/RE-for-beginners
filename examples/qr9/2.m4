include(`commons.m4').text:00541369 mov     esi, [esp+2Ch+Str]
; _EN(`reset all lowest 6 bits')_RU(`сбросить в ноль младшие 6 бит')
.text:0054136D and     esi, 0FFFFFFC0h
; _EN(`align size to 64-byte border')_RU(`выровнять размер по 64-байтной границе')
.text:00541370 add     esi, 40h
