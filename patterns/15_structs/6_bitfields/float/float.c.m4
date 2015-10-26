include(`commons.m4')`#'include <stdio.h>
`#'include <assert.h>
`#'include <stdlib.h>
`#'include <memory.h>

struct float_as_struct
{
    unsigned int fraction : 23; // _RU(`мантисса')_EN(`fractional part')
    unsigned int exponent : 8;  // _RU(`экспонента')_EN(`exponent') + 0x3FF
    unsigned int sign : 1;      // _RU(`бит знака')_EN(`sign bit')
};

float f(float _in)
{
    float f=_in;
    struct float_as_struct t;

    assert (sizeof (struct float_as_struct) == sizeof (float));

    memcpy (&t, &f, sizeof (float));

    t.sign=1; // _RU(`установить отрицательный знак')_EN(`set negative sign')
    t.exponent=t.exponent+2; // _RU(`умножить d на $2^{n}$ (n здесь 2)')_EN(`multiply d by $2^{n}$ (n here is 2)')

    memcpy (&f, &t, sizeof (float));

    return f;
};

int main()
{
    printf ("%f\n", f(1.234));
};
