import sys


print('this goes to stdout')

sys.stdout.write('this also goes to stdout\n')

sys.stdout.flush()

print('this goes to stderr', file=sys.stderr)

sys.stderr.write('this also goes to stderr\n')
