#!/usr/bin/env python3

import sys

if len(sys.argv) < 2:
  sys.exit('Enter at least one argument')
# [1:] ignores first argument
#[::-1] reverse the string
print(' '.join(sys.argv[1:]).swapcase()[::-1])