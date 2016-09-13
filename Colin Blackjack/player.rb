class Player
  attr_accessor :bank_roll, :dealt_cards, :score

  def initialize(bank_roll)
    @bank_roll = bank_roll
    @dealt_cards = []
    @score = 0
  end

  def hit_me(dealer)
    card = dealer.deck.cards.sample

    @dealt_cards << card
    dealer.deck.cards.delete(card)

    puts "Player has #{calculate_score} showing"
  end

  def calculate_score
    @score = 0
    @dealt_cards.each do |card|
      @score += card.values[0]
    end
    @score
  end
end