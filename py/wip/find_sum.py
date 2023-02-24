#!/usr/bin/env python3

def main(l, sum):

    # Optimize idea 1
    l = list(set(l))
    """
    Input: l -> list 
    Output: 
    """
    def niddle(a):
    # def niddle(a, sum):
        return sum - a 

    for pos, val in enumerate(l):
        print(f"checking {val}")
        if niddle(val) in l[pos+1:]:
            print(f"FOUND {val} {niddle(val)}") 
            return True
    return False

if __name__ == "__main__":
    ans = main([1,2,3,4,10,15,3,7],17)
    print(ans)
