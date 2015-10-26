include(`commons.m4')calculate_machine_epsilon:
	fmov	x0, d0       ; _EN(`load input value of double type into X0')_RU(`загрузить входное значение типа double в X0')
	add	x0, x0, 1    ; X0++
	fmov	d1, x0       ; _EN(`move it to FPU register')_RU(`переместить его в регистр FPU')
	fsub	d0, d1, d0   ; _EN(`subtract')_RU(`вычесть')
	ret
