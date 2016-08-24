phrase = "1.99"

puts phrase.to_i.to_s
puts phrase.to_i.to_s == phrase

puts "A Caesar Cipher is a simple encryption method implemented by shifting the characters down a certain number"
puts "Please enter a short phrase to be encrypted via a Caesar Cipher"
phrase = gets.chomp
puts "By how many characters would you like to shift your phrase?"
while true
    number = gets.chomp
    if number.to_i.to_s == number
        break
    else
        puts "Please enter a number with no spaces"
    end
end

puts phrase
puts number
