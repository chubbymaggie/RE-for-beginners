include(`commons.m4')$SG1355	DB	'it is ten', 00H
$SG1356	DB	'it is not ten', 00H

a$ = 8
f	PROC
; _EN(`load pointers to the both strings')_RU(`загрузить указатели на обе строки')
	lea	rdx, OFFSET FLAT:$SG1355 ; 'it is ten'
	lea	rax, OFFSET FLAT:$SG1356 ; 'it is not ten'
; _EN(`compare input value with')_RU(`сравнить входное значение с') 10
	cmp	ecx, 10
; _EN(``if equal, copy value from RDX'')_RU(``если равно, скопировать значение из RDX'') ("it is ten")
; _EN(``if not, do nothing. pointer to the string "it is not ten" is still in RAX as for now.'')_RU(``если нет, ничего не делаем. указатель на строку "it is not ten" всё еще в RAX.'')
	cmove	rax, rdx
	ret	0
f	ENDP
