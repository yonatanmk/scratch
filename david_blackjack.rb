class Card
  attr_reader :face, :suit, :value
  def initialize face, suit, value
    @face = face
    @suit = suit
    @value = value
  end

  def to_s
    "#{@face} of #{@suit}"
  end
end

class Deck
  def initialize
    @card_list = []
    ["Spades", "Clubs", "Hearts", "Diamonds"].each do |suit|
      @card_list << Card.new("King", suit, 10)
      @card_list << Card.new("Queen", suit, 10)
      @card_list << Card.new("Jack", suit, 10)
      @card_list << Card.new("Ace", suit, 11)
      (2..10).each do |face|
        @card_list << Card.new(face.to_s, suit, face)
      end
    end
    @card_list.shuffle!
  end

  def get_card
    @card_list.pop
  end
end

class Player
  attr_reader :name, :money_pool
  attr_accessor :hand_value, :current_bet

  def initialize(name, money_pool)
    @name = name
    @money_pool = money_pool
    self.clear_hand
  end

  def give_card(card)
    @hand << card
    @hand_value += card.value
  end

  def show_card
    puts "#{@name} has a card: #{@hand[0]}"
  end

  def show_cards
    puts "#{@name} has the following cards " + @hand.join(", ") + " for a total value of #{@hand_value}"
  end

  def clear_hand
    @hand = []
    @hand_value = 0
    @current_bet = 0
  end

  def win
    @money_pool += @current_bet
  end

  def lose
    @money_pool -= @current_bet
  end
end


dealer = Player.new("Dealer", 0)
puts "what is your name?"
name = gets.chomp
puts "How much money do you have"
money = gets.chomp.to_i
player = Player.new(name, money)

while true
  puts "would you like to play a game?"
  if gets.chomp.downcase != "yes"
    break
  end

  dealer.clear_hand
  player.clear_hand
  deck = Deck.new
  dealer.give_card(deck.get_card)
  dealer.give_card(deck.get_card)

  player.give_card(deck.get_card)
  player.give_card(deck.get_card)

  dealer.show_card
  player.show_cards

  puts "How much would you like to bet. You have #{player.money_pool}"
  player.current_bet = gets.chomp.to_i

  while player.hand_value < 21
    puts "Would you like to hit"
    if gets.chomp.downcase == "yes"
      player.give_card(deck.get_card)
      player.show_cards
    else
      break
    end
  end

  dealer.show_cards
  while dealer.hand_value < 17
    puts "Dealer is drawing"
    dealer.give_card(deck.get_card)
    dealer.show_cards
  end

  if player.hand_value > 21
    puts "You LOSE!"
    player.lose
    next
  end

  if dealer.hand_value > 21
    puts "You win the dealer has gone over"
    player.win
    next
  end

  if player.hand_value > dealer.hand_value
    puts "#{player.name} wins!"
    player.win
  elsif dealer.hand_value > player.hand_value
    puts "Dealer wins. Player sucks"
    player.lose
  else
    puts "Its a tie"
  end
end

puts "#{player.name} ended the game with #{player.money_pool}"
