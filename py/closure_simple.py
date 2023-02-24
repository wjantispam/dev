#!/usr/bin/env python3

def enter_number_outer():
    number = []

    def enter_number_inner(x):
        number.append(x)
        print(number)
    return enter_number_inner

# enter_num = enter_number_outer()
# enter_num(3)
# enter_num(4)
# enter_number_outer(x)
# enter_number_outer(3)
enter_number_inner(3)
