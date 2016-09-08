class Deck
  attr_accessor :cards_remaining

  def initialize    #Using 2 decks
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
      return "+#{running_count}"
    else
      return "#{running_count}"
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

class Player
  attr_accessor :name, :hand, :money, :wager

  def initialize name, money
    self.name = name
    self.money = money
    self.wager = nil
    self.hand = ["empty"]
  end

  def new_hand card1, card2
    self.hand = [card1, card2]
  end

  def hit_me card
    self.hand << card
  end

  def hand_total
    total = 0
    self.hand.each do |x|
      if x == "A"
        total += 1
      elsif x == "J" or x == "Q" or x == "K"
        total += 10
      else
        total += x.to_i
      end
    end
    return total
  end

  def get_wager
    while true
      puts "How much would you like to wager?"
      wager = gets.chomp
      if wager.to_i.to_s == wager
        if wager.to_i < 5
          puts "The minimum wager is $5."
        elsif wager.to_i > self.money
          puts "You cannot afford that wager."
        else
          self.wager = wager.to_i
          break
        end
      else
        puts "Please enter a number with no symbols, spaces, or letters."
      end
    end
  end

end

class Dealer
  attr_accessor :hand

  def initialize card1
    self.hand = [card1]
  end

  def hit_me card
    hand << card
  end

  def hand_total
    total = 0
    hand.each do |x|
      if x == "A"
        total += 1
      elsif x == "J" or x == "Q" or x == "K"
        total += 10
      else
        total += x.to_i
      end
    end
    return total
  end

end
#_________________________________________________________________________________
deck = Deck.new
money = 100

player = Player.new "Yonatan", 100
player.new_hand deck.draw_card, deck.draw_card
dealer = Dealer.new deck.draw_card

puts player.money
puts player.wager
player.get_wager
puts player.wager.class
