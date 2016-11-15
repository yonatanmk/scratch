#sum numbers
numbers = [3,2,1,6,5,4,7]

total = numbers.inject(0) do |sum,num|
  sum += num
end

puts total

# find longest word
animals = ["dog", "horse", "wolf", "turkey", "elephant"]
longest = animals.inject do |longest, animal|
  if longest.length > animal.length
    longest
  else
    animal
  end
end

puts longest
