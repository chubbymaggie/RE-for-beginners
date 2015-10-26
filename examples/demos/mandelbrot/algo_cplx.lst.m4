include(`commons.m4')def check_if_is_in_set(P):
    P_start=P
    iterations=0

    while True:
        if (P>bounds):
            break
        P=P^2+P_start
        if iterations > max_iterations:
            break
        iterations++

    return iterations

`#' _EN(`black-white')_RU(`черно-белое')
for each point on screen P:
    if check_if_is_in_set (P) < max_iterations:
        _EN(`draw point')_RU(`нарисовать точку')

`#' _EN(`colored')_RU(`цветное')
for each point on screen P:
    iterations = if check_if_is_in_set (P)
    _EN(`map iterations to color')_RU(`преобразовать количество итераций в цвет')
    _EN(`draw color point')_RU(`нарисовать цветную точку')
