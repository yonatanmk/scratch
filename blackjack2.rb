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

class Player
  attr_accessor :name, :money, :wager, :wager_count, :hand_list

  def initialize name, money
    self.name = name
    self.wager = nil
    self.wager_count = 0
    self.hand_list = [[], [], [], []]
    self.money = money
  end

  def new_hand card1, card2
    self.hand_list[0] = [card1, card2]
  end

  def hit_me hand, card
    hand << card
  end

  def hand_total hand
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

  def check_split hand
    if hand.length > 2
      return false
    elsif hand[0] == hand[1]
      return true
    elsif ["10", "J", "Q", "K"].include? hand[0] and ["10", "J", "Q", "K"].include? hand[1]
      return true
    else
      return false
    end
  end

  def hand_number hand
    if self.hand_list[1] == []
    elsif self.hand_list.index(hand) == 0
      return "1st "
    elsif self.hand_list.index(hand) == 1
      return "2nd "
    elsif self.hand_list.index(hand) == 2
      return "3rd "
    else
      return "4th "
    end
  end

  def get_player_action hand
    while true
      player_action = gets.chomp.downcase
      if player_action == "1" or player_action == "hit me"
        return "1"
        break
      elsif player_action == "2" or player_action == "stay"
        return "2"
        break
      elsif player_action == "3" or player_action == "split"
        if self.check_split hand
          if (self.wager * (wager_count + 1)) > self.money
            puts "You cannot afford to split your hand."
            puts "Please select option 1 or 2."
          else
            return "3"
            break
          end
        else
          puts "Please select option 1 or 2."
        end
      else
        puts "Please select option 1 or 2." if !self.check_split hand
        puts "Please select option 1, 2, or 3." if self.check_split hand
      end
    end
  end

  def split_hand hand
    self.hand_list[self.hand_list.index(hand) + 1] << hand.pop
  end

  def compare_hands player_hand, dealer_hand
    if player_hand > 21
      self.money -= self.wager
      return "#{self.name}'s hand is over 21. #{self.name} loses $#{self.wager}."
    elsif  player_hand == dealer_hand
      return "It's a tie! All wagers will be returned."
    elsif player_hand > dealer_hand
      self.money += self.wager
      return "#{self.name}'s hand beats the dealer's hand. #{self.name} wins $#{self.wager}."
    else
      self.money -= self.wager
      return "#{self.name}'s hand loses to the dealer's hand. #{self.name} loses $#{self.wager}."
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
#_______________________________________________________
def replay
  while true
    puts "Do you want to play another round? (yes or no)"
    play_again_answer = gets.chomp.downcase
    puts
    if play_again_answer == "y" || play_again_answer == "yes"
      puts "Starting a new game..."
      return true
    elsif play_again_answer == "n" || play_again_answer == "no"
      puts "Ending the game..."
      return false
    else
      puts "Please only enter yes or no."
    end
  end
end

#_______________________________________________________
deck = Deck.new

system "clear"

puts "Welcome to Blackjack!"
puts
puts "What is your name?"
player = Player.new gets.chomp, 100
puts

while true
  system "clear"

  if (deck.deck_remaining deck.cards_remaining) < 13
    deck = Deck.new
    puts "The deck has been reshuffled."
  end

  puts "There are currently #{deck.deck_remaining deck.cards_remaining} cards in the deck."
  puts "The current running card count is #{deck.card_count deck.cards_remaining}."

  player.new_hand deck.draw_card, deck.draw_card               #change for debugging
  dealer = Dealer.new deck.draw_card                            #change for debugging
  d_over_21 = false
  sleep_counter = false

  puts "You have $#{player.money}."
  player.get_wager
  player.wager_count = 1
  puts "You bet $#{player.wager}."
  sleep(0.5)

  player.hand_list.each do |hand|
    unless hand == []
      while true
        sleep(0.5) if sleep_counter
        sleep_counter = true
        hand << deck.draw_card if hand.length == 1
        puts
        puts "Your #{player.hand_number hand}hand is:"
        print hand
        puts " Total = #{(player.hand_total hand)}"
        if (player.hand_total hand) == 21
          puts
          puts "BLACKJACK!"
          sleep(0.5)
          break
        elsif (player.hand_total hand) > 21
          puts "Oops. You went over 21. #{player.name} loses this hand!"
          sleep(0.5)
          break
        else
          puts "Your dealer has:"
          print dealer.hand
          puts puts
          puts "What would you like to do?"
          puts "1. Hit Me"
          puts "2. Stay"
          puts "3. Split" if (player.check_split hand)

          player_action = player.get_player_action hand

          if player_action == "1"
            puts "You have decided to hit."
            player.hit_me hand, deck.draw_card
          elsif player_action == "3"
            puts "You decide to split your hand and add $#{player.wager} to your wager"
            player.split_hand hand
            player.wager_count += 1
            puts player.wager_count
          else
            puts "You have decided to stay."
            sleep(0.5)
            break
          end
        end
      end
    end
  end

  puts
  dealer.hit_me deck.draw_card
  puts "The dealer's second card is #{dealer.hand[1]}."
  print dealer.hand
  puts " Total = #{dealer.hand_total}."

  while true
    if dealer.hand_total == 21
      puts
      puts "BLACKJACK!"
      sleep(0.5)
      break
    elsif dealer.hand_total > 21
      puts "The dealer went over 21."
      puts "#{player.name} wins!"
      d_over_21 = true
      sleep(0.5)
      break
    elsif dealer.hand_total < 17
      puts "The dealer hits."
      sleep(0.5)
      dealer.hit_me deck.draw_card
    else
      puts "The dealer stays."
      sleep(0.5)
      break
    end
    print dealer.hand
    puts " Total = #{dealer.hand_total}."
  end

  puts
  puts "Final score:"
  print "Dealer's hand: #{dealer.hand}"
  puts " Total = #{dealer.hand_total}"
  puts
  if d_over_21
    puts "The dealer went over 21. All remaining hands under 21 win. All hands above 21 still lose."
    puts "Your hand#{"s" if player.hand_list[1] != []}:"
    player.hand_list.each do |hand|
      unless hand == []
        print hand
        puts " Total = #{player.hand_total hand}."            #format with tabs to make look nicer
        if (player.hand_total hand) > 21
          puts "LOSE. -$#{player.wager}"
          player.money -= player.wager
        else
          puts "WIN. +$#{player.wager}"
          player.money += player.wager
        end
      end
    end
  else
    puts "Your hand#{"s" if player.hand_list[1] != []}:"
    player.hand_list.each do |hand|
      unless hand == []
        print hand
        puts " Total = #{player.hand_total hand}"
        puts player.compare_hands (player.hand_total hand), dealer.hand_total
        puts
      end
    end
  end

  puts "#{player.name} currently has $#{player.money}."

  if replay
    player.hand_list = [[], [], [], []]
  else
    break
  end

end
