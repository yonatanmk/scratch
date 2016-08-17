word = gets.downcase.chomp

puts word + " in pig latin is " + word[1...word.length] + word[0] + "ay"
