#!/usr/bin/env python3

# default definition
cookbook = {'sandwich' : {'Ingredients' : ['ham', 'bread', 'cheese', 'tomatoes'], 'meal' : 'lunch', 'prep_time' : 10},
            'cake' : {'Ingredients' : ['flour', 'sugar','eggs'], 'meal' : 'dessert', 'prep_time' : 60},
            'salad' : {'Ingredients' : ['avocado', 'arugula', 'tomatoes', 'spinach'], 'meal' : 'lunch', 'prep_time' : 15}}

def printRecipes():
  print(f'All availables recipes in the cookbook: \n {cookbook.keys()}')

def printDetails(recipe):
  obj = cookbook.get(recipe)
  ing = 'Ingredients'
  meal = 'meal'
  time = 'prep_time'
  if obj == None:
    print('This is not a known recipe')
    return
  print(f'Recipe for {recipe}:')
  print(f'\tIngredients list: {obj.get(ing)}')
  print(f'\tTo be eaten for {obj.get(meal)}.')
  print(f'\tTakes {obj.get(time)} minutes of cooking.')

def removeRecipe(recipe):
  if (cookbook.get(recipe) != None):
    cookbook.pop(recipe)
    print(f'New cookbook after removing {recipe}')
    printRecipes()
  else:
    print(f'{recipe} is not available in cookbook')

def addRecipe():
  # prevents CTRL+D
  try:
    name = input("Please enter recipe name\n")
    # repeats untill recipe name is new
    if cookbook.get(name) != None:
      print('Recipe already exists')
      return addRecipe()
    temp = ' '
    ingrdnts = []
    while (temp != ''):
      temp = input("Please enter ingredient\n")
      if (temp != ''):
        ingrdnts.append(temp)
    type = input("Please enter meal type\n")
    time = input("Please enter preparation time\n")
    prep = int(time)
    new_recipe = {name: {'Ingredients' : ingrdnts, 'meal': type, 'prep_time' : prep}}
    cookbook.update(new_recipe)
  except ValueError:
    print("Not a number")
  except EOFError:
    print("Pas comme ca Zinedine")

def listOptions():
  print('List of availables options:')
  print('\t1: Add a recipe')
  print('\t2: Delete a recipe')
  print('\t3: Print a recipe')
  print('\t4: Print the cookbook')
  print('\t5: Quit')

def useCookbook():
  print('Welcome to the python cookbook')
  listOptions()
  test = ''
  try:
    while (test != None):
      num = input('Please select a choice\n')
      if (num == '1'):
        addRecipe()
      elif (num == '2'):
        val = input('Please enter the recipe you want to delete\n')
        removeRecipe(val)
      elif (num == '3'):
        val = input('Please enter the recipe you want to see\n')
        printDetails(val)
      elif (num == '4'):
        for elem in cookbook:
          printDetails(elem)
      elif (num == '5'):
        print('Cookbook closed. Goodbye')
        return
      else:
        print('This is not a valid option')
        listOptions()
      print()

  except ValueError:
    print("Not a number")
  except EOFError:
    print("Pas comme ca Zinedine")

# main
useCookbook()
