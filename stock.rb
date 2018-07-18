require_relative 'portfolio'

class Stock < Portfolio

  #Constructor
  def initialize(prices)
    @prices = prices
  end

  #Return the price if exists in the date
  def price(date)
    if self.show_prices().any? {|price| price["date"] == date}
      selected_price = @prices.map {|price| return price["val"] if price["date"] == date}
    else
      return false
    end
  end

  def show_prices()
    return @prices
  end

end