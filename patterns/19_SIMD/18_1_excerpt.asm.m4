include(`commons.m4')movdqu  xmm1, xmmword ptr [ebx+edi*4] ; ar1+i*4
movdqu  xmm0, xmmword ptr [esi+edi*4] ; ar2+i*4 _EN(``is not 16-byte aligned, so load it to'')_RU(``не выровнен по 16-байтной границе, так что загружаем это в'') XMM0
paddd   xmm1, xmm0
movdqa  xmmword ptr [eax+edi*4], xmm1 ; ar3+i*4
