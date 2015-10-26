include(`commons.m4')def check_if_is_in_set(X, Y):
    X_start=X
    Y_start=Y
    iterations=0

    while True:
        if (X^2 + Y^2 > bounds):
            break
        new_X=X^2 - Y^2 + X_start
        new_Y=2*X*Y + Y_start
        if iterations > max_iterations:
            break
        iterations++

    return iterations

`#' _EN(`black-white')_RU(`черно-белое')
for X = min_X to max_X:
    for Y = min_Y to max_Y:
        if check_if_is_in_set (X,Y) < max_iterations:
            _EN(`draw point at')_RU(`нарисовать точку на') X, Y

`#' _EN(`colored')_RU(`цветное')
for X = min_X to max_X:
    for Y = min_Y to max_Y:
        iterations = if check_if_is_in_set (X,Y)
        _EN(`map iterations to color')_RU(`преобразовать количество итераций в цвет')
        _EN(`draw color point at')_RU(`нарисовать цветную точку на') X,Y
