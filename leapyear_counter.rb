puts "Please enter a starting year"
start_year = gets.chomp.to_i

while true
    number = gets.chomp
    if number.to_i.to_s == number
        break
    else
        puts "Please enter a number with no spaces"
    end
end

puts "Please enter an ending year"
end_year = gets.chomp.to_i


year_list = []
year_list_2 = []
(start_year..end_year).each do |year|
  year_list << year
end

year_list.each do |year|
  if year % 400 == 0
    puts "#{year} is divisible by 400"
    year_list_2 << year
  elsif year % 100 == 0
  elsif  year % 4 == 0
    year_list_2 << year
  end
end

puts "These years are leap years between #{start_year} and #{end_year}"
puts year_list_2
