from random import randint
class Robot:
    name_pool = set()
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
        
    def new_name(self):
        num_char, num_dig = 2, 3
        return self.random_letter(num_char)+str(self.random_digits(num_dig))

    # this has TypeError
    # my_name = new_name()
    def reset(self):
        # self._name = None        
        self.reset = True

    @property 
    def name(self):
        if self.reset:
            self._name = self.new_name()
            
        if self._name in self.name_pool:
            self._name = self.new_name()
        self.name_pool.add(self._name)
        return self._name

x = Robot()
print(x.name)
print(x.name)


print(Robot().name)
print(Robot().name)


y = Robot()
print(y.name)
y.reset()
print(y.name)















