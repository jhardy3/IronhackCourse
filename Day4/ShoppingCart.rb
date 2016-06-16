
class ShoppingCart

  def initialize(items)
    @items = items
  end

  def add_item(item)
    @items[item][:total] += 1
  end

  def total
    total = 0
    for item in @items.values do
      total += item[:price].seasonal_price.to_i * item[:total].to_i
    end
    puts total
  end
end

class Price
  attr_reader :spring_price, :summer_price, :autumn_price, :winter_price

  def initialize(spring_price, summer_price, autumn_price, winter_price)
    @spring_price = spring_price
    @summer_price = summer_price
    @autumn_price = autumn_price
    @winter_price = winter_price
    @season = "SP"
  end

  def seasonal_price
    case @season
    when "SP" then @spring_price
    when "SU" then @summer_price
    when "AU" then @autumn_price
    when "WI" then @winter_price
    end
  end
end

class WatermelonPrice < Price
  def initialize(spring_price, summer_price, autumn_price, winter_price, sunday)
    @spring_price = spring_price
    @summer_price = summer_price
    @autumn_price = autumn_price
    @winter_price = winter_price
    if sunday
      @spring_price = spring_price * 2
      @summer_price = summer_price * 2
      @autumn_price = autumn_price * 2
      @winter_price = winter_price * 2
    end
  end
end

apple_price = Price.new(10,10,15,12)
orange_price = Price.new(5,2,5,5)
grape_price = Price.new(15,15,15,15)
banana_price = Price.new(20,20,20,21)
watermelon_price = WatermelonPrice.new(50,50,50,50,100)

items = {
  :apples  =>    {:price => apple_price, :total => 0},
  :oranges   =>  {:price => orange_price, :total => 0},
  :grapes   =>   {:price => grape_price, :total => 0},
  :banana    =>  {:price => banana_price, :total => 0},
  :watermelon => {:price => watermelon_price, :total => 0}
}

shopping_cart = ShoppingCart.new(items)

shopping_cart.add_item :apples
shopping_cart.add_item :apples
shopping_cart.add_item :banana
shopping_cart.add_item :banana
shopping_cart.total
