# recipe_type starter", "lunch" or "dessert"
# https://www.w3schools.com/python/python_classes.asp

class Recipe:
	# constructor
	def __init__(self, name, cooking_lvl, cooking_time, ingredients, recipe_type, description=""):
		recipe_list = ["lunch", "dessert"]
		
		# str name 
		if not (isinstance(name, str)):
			raise ValueError(f'Excepted a string, got {name}')

		# cooking_lvl int from 1 to 5 
		if not(isinstance(cooking_lvl, int) and cooking_lvl <= 5 and cooking_lvl >= 1):
			raise ValueError(f'Excepted an integer between 1 and 5, got {cooking_lvl}')
		
		# cooking_time int > 0 
		if not (isinstance(cooking_time, int) and cooking_time >= 0):
			raise ValueError(f'Excepted a positive integer, got {cooking_time}')

		# ingredients list of str 
		if not(all(isinstance(elem, str) for elem in ingredients)):
			raise ValueError(f'Excepted a list of strings, got {ingredients}')

		# description str 
		if not (isinstance(description, str)):
			raise ValueError(f'Excepted a string, got {description}')
		
		# recipe_type str and in list check
		if not (isinstance(recipe_type, str) and recipe_type in recipe_list):
			raise ValueError(f"Excepted a valid recipe_type(lunch or dessert), got {recipe_type}")
		self.name = name
		self.cooking_lvl = cooking_lvl
		self.cooking_time = cooking_time
		self.ingredients = ingredients
		self.recipe_type = recipe_type
		self.description = description

def test():
	try:
		me = Recipe("12",5,-0,"12","lunch")
	except ValueError as e:
		print(e)


test()