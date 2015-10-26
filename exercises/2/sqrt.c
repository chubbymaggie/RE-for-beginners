// algorithm taken from SICP book

#include <math.h>

double average(double a, double b)
{
	return (a + b) / 2.0;
}

double improve (double guess, double x)
{
	return average(guess, x/guess);
}

int good_enough(double guess, double x)
{
	double d = abs(guess*guess - x);
	return (d < 0.001);
};

double square_root(double guess, double x)
{
	while(good_enough(guess, x)==0)
		guess = improve(guess, x);
	return guess;
};

double my_sqrt(double x)
{
	return square_root(1, x);
};

int main()
{
	printf ("%g\n", my_sqrt(123.456));
};
