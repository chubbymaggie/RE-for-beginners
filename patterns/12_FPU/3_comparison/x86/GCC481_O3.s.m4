include(`commons.m4')	fld	QWORD PTR [esp+4]	; _EN(`load')_RU(`загрузить') "a"
	fld	QWORD PTR [esp+12]	; _EN(`load')_RU(`загрузить') "b"
	; ST0=b, ST1=a
	fxch	st(1)
	; ST0=a, ST1=b
	; _EN(`compare')_RU(`сравнить') "a" _EN(`and')_RU(`и') "b"
	fucomi	st, st(1)
	; _EN(`copy')_RU(`скопировать') ST1 (_EN(``"b" here'')_RU(``там "b"'')) _EN(`to')_RU(`в') ST0 _if a<=b
	; _EN(``leave "a" in ST0 otherwise'')_RU(``в противном случае, оставить "a" в ST0'')
	fcmovbe	st, st(1)
	; _EN(`discard value in')_RU(`выбросить значение из') ST1
	fstp	st(1)
	ret
