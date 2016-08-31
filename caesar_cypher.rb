def prev_char(c)
    (c.ord - 1).chr
end

def encryption phrase, number
    encrypted_phrase = ""
    phrase.split("").each do |letter|
        for i in 1..number
            letter = letter.next
        end
        encrypted_phrase << letter
    end
    return encrypted_phrase
end

def decryption code, number
    decrypted_code = ""
    code.split("").each do |letter|
        for i in 1..number
            letter = prev_char(letter)
        end
        decrypted_code << letter
    end
    return decrypted_code
end

#bonus
% 52
make sure encrypted string contains only letters
only caps 65-90
lowercase 97-122
#------------------------------------------------------------------------------------
puts "A Caesar Cipher is a simple encryption method implemented by shifting the characters down a certain number"
puts "Please enter a short phrase to be encrypted via a Caesar Cipher"
phrase = gets.chomp
puts
puts "By how many characters would you like to shift your phrase?"
while true
    number = gets.chomp
    if number.to_i.to_s == number
        break
    else
        puts "Please enter a number with no spaces"
    end
end
number = number.to_i
code = encryption phrase, number
puts
puts "Your encrypted message is:"
puts code
puts
puts "Would you like to decrypt your message?"

while true
    decrypt = gets.chomp.downcase
    if decrypt == "yes"
        break
    elsif decrypt == "no"
        exit
    else
        puts "Please enter yes or no"
    end
end

orig_phrase = decryption code, number
puts
puts "Your decrypted message is:"
puts orig_phrase
