#filters out numbers and symbols from user input

def numsymfilter
  num_sym = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '~', '`', '!', '@', '#', '$', '%', '^', '&', '*',
    '(', ')', '-', '_', '=', '+', '[', ']', '{', '}', '|', '#', '\\', ':', ';', '<', '>', ',', '.', '?',
    '/', '\'', "\"", " "]
  while true
    word = gets.chomp
    letter_check = true
    word.each_char do |x|
      if num_sym.include?(x)
        puts "Please only use upper and lowercase letters"
        letter_check = false
        break
      end
    end
    if letter_check == true
      break
    end
  end
  return word
end
#__________________________


puts numsymfilter
