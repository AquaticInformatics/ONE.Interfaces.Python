#!/usr/bin/env python

from __future__ import with_statement

from io import open
import os
import re
from unicodedata import name
try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup


NAME = 'one_interfaces'

def read_file(path, encoding='ascii'):
    with open(os.path.join(os.path.dirname(__file__), path),
              encoding=encoding) as fp:
        return fp.read()

def _get_version_match(content):
    # Search for lines of the form: # __version__ = 'ver'
    regex = r"^__version__ = ['\"]([^'\"]*)['\"]"
    version_match = re.search(regex, content, re.M)
    if version_match:
        return version_match.group(1)
    raise RuntimeError("Unable to find version string.")

def get_version(path):
    return _get_version_match(read_file(path))

setup(
    name=NAME,
    version=get_version(os.path.join(NAME, '__init__.py')),
    description='Python bindings for ONE.',
    long_description=read_file('README.md'),    
    keywords='ONE interfaces python',
    author='Aquatic Informatics',
    author_email='info@aquaticinformatics.com',
    maintainer='Aquatic Informatics',
    url='https://github.com/aquaticinformatics/one_interfaces',
    license='BSD',
    packages=[NAME],    
    python_requires='>=2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*, !=3.4.*',
    # see classifiers https://pypi.org/pypi?%3Aaction=list_classifiers
    classifiers=[
          'Development Status :: 3 - Alpha',
          'Intended Audience :: Developers',
          'Topic :: Software Development :: Libraries',
          'License :: OSI Approved :: MIT License',
          'Programming Language :: Python :: 3',
    ]
)
