include(`commons.m4')#include <stdio.h>

class c
{
private:
    int v1;
    int v2;
public:
    c() // _EN(`default ctor')_RU(`конструктор по умолчанию')
    {
        v1=667;
        v2=999;
    };

    c(int a, int b) // _EN(`ctor')_RU(`конструктор')
    {
        v1=a;
        v2=b;
    };

    void dump()
    {
        printf ("%d; %d\n", v1, v2);
    };
};

int main()
{
    class c c1;
    class c c2(5,6);
    
    c1.dump();
    c2.dump();

    return 0;
};
