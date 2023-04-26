from random import randint
class Robot:
    def __init__(self) -> None:
        self._name = "123"

    def random_letter(self, n) -> str:
        # ord('A'), ord('Z') = 65, 90
        x = [ chr(randint(65,90)) for _ in range(n)]
        return "".join(x)
    
    def random_digits(self,n) -> int:
        assert n >= 1
        return randint(10**(n-1), 10**(n)-1) 
        
    @property
    def name(self):
        num_char, num_dig = 2, 3
        return self.random_letter(num_char)+str(self.random_digits(num_dig))

x = Robot()
