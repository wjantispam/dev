#!/usr/bin/env python3
# Learning how to center (nice formatting)
import shutil


def main() -> int:
    width, _ = shutil.get_terminal_size()
    print(' setup '.center(width,'='))
    # print(' setup '.center(80,'='))
    print('....')
    print(' teardown '.center(width,'='))
    print('....')
    return 0

if __name__ == '__main__':
    exit(main())
