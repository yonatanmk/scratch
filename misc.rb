class Deck
  attr_accessor :cards_remaining

  def initialize    #Using 2 decks
    self.cards_remaining = {
      "2" => 24,
      "3" => 24,
      "4" => 24,
      "5" => 24,
      "6" => 24,
      "7" => 24,
      "8" => 24,
      "9" => 24,
      "10" => 24,
      "J" => 24,
      "Q" => 24,
      "K" => 24,
      "A" => 24,
    }
  end

  def draw_card
    while true
      card_num = rand(1..13).to_s
      if card_num == "1"
        card_num = "A"
      elsif card_num == "11"
        card_num = "J"
      elsif card_num == "12"
        card_num = "Q"
      elsif card_num == "13"
        card_num = "K"
      end
      unless cards_remaining[card_num] == 0
        cards_remaining[card_num] -= 1
        return card_num
      end
    end
  end

  def card_count cards_remaining
    running_count = 0
    positive_card_values = ["10", "J", "Q", "K", "A"]
    cards_remaining.each do |x, y|
      if positive_card_values.include? x
        running_count += y
      elsif x.to_i <= 6
        running_count -= y
      end
    end
    if running_count > 0
      return "+#{(running_count.to_f / ((deck_remaining self.cards_remaining).to_f / 52)).round(2)}"
    else
      return "#{(running_count.to_f / ((deck_remaining self.cards_remaining).to_f / 52)).round(2)}"
    end
  end

  def deck_remaining cards_remaining
    counter = 0
    cards_remaining.each do |x, y|
      counter += y
    end
    return counter
  end

end
#__________________________________________________________
deck = Deck.new

puts deck.card_count deck.cards_remaining

puts deck.draw_card

puts deck.card_count deck.cards_remaining

puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining

puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
puts deck.draw_card

puts deck.card_count deck.cards_remaining
