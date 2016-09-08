class Deck
  attr_accessor :cards_remaining

  def initialize
    self.cards_remaining = {
      "2" => 4,
      "3" => 4,
      "4" => 4,
      "5" => 4,
      "6" => 4,
      "7" => 4,
      "8" => 4,
      "9" => 4,
      "10" => 4,
      "J" => 4,
      "Q" => 4,
      "K" => 4,
      "A" => 4,
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

end
#_______________________________________________

deck = Deck.new

puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card
puts deck.draw_card

puts deck.cards_remaining

deck = deck = Deck.new

puts deck.cards_remaining
