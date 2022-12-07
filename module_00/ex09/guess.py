#!/usr/bin/env python3

import random

welcome = 'This is an interactive guessing game! \nYou have to enter a number between 1 and 99 to find out the secret number.\nType \'exit\' to end the game.\nGood luck!'
firstTry = 'Congratulations! You got it on your first try!'
fourtyTwo = 'The answer to the ultimate question of life, the universe and everything is 42.'
ask = 'What\'s your guess between 1 and 99?\n'
high = 'Too high!'
low = 'Too low!'

def leave():
  print('Goodbye!')
def err():
  print('Not a valid number')

def generate():
  return random.randint(1, 99)

def endGame(answer, tries):
  if answer == 42:
    print(fourtyTwo)
  if tries == 1:
    print(firstTry)
  else:
    print(f'You got it in {tries} tries')

def guess():
  answer = -1
  tries = 0
  try:
    while 1:
      if answer == -1:
				# test special feature
        # answer = 42
        answer = generate()
      userInput = input(ask)
      tries += 1
      try:
        if (userInput == 'exit'):
          return leave()
        num = int(userInput)
        if num == answer:
          endGame(answer, tries)
          tries = 0
          answer = -1
        elif num < answer:
          print(low)
        else:
          print(high)
      except ValueError:
        err()
  except EOFError:
    return leave()
guess()