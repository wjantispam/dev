#!/usr/bin/env python3

import functools
import shutil

import pytest

from unittest import mock


@functools.lru_cache(maxsize=1)
def get_default_version() -> str:
    """Return the default language version for ruby.

    - if `ruby` and `gem` executables are both globally available: `system`
    - otherwise: `default`
    """
    if shutil.which('ruby') and shutil.which('gem'):
        return 'system'
    else:
        return 'default'


@pytest.fixture
def clear_lru_cache():
    get_default_version.cache_clear()
    yield
    get_default_version.cache_clear()


@pytest.mark.usefixtures('clear_lru_cache')
def test_neither_ruby_nor_gem_exist():
    with mock.patch.object(shutil, 'which', return_value=None):
        assert get_default_version() == 'default'


@pytest.mark.usefixtures('clear_lru_cache')
def test_both_ruby_and_gem_exist():
    with mock.patch.object(shutil, 'which', return_value='/some/exe'):
        assert get_default_version() == 'system'
