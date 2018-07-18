class Portfolio
  require 'date'

  def initialize(stocks = [])
    @stocks = stocks
  end

  def profit(start_date, end_date, annualized = false)
    profit = 0

    if(Date.parse(start_date) > Date.parse(end_date))
      puts "La fecha inicial no puede ser mayor a la fecha final"
      return false
    end

    totalStartPrice = 0
    totalEndPrice = 0

    @stocks.each do |profit|
      startPrice = profit.price(start_date)
      endPrice = profit.price(end_date)
      
      if(startPrice != false && endPrice != false)
        profit = endPrice - startPrice
      else
        return false
      end

      totalStartPrice += startPrice
      totalEndPrice += endPrice

      puts totalStartPrice
      puts totalEndPrice
     
    end

    if annualized
      dateStart = Date.parse(start_date)
      endStart = Date.parse(end_date)
    end
  end

end