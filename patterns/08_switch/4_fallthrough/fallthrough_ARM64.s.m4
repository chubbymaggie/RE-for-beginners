include(`commons.m4').LC0:
	.string	"read=%d, write=%d\n"
f:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	w0, [x29,28]
	str	wzr, [x29,44] ; _EN(`set "read" and "write" local variables to zero')_RU(`установить локальные переменные "read" и "write" в ноль')
	str	wzr, [x29,40]
	ldr	w0, [x29,28]  ; _EN(`load "type" argument')_RU(`загрузить аргумент "type"')
	cmp	w0, 2         ; type=W?
	beq	.L3
	cmp	w0, 3         ; type=RW?
	beq	.L4
	cmp	w0, 1         ; type=R?
	beq	.L5
	b	.L6           ; _EN(`otherwise')_RU(`в противном случае')...
.L4: ; case RW
	mov	w0, 1
	str	w0, [x29,44] ; read=1
.L3: ; case W
	mov	w0, 1
	str	w0, [x29,40] ; write=1
	b	.L6
.L5: ; case R
	mov	w0, 1
	str	w0, [x29,44] ; read=1
	nop
.L6: ; default
	adrp	x0, .LC0 ; "read=%d, write=%d\n"
	add	x0, x0, :lo12:.LC0
	ldr	w1, [x29,44] ; _EN(`load')_RU(`загрузить') "read"
	ldr	w2, [x29,40] ; _EN(`load')_RU(`загрузить') "write"
	bl	printf
	ldp	x29, x30, [sp], 48
	ret
