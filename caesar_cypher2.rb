def filter_by_95 number
  if number > 95
    return number % 95
  else
    return number
  end
end
#shifts char c by given num up to a certain num, new_ord range 32-126
def next_char c, number
  new_ord = c.ord + filter_by_95(number)
  if new_ord > 126
    new_ord -= (126 - 31)
  end
  return new_ord.chr
end

#shifts char c back by given num up to a certain num, new_ord range 32-126
def prev_char c, number
  new_ord = c.ord - filter_by_95(number)
  if new_ord < 32
    new_ord += (126 - 31)
  end
  return new_ord.chr
end

def encryption phrase, number
  encrypted_phrase = ""
  phrase.split("").each do |letter|
    letter = next_char(letter, number)
    encrypted_phrase << letter
  end
  return encrypted_phrase
end

def decryption code, number
  decrypted_code = ""
  code.split("").each do |letter|
    letter = prev_char(letter, number)
    decrypted_code << letter
  end
  return decrypted_code
end

#------------------------------------------------------------------------------------
puts "A Caesar Cipher is a simple encryption method implemented by shifting the characters down a certain number"
puts "Please enter a short phrase to be encrypted via a Caesar Cipher"
phrase = gets.chomp
puts
puts "By how many characters would you like to shift your phrase?"
while true
  number = gets.chomp
  if number.to_i % 95 == 0
    puts "Please enter a number other than 0 or a multiple of 95."
    puts "Using these values would result in an unchanged phrase"
  elsif number.to_i.to_s == number
    number = number.to_i
    break
  else
    puts "Please enter a number with no spaces"
  end
end

code = encryption phrase, number
puts
puts "Your encrypted message is:"
puts code
puts
puts "Would you like to decrypt your message?"

while true
  yes_no = gets.chomp.downcase
  if yes_no == "yes"
    break
  elsif yes_no == "no"
    puts "Closing program..."
    exit
  else
    puts "Please enter yes or no"
  end
end

while true
  while true
    puts
    puts "Please enter the cypher key used to encrypt your message"
    number = gets.chomp
    if number.to_i.to_s == number
      number = number.to_i
      break
    else
      puts "Please enter a number with no spaces"
    end
  end

  orig_phrase = decryption code, number
  puts
  puts "Your decrypted message is:"
  puts orig_phrase
  puts
  puts "Was this your message?"
  while true
    yes_no = gets.chomp.downcase
    if yes_no == "yes"
      puts "Closing program..."
      exit
    elsif yes_no == "no"
      break
    else
      puts "Please enter yes or no"
    end
  end
  puts
  puts "Would you like another chance to decrypt the message?"
  while true
    yes_no = gets.chomp.downcase
    if yes_no == "yes"
      break
    elsif yes_no == "no"
      puts "Closing program..."
      exit
    else
      puts "Please enter yes or no"
    end
  end
end
