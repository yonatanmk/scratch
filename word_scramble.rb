puts "Please enter a word to be scrambled"

a = gets.chomp

puts a.downcase.chars.shuffle.join.capitalize
