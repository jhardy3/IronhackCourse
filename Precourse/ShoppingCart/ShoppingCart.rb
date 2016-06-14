class ShoppingCart

	def initialize
		@items = []
	end

	def add_item(item) 
		@items.push(item)
	end

	def total_cart
		total = 0
		@items.each do |item|
			total += item.price
		end
        if @items.count >= 5
            return (total - (total * 0.1))
        end
		total
	end
end

class Item

	def initialize(name, price)
		@name = name
		@price = price
	end

	def price
		@price
	end
end

class Houseware < Item 

	def initialize(name, price)
		@name = name
		@price = price
	end


	def price
		if @price > 100 
			return_price = @price - @price * 0.05
			return_price
		else 
			@price
		end
	end

end

class Fruit < Item
	def initialize(name, price)
		@name = name
		@price = price
		@isWeekend = true
	end

	def price 
		if @isWeekend
			return_price = @price - @price * 0.1
			return_price
		else
			@price
		end
	end
end

shopping_cart = ShoppingCart.new

banana = Fruit.new("Banana", 10)
vaccuum = Houseware.new("Vaccuum", 150)
oj = Item.new("Orange Juice", 10)
rice = Item.new("Rice", 1)
anchovies = Item.new("Anchovies", 2)

shopping_cart.add_item(banana)
shopping_cart.add_item(vaccuum)
shopping_cart.add_item(oj)
shopping_cart.add_item(rice)
shopping_cart.add_item(anchovies)

puts shopping_cart.total_cart

