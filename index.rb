require_relative 'stock.rb'
require_relative 'portfolio.rb'
require "test/unit"

class TestPortfolio < Test::Unit::TestCase

  def test_simple
    firstStockPrice = [
      {"date" => "2012-06-15", "val" => 120000},
      {"date" => "2013-06-15", "val" => 136000},
      {"date" => "2014-06-15", "val" => 169000},
      {"date" => "2015-06-15", "val" => 183000},
      {"date" => "2016-06-15", "val" => 164000},
      {"date" => "2017-06-15", "val" => 145000},
      {"date" => "2018-06-15", "val" => 126000}
    ]

    secondStockPrice = [
      {"date" => "2012-06-15", "val" => 90000},
      {"date" => "2013-06-15", "val" => 85000},
      {"date" => "2014-06-15", "val" => 88000},
      {"date" => "2015-06-15", "val" => 80000},
      {"date" => "2016-06-15", "val" => 72000},
      {"date" => "2017-06-15", "val" => 60000},
      {"date" => "2018-06-15", "val" => 45000}
    ]

    thirdStockPrice = [
      {"date" => "2012-06-15", "val" => 40000},
      {"date" => "2013-06-15", "val" => 50000},
      {"date" => "2014-06-15", "val" => 65000},
      {"date" => "2015-06-15", "val" => 85000},
      {"date" => "2016-06-15", "val" => 65000},
      {"date" => "2017-06-15", "val" => 50000},
      {"date" => "2018-06-15", "val" => 45000}
    ]

    firstStock = Stock.new(firstStockPrice)
    secondStock = Stock.new(secondStockPrice)
    thirdStock = Stock.new(thirdStockPrice)
    portfolio = Portfolio.new([firstStock, secondStock, thirdStock])

    #Should return a negative profit
    assert_equal(-34000, portfolio.profit('2012-06-15','2018-06-15'))
    
    #Should return a positive profit
    assert_equal(98000, portfolio.profit('2012-06-15','2015-06-15'))

    #Should return 0 because the dates are the same
    assert_equal(0, portfolio.profit('2015-06-15','2015-06-15'))

    #Should return false because the date not exist in the array
    assert_equal(false, portfolio.profit('2011-06-15','2015-06-15'))
  
    #Should return false because the starting is greater than the ending
    assert_equal(false, portfolio.profit('2018-06-15','2015-06-15'))

  end

end
