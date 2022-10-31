#!/usr/bin/env python3

import sys
import string

def filterwords():
  if len(sys.argv) != 3:
    print("Usage: <List> <length>")
    return
  try:
    num = int(sys.argv[2])
    # removes all punctuation
    nopunc = sys.argv[1].translate(str.maketrans('', '', string.punctuation))
    splitted_words = nopunc.split(' ')
    filtered = filter(lambda word: len(word) > num, splitted_words)
    print(list(filtered))
  except ValueError:
    print('This is not an integer')
    return
filterwords()