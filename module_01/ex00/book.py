import datetime
from recipe import Recipe
class Book:

	def __str__(self):
		str = f'This book is called {self.name}\
			\nIt was created at {self.creation_date.now()} and last updated at {self.last_update.now()}\
			\nIt contains the following recipes:\
			\n{self.recipes_list.values()}'
		return str
	# constructor
	def __init__(self, name):
		
		# str name 
		if not (isinstance(name, str)):
			raise ValueError(f'Excepted a string, got {name}')

		self.name = name
		self.creation_date = datetime.datetime.now()
		self.last_update = self.creation_date
		self.recipes_list = {"lunch" : list(), "dessert" : list(), "starter" : list()}

	def add_recipe(self, recipe):
		if not (isinstance(recipe, Recipe)):
			raise ValueError(f'Excepted a Recipe object, but got {recipe}')
		self.last_update = datetime.datetime.now()
		self.recipes_list[recipe.recipe_type].append(recipe)

	def get_recipe_by_name(self, name):
		print(name)
		for item in self.recipes_list.items():
			if (name in item):
					print(item)