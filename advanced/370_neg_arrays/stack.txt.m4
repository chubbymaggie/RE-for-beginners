include(`commons.m4')CPU Stack
Address   Value     
001DFBCC  /001DFBD3 ; _RU(`указатель fakearray')_EN(`fakearray pointer')
001DFBD0  |11223344 ; random_value
001DFBD4  |03020100 ; 4 _RU(`байта')_EN(`bytes of') array[]
001DFBD8  |07060504 ; 4 _RU(`байта')_EN(`bytes of') array[]
001DFBDC  |00CB0908 ; _RU(`случайный мусор + 2 последних байта')_EN(`random garbage + 2 last bytes of') array[]
001DFBE0  |0000000A ; _RU(`последнее значение i после того как закончился цикл')_EN(`last i value after loop was finished')
001DFBE4  |001DFC2C ; _RU(`сохраненное значение EBP')_EN(`saved EBP value')
001DFBE8  \00CB129D ; _RU(`адрес возврата (RA)')_EN(`Return Address')
