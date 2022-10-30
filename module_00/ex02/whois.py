#!/usr/bin/env python3

import sys

if (len(sys.argv) != 2):
  sys.exit('Usage: whois.py 42')
try:
# throw exception if not integer
  val = int(sys.argv[1])
  if val == 0:
    print('I\'m zero')
  elif val % 2 == 1:
    print('I\'m odd')
  else:
    print('I\'m even')
# catch exception if not integer
except ValueError as ve:
  print(f'{sys.argv[1]} is not a valid integer')
  