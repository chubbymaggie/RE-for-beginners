include(`commons.m4')0029FC14   00E0103A  RETURN to fib2.00E0103A from fib2.00E01000
0029FC18   00000008  _arg1: a    
0029FC1C   0000000D  _arg2: b    
0029FC20   00000014  _arg3: limit
0029FC24   0000000D  _EN(`"next" variable')_RU(`переменная "next"')
0029FC28  /0029FC40  _EN(`saved EBP register')_RU(`сохраненный регистр EBP')
0029FC2C  |00E0103A  RETURN to fib2.00E0103A from fib2.00E01000
0029FC30  |00000005  _arg1: a     
0029FC34  |00000008  _arg2: b     
0029FC38  |00000014  _arg3: limit 
0029FC3C  |00000008  _EN(`"next" variable')_RU(`переменная "next"')     
0029FC40  ]0029FC58  _EN(`saved EBP register')_RU(`сохраненный регистр EBP')
0029FC44  |00E0103A  RETURN to fib2.00E0103A from fib2.00E01000
0029FC48  |00000003  _arg1: a     
0029FC4C  |00000005  _arg2: b     
0029FC50  |00000014  _arg3: limit 
0029FC54  |00000005  _EN(`"next" variable')_RU(`переменная "next"')     
0029FC58  ]0029FC70  _EN(`saved EBP register')_RU(`сохраненный регистр EBP')
0029FC5C  |00E0103A  RETURN to fib2.00E0103A from fib2.00E01000
0029FC60  |00000002  _arg1: a     
0029FC64  |00000003  _arg2: b     
0029FC68  |00000014  _arg3: limit 
0029FC6C  |00000003  _EN(`"next" variable')_RU(`переменная "next"')     
0029FC70  ]0029FC88  _EN(`saved EBP register')_RU(`сохраненный регистр EBP')
0029FC74  |00E0103A  RETURN to fib2.00E0103A from fib2.00E01000
0029FC78  |00000001  _arg1: a            \                          
0029FC7C  |00000002  _arg2: b            | prepared in f1() for next f1()
0029FC80  |00000014  _arg3: limit        /                          
0029FC84  |00000002  _EN(`"next" variable')_RU(`переменная "next"')     
0029FC88  ]0029FC9C  _EN(`saved EBP register')_RU(`сохраненный регистр EBP')
0029FC8C  |00E0106C  RETURN to fib2.00E0106C from fib2.00E01000
0029FC90  |00000001  _arg1: a            \
0029FC94  |00000001  _arg2: b            | prepared in main() for f1()
0029FC98  |00000014  _arg3: limit        /
0029FC9C  ]0029FCE0  _EN(`saved EBP register')_RU(`сохраненный регистр EBP')
0029FCA0  |00E011E0  RETURN to fib2.00E011E0 from fib2.00E01050
0029FCA4  |00000001  main() _arg1: argc  \                           
0029FCA8  |000812C8  main() _arg2: argv  | _EN(`prepared in CRT for')_RU(`подготовлено в CRT для') main()
0029FCAC  |00082940  main() _arg3: envp  /                           
