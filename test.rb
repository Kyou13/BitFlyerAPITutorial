require './getBoard.rb'
require './buy'
require './getBalance.rb'

while(1)
  current_price = get_price
  puts current_price

  buy_price = 1234750
  sell_price = 1300000
  if (current_price > sell_price) && (get_balance("BTC")["amount"] > 0.0001) 
    puts "Sell"
    order("SELL",sell_price,0.0001)
  elsif (current_price < buy_order) && (get_balance("JPY")["amount"] > 100)
    puts "Buy"
    order("BUY",buy_price,0.0001)
  else 
    puts "None"
  end
  sleep(1)
end
# buy_order('SELL','400','0.01')
#getbalance('JPY')
