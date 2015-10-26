include(`commons.m4')array$ = 8
a$ = 16
b$ = 24
get_by_coordinates3 PROC
; RCX=_EN(`address of array')_RU(`адрес массива')
; RDX=a
; R8=b
	movsxd	rax, r8d
; EAX=b
	movsxd	r9, edx
; R9=a
	add	rax, rcx
; RAX=b+_EN(`address of array')_RU(`адрес массива')
	movzx	eax, BYTE PTR [rax+r9*4]
; AL=_EN(`load byte at address')_RU(`загрузить байт по адресу') RAX+R9*4=b+_EN(`address of array')_RU(`адрес массива')+a*4=_EN(`address of array')_RU(`адрес массива')+a*4+b
	ret	0
get_by_coordinates3 ENDP

array$ = 8
a$ = 16
b$ = 24
get_by_coordinates2 PROC
	movsxd	rax, r8d
	movsxd	r9, edx
	add	rax, rcx
	movzx	eax, BYTE PTR [rax+r9*4]
	ret	0
get_by_coordinates2 ENDP

array$ = 8
a$ = 16
b$ = 24
get_by_coordinates1 PROC
	movsxd	rax, r8d
	movsxd	r9, edx
	add	rax, rcx
	movzx	eax, BYTE PTR [rax+r9*4]
	ret	0
get_by_coordinates1 ENDP
