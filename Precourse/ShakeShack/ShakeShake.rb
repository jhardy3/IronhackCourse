class Shake
	def initialize(price)
		@ingredients = []
		@base_price = price
	end

	def add_ingredient(ingredient)
		@ingredients.push(ingredient)
	end

	def price_of_milkshake
		total_price_of_milkshake = @base_price
		@ingredients.each do |ingredient|
			total_price_of_milkshake += ingredient.price
		end
		total_price_of_milkshake
end

class Ingredient

	attr_reader :name, :price

	def initalize(name, price)
		@name = name
		@price = price
	end
end

class ShakeShack

	def initalize
		@milkshake_list = []

	end

	def add_milk_shake(milkshake)
		@milkshake_list.push(milkshake)
	end

	def checkout_shakes
		checkout_price = 0
		@milkshake_list.each do |milkshake|
			checkout_price += milkshake.price_of_milkshake
		end
	end

end
