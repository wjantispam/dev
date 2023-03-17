#!/usr/bin/env python3

a = [1,0,3,4,5,0]

def main(a):
    zero_index = -1
    product = 1
    for i in range(len(a)):
        if a[i] == 0 and zero_index == -1:
            zero_index = i
        elif a[i] == 0 and zero_index != 1:
            breakpoint()
            return [0] * len(a)
        else:
            product *= a[i]
    if zero_index != -1:
        breakpoint()
        products = [0] * len(a)
        products[zero_index] = product
        return products
    products = [1]*len(a)
    if i in range(len(a)):
        products[i] = product / a[i]
    return products

ans = main(a)

print(ans)
