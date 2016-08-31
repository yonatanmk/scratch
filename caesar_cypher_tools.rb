def numsymfilter
  num_sym = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '~', '`', '!', '@', '#', '$', '%', '^', '&', '*',
    '(', ')', '-', '_', '=', '+', '[', ']', '{', '}', '|', '#', '\\', ':', ';', '<', '>', ',', '.', '?',
    '/', '\'', "\""]
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

def letter_symbol_filter
  while true
    number = gets.chomp
    if number == "0"
      puts "You cannot enter 0"
    elsif number.to_i.to_s == number
      break
    else
      puts "Please enter a number with no spaces"
    end
  end
  return number.to_i
end

def filter_by_52 number
  if number > 52
    return number % 52
  else
    return number
  end
end

def filter_by_95 number
  if number > 95
    return number % 95
  else
    return number
  end
end

def gap_correct number
  if number < 27
    return number + 64
  else
    return number + 70
  end
end

#shifts char c by given num up to a certain num, new_ord range 32-126
def next_char c, number
    new_ord = c.ord + number
    if new_ord > 126 + 95 * 4
      print "level6 "
      new_ord -= (630 - 31 * 5)
    elsif new_ord > 126 + 95 * 3
      print "level5 "
      new_ord -= (504 - 31 * 4)
    elsif new_ord > 126 + 95 * 2
      print "level4 "
      new_ord -= (378 - 31 * 3)
    elsif new_ord > 126 + 95
      print "level3 "
      new_ord -= (252 - 31 * 2) #
    elsif new_ord > 126
      print "level2 "
      new_ord -= (126 - 31)
    else
      print "level1 "
    end
    #puts c
    #puts c.ord
    #puts c.ord + number
    #puts new_ord
    puts new_ord.chr
    return new_ord.chr
end
#__________________________
#only caps 65-90
#lowercase 97-122


number = 103 #letter_symbol_filter

puts (gap_correct filter_by_52 number).chr

(1..500).each do |x|
  next_char "A", x
end
