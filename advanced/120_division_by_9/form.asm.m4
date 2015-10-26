include(`commons.m4')	mov	eax, MAGICAL CONSTANT
	imul	_input_value
	sar	edx, SHIFTING COEFFICIENT ; _EN(`signed division by $2^x$ using arithmetic shift right')_RU(`знаковое деление на $2^x$ при помощи арифметического сдвига вправо')
	mov	eax, edx
	shr	eax, 31
	add	eax, edx
