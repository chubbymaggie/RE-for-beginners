include(`commons.m4')`#'include <stdint.h>
`#'include <stdio.h>

void bzero(uint8_t* dst, size_t count)
{
	int i;

	if (count&(~7))
		// _EN(`work out 8-byte blocks')_RU(`обработать 8-байтные блоки')
		for (i=0; i<count>>3; i++)
		{
			*(uint64_t*)dst=0;
			dst=dst+8;
		};

	// _EN(`work out the tail')_RU(`обработать хвост')
	switch(count & 7)
	{
	case 7:	*dst++ = 0;
	case 6:	*dst++ = 0;
	case 5:	*dst++ = 0;
	case 4:	*dst++ = 0;
	case 3:	*dst++ = 0;
	case 2:	*dst++ = 0;
	case 1:	*dst++ = 0;
	case 0: // _EN(`do nothing')_RU(`ничего не делать')
		break;
	}
}
