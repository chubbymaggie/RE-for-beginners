include(`commons.m4')`#'include <stdio.h>
`#'include <stdint.h>
`#'include <time.h>

// _EN(``integer PRNG definitions, data and routines:'')_RU(``определения, данные и ф-ции для целочисленного PRNG'')

// _EN(`constants from the Numerical Recipes book')_RU(`константы из книги Numerical Recipes')
const uint32_t RNG_a=1664525;
const uint32_t RNG_c=1013904223;
uint32_t RNG_state; // _EN(`global variable')_RU(`глобальная переменная')

void my_srand(uint32_t i)
{
	RNG_state=i;
};

uint32_t my_rand()
{
        RNG_state=RNG_state*RNG_a+RNG_c;
        return RNG_state;
};

// _EN(`FPU PRNG definitions and routines:')_RU(`определения и ф-ции FPU PRNG:')

union uint32_t_float
{
	uint32_t i;
	float f;
};

float float_rand()
{
	union uint32_t_float tmp;
	tmp.i=my_rand() & 0x007fffff | 0x3F800000;
	return tmp.f-1;
};

// _EN(`test')_RU(`тест')

int main()
{
	my_srand(time(NULL)); // _EN(`PRNG initialization')_RU(`инициализация PRNG')

	for (int i=0; i<100; i++)
		printf ("%f\n", float_rand());

	return 0;
};
