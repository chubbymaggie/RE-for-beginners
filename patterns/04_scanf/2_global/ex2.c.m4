include(`commons.m4')`#'include <stdio.h>

// _EN(`now x is global variable')_RU(`теперь x это глобальная переменная')
int x;

int main() 
{
	printf ("Enter X:\n");

	scanf ("%d", &x);

	printf ("You entered %d...\n", x);

	return 0;
};
