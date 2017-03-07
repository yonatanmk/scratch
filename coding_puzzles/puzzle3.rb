# def closestNumbers(numbers)
#     diffs = []
#     pairs = {}
#     numbers.each do |x|
#         numbers.each do |y|
#             diff = (x - y).abs
#             pair = [x,y].sort{ |a,b| a<=>b }.join(" ")
#             if diff != 0
#               if diffs.include?(diff)
#                 if !pairs[diff].include?(pair)
#                   pairs[diff].push(pair)
#                   pairs[diff].sort! do |a,b|
#                     a = a.split(" ").first.to_i
#                     b = b.split(" ").first.to_i
#                     a<=>b
#                   end
#                 end
#               else
#                 diffs.push(diff)
#                 pairs[diff] = [pair]
#               end
#             end
#         end
#     end
#
#     diffs = diffs.sort{ |a,b| a<=>b }
#     puts pairs[diffs.first]
# end

def closestNumbers(numbers)
  arr = numbers.sort{|a, b| a <=> b}
  min_diff = 99999999999999;
  (0..arr.length-2).each do |i|
      if arr[i + 1] - arr[i] > 0
        diff = arr[i + 1] - arr[i]
        min_diff = diff if(diff < min_diff)
      end
  end
  pairs = []
  (0..arr.length-2).each do |i|
    diff = arr[i + 1] - arr[i]
    if(diff == min_diff)
      pairs << "#{arr[i]} #{arr[i+1]}"
    end
  end
  puts pairs
end


arr = [4,4,-2,-1,3]
closestNumbers(arr)
