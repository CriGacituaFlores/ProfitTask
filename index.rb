require_relative 'stock.rb'
require_relative 'portfolio.rb'
require "test/unit"

class TestPortfolio < Test::Unit::TestCase

  def test_simple
    firstStockPrice = [
      {"date" => "2015-01-01", "val" => 10000},
      {"date" => "2016-01-01", "val" => 9000},
      {"date" => "2017-01-01", "val" => 13500},
      {"date" => "2018-01-01", "val" => 12000},
    ]

    secondStockPrice = [
      {"date" => "2015-01-01", "val" => 45000},
      {"date" => "2016-01-01", "val" => 40000},
      {"date" => "2017-01-01", "val" => 85000},
      {"date" => "2018-01-01", "val" => 80000},
    ]

    firstStock = Stock.new(firstStockPrice)
    secondStock = Stock.new(secondStockPrice)
    portfolio = Portfolio.new([firstStock, secondStock])

    #Should return a positive profit
    assert_equal(37000, portfolio.profit('2015-01-01','2018-01-01'))
    
    #Should return a negative profit
    assert_equal(-6000, portfolio.profit('2015-01-01','2016-01-01'))
  
    #Should return false because the starting is greater than the ending
    assert_equal(false, portfolio.profit('2016-01-01','2015-01-01'))

    #Should return 0 because the dates are the same
    assert_equal(0, portfolio.profit('2015-01-01','2015-01-01'))

    #Should return -10.9
    assert_equal(-10.9, portfolio.profit('2015-01-01','2016-01-01', true))
  end

end
