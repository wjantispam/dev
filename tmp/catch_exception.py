#!/usr/bin/env python3

def catch(tp):
    try:
        raise AssertionError('Hey Wei!!!')
    except tp as e:
        print(f'WJ caught {tp}: {e}')
    except Exception:
        print(f'WJ not caught {tp}')


catch(TypeError)
catch(AssertionError)
# Note they are in a tuple
catch((TypeError, AssertionError))

from typing import Type
def catch2(tp: Type[BaseException]) -> None:
    try:
        raise AssertionError('Hey Wei!!!')
    except tp as e:
        print(f'1: WJ caught {tp}: {e}')
    except Exception:
        print(f'1: WJ not caught {tp}')

catch2(TypeError)

