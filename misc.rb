arr = ["A", "10", "A", "9"]

# arr.sort! do |x, _|
#   x == "A" ? 1 : -1
# end

arr.sort! do |x, y|
  if x == "A"
    1
  else
    -1
  end
end

print arr
puts

# puts "A" <=> "B"
