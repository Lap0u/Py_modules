#!/usr/bin/env python3

import sys

MORSE_CODE_DICT = {
    "A": ".-",
    "B": "-...",
    "C": "-.-.",
    "D": "-..",
    "E": ".",
    "F": "..-.",
    "G": "--.",
    "H": "....",
    "I": "..",
    "J": ".---",
    "K": "-.-",
    "L": ".-..",
    "M": "--",
    "N": "-.",
    "O": "---",
    "P": ".--.",
    "Q": "--.-",
    "R": ".-.",
    "S": "...",
    "T": "-",
    "U": "..-",
    "V": "...-",
    "W": ".--",
    "X": "-..-",
    "Y": "-.--",
    "Z": "--..",
    "1": ".----",
    "2": "..---",
    "3": "...--",
    "4": "....-",
    "5": ".....",
    "6": "-....",
    "7": "--...",
    "8": "---..",
    "9": "----.",
    "0": "-----",
    " ": "/",
}

def sos():
  joined = ' '.join(sys.argv[1:]).upper()
  translated = ''
  for letter in joined:
    if MORSE_CODE_DICT.get(letter) != None:
      translated += MORSE_CODE_DICT[letter]
      translated += ' '
    else:
      print (f'{letter} is not supported by morse code')
      return
	# print without last space
  print(translated[:-1])

if len(sys.argv) < 2:
  print('Usage: sos.py <string>')
sos()

