import contextlib


@contextlib.contextmanager
def ctx():
    print('before')
    try:
        yield
    finally:
        print('after')


@contextlib.contextmanager
def ctx2():
    print('before2')
    try:
        yield
    finally:
        print('after2')


class C:
    def __enter__(self):
        self.stack = contextlib.ExitStack()
        self.stack.enter_context(ctx())
        self.stack.enter_context(ctx2())

    def __exit__(self, tp, inst, tb):
        return self.stack.__exit__(tp, inst, tb)
