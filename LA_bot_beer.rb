count = 99
while count > 0
  puts "#{count} bottle#{"s" unless count == 1} of beer on the wall. #{count} bottle#{"s" unless count == 1} of beer. You take 1 down and pass it around #{count -= 1} bottle#{"s" unless count == 1} of beer on the wall."
end
puts "#{count} bottles of beer on the wall. #{count} bottles of beer. So sad. No beer"
