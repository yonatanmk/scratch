# +1 for each 10-A
# -1 for each 2-6

cards_remaining = {
  "2" => 4,
  "3" => 4,
  "4" => 4,
  "5" => 4,
  "6" => 4,
  "7" => 4,
  "8" => 4,
  "9" => 4,
  "10" => 0,
  "J" => 4,
  "Q" => 4,
  "K" => 4,
  "A" => 4,
}



def deck_remaining cards_remaining
  counter = 0
  cards_remaining.each do |x, y|
    counter += y
  end
  return counter
end

puts deck_remaining cards_remaining
