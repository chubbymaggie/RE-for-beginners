include(`commons.m4')xor	esi, 011223344h	; _RU(`мусор')_EN(`garbage')
add	esi, eax	; _RU(`мусор')_EN(`garbage')
add	eax, ebx
mov	edx, eax	; _RU(`мусор')_EN(`garbage')
shl	edx, 4		; _RU(`мусор')_EN(`garbage')
mul	ecx
xor	esi, ecx	; _RU(`мусор')_EN(`garbage')
