include(`commons.m4')#include <stdio.h>

char a[3][4];

int main()
{
	int x, y;
	
	// _EN(`clear array')_RU(`очистить массив')
	for (x=0; x<3; x++)
		for (y=0; y<4; y++)
			a[x][y]=0;

	// _EN(`fill third column by')_RU(`заполнить третий столбец значениями') 0..2:
	for (x=0; x<3; x++)
		a[x][2]=x;
};
