puts "Gimme a word to translate into pig latin!"
word = gets.downcase.chomp

puts word + " in pig latin is " + word[1...word.length].capitalize + word[0] + "ay"
