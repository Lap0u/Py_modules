#!/usr/bin/env python3

kata = {
'Python': 'Guido van Rossum',
'Ruby': 'Yukihiro Matsumoto',
'PHP': 'Rasmus Lerdorf',
}

for key,value in kata.items():
  print(f'{key} was created by {value}')