puts "What is your name?"
name = gets.chomp

puts "How old are you?"
age = gets.chomp.to_i

birthyear = 2016 - age

puts name + " is " + age.to_s + " years old and was born in " + birthyear.to_s
