count = 99
loop do
  puts "#{count} bottle#{"s" unless count == 1} of beer on the wall. #{count} bottle#{"s" if count != 1} of beer. You take 1 down and pass it around #{count -= 1} bottle#{"s" if count != 1} of beer on the wall."
until count == 0
puts "#{count} bottles of beer on the wall. #{count} bottles of beer. So sad. No beer"
