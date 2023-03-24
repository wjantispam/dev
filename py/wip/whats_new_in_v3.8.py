from datetime import date    

# Assignment expressions / Walrus operator
# See https://peps.python.org/pep-0572/
a = range(15)
if (n := len(a)) > 10:
    print(f"List is too long({n} elements, expected <= 10)")


# f-strings support = for self-documenting expressions and debugging
user = 'eric_idle'
member_since = date(1975, 7, 31)
f'{user=} {member_since=}'

delta = date.today() - member_since
f'{user=!s}  {delta.days=:,d}'