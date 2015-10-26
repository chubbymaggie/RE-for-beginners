include(`commons.m4')#include <stdio.h>

const char* month1[]=
{
	"January",
	"February",
	"March",
	"April",
	"May",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December"
};

// _EN(`in 0..11 range')_RU(`в пределах 0..11')
const char* get_month1 (int month)
{
	return month1[month];	
};
