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
    _CHR='ABCDEFGHIJKLMNOPQRSTUVWZYZ'
    # TODO: Would be good not having to convert iterator to a list, they just wasted memory space here
    # for Name like AB123 it has 676000 combinations, while name like A2 has 260
        # len(names) = 26**num_char*10**num_dig
    name_digit_part = [ "".join(_) for _ in product(_NUM, repeat=num_dig) ]
    name_char_part= [ "".join(_) for _ in product(_CHR, repeat=num_char) ]
    names = [ "".join(_) for _ in product(name_char_part, name_digit_part) ]
    shuffle(names) # shuffle names in place
    return names, len(names)

class Robot:
    _RESET = False
    name_pool = set()
    """
    Robot name is like AB123 which is combination of two alphabets and 3 digits
    There are max of 676_000 uniq names 
    We create a table that holds these name and shuffle them randomly
    Once we exhutsted all the available names we will raise an exception
    """
    def __init__(self) -> None:
        # self._name = self.reset()
        # random.seed()
        list_names, size_names = create_names()
        print(f"Generate all the names when initiate the class, eg 1st name is {list_names[0]}")

    # def create_names(self, num_char=2, num_dig=3) -> list:
    #     _NUM='1234567890'
    #     _CHR='ABCDEFGHIJKLMNOPQRSTUVWZYZ'
    #     name_digit_part = [ "".join(_) for _ in product(_NUM, repeat=num_dig) ]
    #     name_char_part= [ "".join(_) for _ in product(_CHR, repeat=num_char) ]
    #     names = [ "".join(_) for _ in product(name_char_part, name_digit_part) ]
    #     shuffle(names) # shuffle names in place
    #     return names
    # def random_letter(self, n) -> str:
    #     # ord('A'), ord('Z') = 65, 90
    #     x = [ chr(randint(ord('A'), ord('Z'))) for _ in range(n)]
    #     return "".join(x)
    
    # def random_digits(self,n) -> int:
    #     assert n >= 1
    #     return randint(10**(n-1), 10**(n)-1) 
        
    J = 0
    def new_name(self,num_char=1,num_dig=1):
    # def new_name(self,num_char=2,num_dig=3):
        # for Name like AB123 it has 676000 combinations, while name like A2 has 260
        MAX_NAME_POOL_SIZE = 26**num_char*10**num_dig
        _new_name = self.random_letter(num_char)+str(self.random_digits(num_dig))
        # print(f".....{_new_name}->{self.name_pool}")
        if _new_name in self.name_pool:
            self.J += 1
            print(f"Woops J={self.J} ... L={len(self.name_pool)} generate again {_new_name}->{self.name_pool}")
            self.new_name()
        self.name_pool.add(_new_name)
        if len(self.name_pool) >= MAX_NAME_POOL_SIZE:
            raise Exception("It is full!!!")
        return _new_name

    # this has TypeError
    # my_name = new_name()
    def reset(self):
        random.seed()
        # self._name = None        
        self._RESET = True
        # return self._RESET
        return True

    #BAGA: You can't do this
    # _name = new_name()
    # _name = self.new_name()    # NameError: name 'self' is not defined
    # _name = new_name(self)     # NameError: name 'self' is not defined
    _HASRUN = 0   # 
    @property
    def name(self):
        if not self._HASRUN:
            print("Running 1 ...")
            self._name = self.new_name() 
            self._HASRUN = 1
        if self._RESET: 
            print("Running 2 ...")
            self._name = self.new_name() 
            self._HASRUN = 1
            # self._RESET = False
        return self._name

if __name__ == '__main__':
        
    # x = Robot()
    # print(x.name)
    # print(x.name)

    # print(f"{30*'-'}")
    # print(Robot().name)
    # print(Robot().name)


    # print(f"{30*'-'}")
    # y = Robot()
    # print(y.name)
    # y.reset()
    # print(y.name)

    print(f"{30*'-'}")
    seed = "Totally random."
    import random
    random.seed(seed)
    robot = Robot()
    name = robot.name
    print(name)
    random.seed(seed)
    robot.reset()
    name2 = robot.name
    print(name2)

    # names = [Robot().name for _ in range(300)]












