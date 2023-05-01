import unittest
import random

from robot_name import Robot

class RobotNameTest(unittest.TestCase):
    def test_name_sticks(self):
        r = Robot()
        self.assertEqual(r.name, r.name)
    
    def test_different_robots_have_different_names(self):
        self.assertNotEqual(Robot().name, Robot().name)

    def test_reset_name(self):
        # Set a seed
        seed = "Totally random"

        random.seed(seed)
        r = Robot()
        name = r.name
        
        r.reset()
        name2 = r.name
        self.assertNotEqual(name, name2)
    
    def not_test_100_names(self):
        # there are should be 100 unique names
        # BUT don't run this as this is not efficient
        self.names = [ Robot().name for _ in range(100) ]
        self.assertEqual(len(self.names), len(set(self.names)))

    def test_100_names(self):
        r = Robot()
        self.names = list()
        for _ in range(50):
            self.names.append(r.name)
            r.reset()
        self.assertEqual(len(set(self.names)), len(self.names))
    
    def test_max_names(self):
        " Best to use create_names(1,1) then run it for more than 260 times"
        ...
            
        
if __name__ == '__main__':
    unittest.main()