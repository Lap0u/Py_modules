from book import Book
from recipe import Recipe

def test():
	book = Book("My book")
	cake_ingrdts = ["choco", "flour", "salt", "sugar", "eggs"]
	cake = Recipe("cake", 5, 30, cake_ingrdts, "dessert", "Very nice choco cake")
	cake2 = Recipe("cake2", 5, 30, cake_ingrdts, "dessert", "Very nice choco cake")
	book.add_recipe(cake)
	book.add_recipe(cake2)
	book.get_recipe_by_name('cake')

test()