require 'csv'
#________________________
# CSV basics
customers = CSV.read("/Users/yehonatanmeschede-krasa/Desktop/SIRubyClass/CSV_practice.csv") #import entire CSV file at once
print customers
puts

CSV.foreach("/Users/yehonatanmeschede-krasa/Desktop/SIRubyClass/CSV_practice.csv") do |row|
  puts row.inspect
end
#________________________
# Convert string to CSV
puts
a_string = "Dan,34\nMaria,55"
a_string = CSV.parse(a_string)
print a_string

puts
a_string2 = "Dan,344\nMaria,555"
a_string2 = CSV.parse(a_string2) {|row| puts row.inspect}
print a_string2
#________________________
# for SSV (semicolon separated values)
puts
a_string3 = "Dan;34\nMaria;55"
a_string3 = CSV.parse(a_string3, col_sep: ';')
print a_string3
#________________
# CSV manipulation
puts
puts

average_money_spent = []
CSV.foreach("/Users/yehonatanmeschede-krasa/Desktop/SIRubyClass/CSV_practice.csv", converters: :numeric) do |row|
  average_money_spent << row[2] / row[1]
end

print average_money_spent

#Using both SSV conversion and numeric conversion
# CSV.read('customers_separated_with_semicolons.csv', col_sep: ';', converters: :numeric)

#____________________________
puts
puts
customers = CSV.read("/Users/yehonatanmeschede-krasa/Desktop/SIRubyClass/CSV_practice.csv")
customers.each do |customer|
  customer << average_money_spent.shift
end

CSV.open("/Users/yehonatanmeschede-krasa/Desktop/SIRubyClass/CSV_practice2.csv", 'w') do |csv_object|
  customers.each do |row_array|
    csv_object << row_array
  end
end

puts "Hello"
puts
