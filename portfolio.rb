class Portfolio
  require 'date'

  def initialize(stocks = [])
    @stocks = stocks
  end

  def profit(initial_date, final_date, isAnnualized = false)
    profit = 0

    if(Date.parse(initial_date) > Date.parse(final_date))
      puts "La fecha inicial no puede ser mayor a la fecha final"
      return false
    end

    totalStartPrice = 0
    totalEndPrice = 0

    @stocks.each do |stock|
      startPrice = stock.price(initial_date)
      endPrice = stock.price(final_date)

      if(startPrice != false && endPrice != false)
        profit += endPrice - startPrice
      else
        return false
      end

      totalStartPrice += startPrice
      totalEndPrice += endPrice

     
    end

    if isAnnualized
      dateStart = Date.parse(initial_date)
      endStart = Date.parse(final_date)
      years = ((endStart - dateStart) / 365).round
      annualizedResult = ((totalEndPrice.to_f / totalStartPrice.to_f) ** (1.to_f/years.to_f).to_f) -1
      return (annualizedResult * 100).round(1)
    end

    return profit
  end

end