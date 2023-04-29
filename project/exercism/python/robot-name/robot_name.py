from random import randint
class Robot:
    _RESET = False
    def __init__(self) -> None:
        # self._name = self.reset()
        self._name = None

    def random_letter(self, n) -> str:
        # ord('A'), ord('Z') = 65, 90
        x = [ chr(randint(65,90)) for _ in range(n)]
        return "".join(x)
    
    def random_digits(self,n) -> int:
        assert n >= 1
        return randint(10**(n-1), 10**(n)-1) 
        
    name_pool = set()
    def new_name(self,num_char=2,num_dig=3):
        _new_name = self.random_letter(num_char)+str(self.random_digits(num_dig))
        # print(f".....{_new_name}->{self.name_pool}")
        if _new_name in self.name_pool:
            # print(f";;;;;{_new_name}->{self.name_pool}")
            self.new_name()
        self.name_pool.add(_new_name)
        return _new_name

    # this has TypeError
    # my_name = new_name()
    def reset(self):
        random.seed()
        # self._name = None        
        self._RESET = True
        return self._RESET

    #BAGA: You can't do this
    # _name = new_name()
    # _name = self.new_name()    # NameError: name 'self' is not defined
    # _name = new_name(self)     # NameError: name 'self' is not defined
    _HASRUN = 0   # 
    @property
    def name(self):
        if not self._HASRUN:
            self._name = self.new_name() 
            self._HASRUN = 1
        if self._RESET: 
            self._name = self.new_name() 
            self._HASRUN = 1
            self._RESET = False
        return self._name

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













