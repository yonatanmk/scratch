
def C_to_F celsius
     return celsius * 9 / 5 + 32
end

puts "Please enter a temperature in Celsius to be converted into Fahrenheit"
celsius = gets.chomp.to_i
puts celsius.to_s + " degrees in Fahrenheit is " + C_to_F(celsius).to_s + " degrees."
