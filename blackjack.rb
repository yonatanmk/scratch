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
    self.wager = nil
    self.hand = ["empty"]
    self.money = money
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
#_______________________________________________________
def get_player_action
  while true
    player_action = gets.chomp.downcase
    if player_action == "1" or player_action == "hit me"
      return "1"
      break
    elsif player_action == "2" or player_action == "stay"
      return "2"
      break
    else
      puts "Please select option 1 or 2."
    end
  end
end

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

  if (deck.deck_remaining deck.cards_remaining).to_i < 13
    deck = Deck.new
    puts "The deck has been reshuffled."
  end

  puts "There are currently #{deck.deck_remaining deck.cards_remaining} cards in the deck."
  puts "The current running card count is #{deck.card_count deck.cards_remaining}."

  player.new_hand deck.draw_card, deck.draw_card
  dealer = Dealer.new deck.draw_card
  game_over = false
  outcome = "" #can be either "win" or "lose"
  sleep_counter = false


  puts "You have $#{player.money}."
  player.get_wager
  puts "You bet $#{player.wager}."
  puts
  sleep(0.5)

  while true
    sleep(0.5) if sleep_counter
    sleep_counter = true
    puts "Your hand is:"
    print player.hand
    puts " Total = #{player.hand_total}"
    if player.hand_total == 21
      puts
      puts "BLACKJACK!"
      sleep(0.5)
      break
    elsif player.hand_total > 21
      puts "Oops. You went over 21."
      puts "#{player.name} loses!"
      outcome = "lose"
      game_over = true
      sleep(0.5)
      break
    else
      puts "Your dealer has:"
      print dealer.hand
      puts puts
      puts "What would you like to do?"
      puts "1. Hit Me"
      puts "2. Stay"

      player_action = get_player_action

      if player_action == "1"
        puts "You have decided to hit."
        sleep(0.5)
        player.hit_me deck.draw_card
        puts
      else
        puts "You have decided to stay."
        sleep(0.5)
        break
      end
    end
  end

  if game_over == false
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
        outcome = "win"
        game_over = true
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
  end

  if game_over == false
    puts
    puts "Final score:"
    print "Your hand: #{player.hand}"
    puts " Total = #{player.hand_total}"
    print "Dealer's hand: #{dealer.hand}"
    puts " Total = #{dealer.hand_total}"
    if player.hand_total == dealer.hand_total
      puts "It's a tie! All wagers will be returned."
      outcome = "tie"
    elsif player.hand_total > dealer.hand_total
      puts "Your hand beats the dealer's hand."
      puts "#{player.name} wins!"
      outcome = "win"
    else
      puts "Your hand loses to the dealer's hand."
      puts "#{player.name} loses!"
      outcome = "lose"
    end
  end
  puts
  puts "The round is over."
  if outcome == "win"
    puts "Congratulations! You've won $#{player.wager}."
    player.money += player.wager
  elsif outcome == "tie"
  else
    puts "You've lost $#{player.wager}."
    player.money -= player.wager
  end
  puts "You now have $#{player.money}."

  if player.money == 0
    puts "You are out of money. Please leave the casino."
    puts "Ending the game..."
    break
  end

  unless replay
    break
  end

end
