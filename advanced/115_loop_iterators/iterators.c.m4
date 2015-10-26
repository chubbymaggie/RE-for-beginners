include(`commons.m4')`#'include <stdio.h>

void f(int *a1, int *a2, size_t cnt)
{
	size_t i;

	// _EN(`copy from one array to another in some weird scheme')_RU(`копировать из одного массива в другой по какой-то странной схеме')
	for (i=0; i<cnt; i++)
		a1[i*3]=a2[i*7];
};
