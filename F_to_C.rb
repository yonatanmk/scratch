
def F_to_C fahrenheit
     return (fahrenheit - 32) * 5 / 9
end

puts "Please enter a temperature in Fahrenheit to be converted into Celsius"
fahrenheit = gets.chomp.to_i
puts fahrenheit.to_s + " degrees in Celsius is " + F_to_C(fahrenheit).to_s + " degrees."
