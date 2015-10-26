	mov	eax, 2021161081				; 78787879H
	imul	DWORD PTR _a$[esp-4]
	sar	edx, 3
	mov	eax, edx
	shr	eax, 31					; 0000001fH
	add	eax, edx
