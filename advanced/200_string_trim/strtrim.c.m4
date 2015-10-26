include(`commons.m4')`#'include <stdio.h>
`#'include <string.h>

char* str_trim (char *s)
{
	char c;
	size_t str_len;
	
	// _EN(`work as long as')_RU(``работать до тех пор, пока'') \r _or \n _EN(`is at the end of string')_RU(`находятся в конце строки')
	// _EN(``stop if some other character there or it's an empty string'')_RU(``остановиться, если там какой-то другой символ, или если строка пустая'')
	// (_EN(`at start or due to our operation')_RU(``на старте, или в результате наших действий''))
	for (str_len=strlen(s); str_len>0 && (c=s[str_len-1]); str_len--)
	{
		if (c=='\r' || c=='\n')
			s[str_len-1]=0;
		else
			break;
	};
	return s;
};

int main()
{
	// _EN(`test')_RU(`тест')

	// _EN(``strdup() is used to copy text string into data segment,'')_RU(``здесь применяется strdup() для копирования строк в сегмент данных,'')
	// _EN(``because it will crash on Linux otherwise,'')_RU(``потому что иначе процесс упадет в Linux,'')
	// _EN(``where text strings are allocated in constant data segment,'')_RU(``где текстовые строки располагаются в константном сегменте данных,'')
	// _EN(`and not modifiable')_RU(`и не могут модифицироваться').

	printf ("[%s]\n", str_trim (strdup("")));
	printf ("[%s]\n", str_trim (strdup("\n")));
	printf ("[%s]\n", str_trim (strdup("\r")));
	printf ("[%s]\n", str_trim (strdup("\n\r")));
	printf ("[%s]\n", str_trim (strdup("\r\n")));
	printf ("[%s]\n", str_trim (strdup("test1\r\n")));
	printf ("[%s]\n", str_trim (strdup("test2\n\r")));
	printf ("[%s]\n", str_trim (strdup("test3\n\r\n\r")));
	printf ("[%s]\n", str_trim (strdup("test4\n")));
	printf ("[%s]\n", str_trim (strdup("test5\r")));
	printf ("[%s]\n", str_trim (strdup("test6\r\r\r")));
};
