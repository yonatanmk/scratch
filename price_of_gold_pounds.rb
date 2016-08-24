pounds = 7 #gets.chomp.to_f

def price_of_gold_pounds pounds
    price = pounds * 373.2 / 1000 * 1336
    puts "#{pounds} pounds of gold is equal to #{pounds * 373.2 / 1000} kilograms of gold"
    puts "#{pounds} pounds of gold is worth $#{(pounds * 373.2 / 1000 * 1336).round(2)}"
end

price_of_gold_pounds pounds
