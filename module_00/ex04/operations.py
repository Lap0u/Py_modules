#!/usr/bin/env python3

import sys

if len(sys.argv) == 1:
  sys.exit('Usage: operations.py <number> <number>')
if len(sys.argv) != 3:
	sys.exit('Expecting two arguments only')
try:
  lhs = int(sys.argv[1])
  rhs = int(sys.argv[2])
  print(f'Sum: {lhs + rhs}')
  print(f'Difference: {lhs + rhs}')
  print(f'Product: {lhs * rhs}')
  if (rhs == 0):
    print('ERROR (division by zero)')
  else:
    print(f'Quotient: {lhs / rhs}')
  if (rhs == 0):
    print('ERROR (modulo by zero)')
  else:
    print(f'Remainder: {lhs % rhs}')

except ValueError as ve:
  print ('Only numbers are accepted')