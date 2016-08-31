#filters out symbols and letters from user input

def letter_symbol_filter
  while true
      number = gets.chomp
      if number.to_i.to_s == number
          break
      else
          puts "Please enter a number with no spaces"
      end
  end
  return number.to_i
end

puts letter_symbol_filter
