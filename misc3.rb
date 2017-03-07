def countdown(num)
  if num == 0
    puts "Done"
  else
    puts num
    countdown(num - 1)
  end
end

countdown(10)

# arr = [1,2,3]
#
# begin
# puts arr.sum
# rescue NoMethodError => error
#   puts error
# end
#
# puts arr
