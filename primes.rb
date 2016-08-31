(2..100).each do |number|
  prime = true
  (2...number).each do |i|
    if number % i == 0
      prime = false
    end
  end
  puts number if prime
end
