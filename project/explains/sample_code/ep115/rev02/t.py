import re


pattern = re.compile('foo')


match = pattern.match('food')
print(match.group())
