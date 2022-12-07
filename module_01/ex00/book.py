# recipe_type starter", "lunch" or "dessert"
# https://www.w3schools.com/python/python_classes.asp

class Recipe:
	def __init__(self, name, cooking_lvl, cooking_time, ingredients, recipe_type, description=""):
		if (isinstance(name, str) == False):
			print(f'{name} is not a string')
			return
		if (isinstance(cooking_lvl, int) == False or cooking_lvl > 5 or cooking_lvl < 1):
			print(f'{cooking_lvl} is not a valid level')
			return
		if (isinstance(cooking_time, int) == False or cooking_time < 0):
			print(f'{cooking_time} is not a valid cooking time')
			return
		self.name = name
		self.cooking_lvl = cooking_lvl
		self.cooking_time = cooking_time
		self.ingredients = ingredients
		self.recipe_type = recipe_type
		self.description = description

def test():
	me = Recipe("12",5,-0,"12","12","12",)

test()