include(`commons.m4')f:
	mov	w2, 0		; rt=0
	mov	x5, 1
	mov	w1, w2
.L2:
	lsl	x4, x5, x1	; w4 = w5<<w1 = 1<<i
	add	w3, w2, 1	; new_rt=rt+1
	tst	x4, x0		; (1<<i) & a
	add	w1, w1, 1	; i++
; _EN(`result of TST was non-zero')_RU(`результат TST был ненулевой')?
; _EN(`then')_RU(`тогда') w2=w3 _or rt=new_rt. 
; _EN(`otherwise')_RU(`в противном случае'): w2=w2 _or rt=rt (_EN(`idle operation')_RU(`холостая операция'))
	csel	w2, w3, w2, ne
	cmp	w1, 64		; i<64?
	bne	.L2		; _EN(`yes')_RU(`да')
	mov	w0, w2		; _return rt
	ret
