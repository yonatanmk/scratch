while true
  number = gets.chomp
  if number == "0" or number == "95"
    puts "Please enter a number other than 0 or 95."
    puts "Using these values would result in an unchanged phrase"
  elsif number.to_i.to_s == number
    puts "this is a good value"
    break
  else
    puts "Please enter a number with no spaces"
  end
end
