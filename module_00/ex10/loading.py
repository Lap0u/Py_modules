#!/usr/bin/env python3

import time

start = time.time()

def getEta(nums, pos):
  if (pos != 0):
    avg = (time.time() - start) / pos
    return round(avg * ((len(nums) - pos)), 2)
  else:
    return 'None'

def getTotal(nums, pos):
  return (f'{pos}/{len(nums)}')

def getElapsed():
  return (round((time.time() - start), 2))

def printLoading(total, eta, elapsed, percent):
  if (percent == 0):
    equals = ''
  else:
    equals = '=' * int(percent * 20 / 100)
  space = ' ' * (20 - len(equals))
  bar = '[' + equals + space + '>]'
  print(f'ETA: {eta:.2f}s [{percent:.2f}%]{bar} {total} | elapsed time {elapsed:.2f}s', end='\r')

def ft_progress(nums):
  for elem in nums:
    pos = nums.index(elem) + 1
    elapsed = getElapsed()
    eta = getEta(nums, pos)
    total = getTotal(nums, pos)
    percent = round(pos * 100 / len(nums), 2)
    printLoading(total, eta, elapsed, percent)

    yield elem


# def test():
# 	listy = range(3333)
# 	ret = 0
# 	for elem in ft_progress(listy):
# 		ret += elem
# 		time.sleep(0.005)
# 	print()
# 	print(ret)

# secondary test

def test():
  listy = range(1000)
  ret = 0
  for elem in ft_progress(listy):
    ret += (elem + 3) % 5
    time.sleep(0.01)
  print()
  print(ret)

test()