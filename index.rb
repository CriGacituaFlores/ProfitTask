require_relative 'stock.rb'
require_relative 'portfolio.rb'


firstStockPrice = [
  {"date" => "2012-10-10", "val" => 4000},
  {"date" => "2012-10-11", "val" => 5000},
  {"date" => "2012-10-12", "val" => 6000},
  {"date" => "2012-10-13", "val" => 7000}
]

firstStock = Stock.new(firstStockPrice)

secondStockPrice = [
  {"date" => "2012-10-10", "val" => 8000},
  {"date" => "2012-10-11", "val" => 9000},
  {"date" => "2012-10-12", "val" => 10000},
  {"date" => "2012-10-13", "val" => 11000}
]

secondStock = Stock.new(secondStockPrice)

thirdStockPrice = [
  {"date" => "2012-10-10", "val" => 12000},
  {"date" => "2012-10-11", "val" => 13000},
  {"date" => "2012-10-12", "val" => 14000},
  {"date" => "2012-10-13", "val" => 15000}
]

thirdStock = Stock.new(thirdStockPrice)

portfolio = Portfolio.new([firstStock, secondStock, thirdStock])

portfolio.profit('2012-10-10','2012-10-11')
