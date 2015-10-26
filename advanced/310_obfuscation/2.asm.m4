include(`commons.m4')mov	esi, 1
...	; _RU(`какой-то не трогающий ESI код')_EN(`some code not touching ESI')
dec	esi
...	; _RU(`какой-то не трогающий ESI код')_EN(`some code not touching ESI')
cmp	esi, 0
jz	real_code
; _RU(`фальшивый багаж')_EN(`fake luggage')
real_code:
