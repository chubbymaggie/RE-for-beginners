include(`commons.m4')d_max:
; D0 - a, D1 - b
	fcmpe	d0, d1
	fcsel	d0, d0, d1, gt
; _EN(`now result in')_RU(`теперь результат в') D0
	ret
