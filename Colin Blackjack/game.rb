require 'deck.rb'
require 'dealer.rb'
require 'player.rb'

class Game
  attr_accessor :player, :dealer

  def initialize(dealer, player)
    @player = player
    @dealer = dealer
    @stater = ""
  end

  def start
    if @player.bank_roll == 0
      puts "You've lost all your money"
    elsif @player.bank_roll < 0
      puts "You actually owe us $#{-player.bank_roll}"
    else
      puts "--shuffling--"
      @dealer.shuffle

      puts "Player has $#{@player.bank_roll}"
      puts "Place your bet."
      bet = gets.chomp.to_i

      @dealer.deal(2)
      @dealer.deal(@player, 2)

      #check 1
      if @player.score == 21 && @dealer.hidden_score != 21
        player_wins(bet)
        busts
      end

      if @dealer.hidden_score == 21 && @player.score != 21
        dealer_wins(bet)
        busts
      end

      puts "'hit' or 'stay'?"
      choice = gets.chomp

      until choice == "stay"
        @player.hit_me(@dealer)
        if @player.score <= 21
          choice = gets.chomp
        else
          dealer_wins(bet)
          busts
        end
      end

      if @player.score == 21
        player_wins(bet)
        busts
      end

      puts "dealer stays" if @dealer.hidden_score >= 17

      if @dealer.hidden_score <= 17
        puts "dealer takes a hit"
        until @dealer.hidden_score >= 17
          puts "... dealer takes a hit"
          @dealer.deal(1)
          if @dealer.hidden_score > 21
            player_wins(bet)
            busts
          end
        end
      end

      puts "\n\n"
      puts "Dealer has #{@dealer.hidden_score}"
      winning_determinant(bet)

      busts
    end
  end

  def winning_determinant(bet)
    if @dealer.hidden_score > @player.score
      dealer_wins(bet)
    elsif @dealer.hidden_score < @player.score
      player_wins(bet)
    elsif @dealer.hidden_score == @player.score 
      puts "Tie"
    end
  end

  def dealer_wins(bet)
    player_final_hand
    dealer_final_hand
    puts "Player busts, Dealer wins" 
    @dealer.bank_roll += bet
    @player.bank_roll -= bet
    puts "player loses $#{bet}, has $#{@player.bank_roll} remaining"
  end

  def player_wins(bet)
    dealer_final_hand
    player_final_hand
    puts "Dealer busts, Player wins"
    @dealer.bank_roll -= bet
    @player.bank_roll += bet
    puts "player wins $#{bet}, has $#{@player.bank_roll}"
  end

  def player_final_hand
    a = "Player showing..."
    @player.dealt_cards.each do |card|
      card.each_key do |key|
        a << " #{key};"
      end
    end
    puts a + " (#{@player.score})"
  end

  def dealer_final_hand
    a = "Dealer showing..."
    @dealer.dealt_cards.each do |card|
      card.each_key do |key|
        a << " #{key};"
      end
    end
    puts a + " (#{@dealer.hidden_score})"
  end

  def reset_game
    @dealer.score = 0
    @dealer.hidden_score = 0
    @dealer.dealt_cards = []

    @player.score = 0
    @player.dealt_cards = []

    @dealer.deck = DeckOfCards.new
  end

  def busts
    reset_game

    puts "Play again? (yes or no)"
    @starter = gets.chomp

    if @starter != "no"
      start
    else
      return "bye bye"
    end
  end
end
