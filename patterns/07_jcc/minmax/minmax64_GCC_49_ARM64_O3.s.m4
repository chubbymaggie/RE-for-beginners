include(`commons.m4')my_max:
; X0=A
; X1=B
; _EN(`compare A and B')_RU(`сравнить A и B'):
	cmp	x0, x1
; _EN(`select X0 (A) to X0 if X0>=X1 or A>=B (Greater or Equal)')_RU(`выбрать X0 (A) в X0 если X0>=X1 или A>=B (Greater or Equal: больше или равно)') 
; _EN(`select X1 (B) to X0')_RU(`выбрать X1 (B) в X0') _if A<B
	csel	x0, x0, x1, ge
	ret

my_min:
; X0=A
; X1=B
; _EN(`compare A and B')_RU(`сравнить A и B'):
	cmp	x0, x1
; _EN(`select X0 (A) to X0 if X0<=X1 or A<=B (Less or Equal)')_RU(`выбрать X0 (A) в X0 если X0<=X1 (Less or Equal: меньше или равно)')
; _EN(`select X1 (B) to X0')_RU(`выбрать X1 (B) в X0') _if A>B
	csel	x0, x0, x1, le
	ret
