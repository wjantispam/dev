from random import randint, shuffle
from itertools import product

def random_letter(n) -> str:
    # ord('A'), ord('Z') = 65, 90
    x = [ chr(randint(ord('A'), ord('Z'))) for _ in range(n)]
    return "".join(x)

def random_digits(n) -> int:
    assert n >= 1
    return randint(10**(n-1), 10**(n)-1) 

# WJQ: Should we keep this function inside the class?
#  Having it inside the class people will not modify it without testing the Class?
def create_names(num_char=2, num_dig=3):
    _NUM='1234567890'
    _CHR='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    # TODO: Would be good not having to convert iterator to a list, they just wasted memory space here
    # for Name like AB123 it has 676000 combinations, while name like A2 has 260
    # len(names) = 26**num_char*10**num_dig
    name_digit_part = [ "".join(_) for _ in product(_NUM, repeat=num_dig) ]
    name_char_part= [ "".join(_) for _ in product(_CHR, repeat=num_char) ]
    names = [ "".join(_) for _ in product(name_char_part, name_digit_part) ]
    shuffle(names) # shuffle names in place
    return names, len(names)

class Robot:
    """
    Robot name is like AB123 which is combination of two alphabets and 3 digits
    There are max of 676_000 uniq names 
    We create a table that holds these name and shuffle them randomly
    Once we exhutsted all the available names we will raise an exception
    Discussion:
    Major consideration:
    1. This has a slow start time because all random names have to be generated
    2. It is O(1) time to get a new name. The former method needs to generate a name.
    3. New name is guranteed to be uniq. The former method will have O(n2) to gurantee uniquness
        In the worst case it needs to n times for nth name to avoid duplicates, O(n2)
        eg. 1 time for the 1 st name
            2 time for the 2 nd name -- because it is possible that the name already been taken
            3 times for the 3rd name -- two previous name might be taken
    """
    _RUN = True
    _RESET = False
    def __init__(self):
        self.list_names, self.size_names = create_names()
        self._name = self.list_names.pop()

    def reset(self):
        self._RESET = True 
        return True
    
    @property
    def name(self):
        # print(f"See RUN={_RUN}")
        if not self._RUN or self._RESET:
            # self._RUN = False
            try:
                self._name = self.list_names.pop()
            except IndexError as tp:
                print(f"Exception: {tp}: Run out all names!")
        return self._name

if __name__ == '__main__':
    # Don't run this 
    # names = [Robot().name for _ in range(300)]
    
    r = Robot()
    print(f"size name = {r.size_names}")
    for _ in range(261):
        print(r.name)
        r.reset()