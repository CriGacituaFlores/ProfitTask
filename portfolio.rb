class Portfolio
  require 'date'

  def initialize(stocks = [])
    @stocks = stocks
  end

  def profit(initial_date, final_date, isAnnualized = false)
    profit = 0

    if(Date.parse(initial_date) > Date.parse(final_date))
      return false
    end

    totalBeginningPrice = 0
    totalFinishPrice = 0

    @stocks.each do |stock|
      startPrice = stock.price(initial_date)
      endPrice = stock.price(final_date)

      if(startPrice != false && endPrice != false)
        profit += endPrice - startPrice
      else
        return false
      end

      totalBeginningPrice += startPrice
      totalFinishPrice += endPrice

     
    end

    if isAnnualized
      dateStart = Date.parse(initial_date)
      endStart = Date.parse(final_date)
      quantityYears = ((endStart - dateStart) / 365).round
      annualizedResult = ((totalFinishPrice.to_f / totalBeginningPrice.to_f) ** (1.to_f/quantityYears.to_f).to_f) -1
      return (annualizedResult * 100).round(1)
    end

    return profit
  end

end