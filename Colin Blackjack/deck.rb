class DeckOfCards
  attr_accessor :cards

  def initialize
    @cards = [
      {ace_of_spades: 1}, {two_of_spades: 2}, {three_of_spades: 3},
      {four_of_spades: 4}, {five_of_spades: 5}, {six_of_spades: 6},
      {seven_of_spades: 7}, {eight_of_spades: 8}, {nine_of_spades: 9}, 
      {ten_of_spades: 10}, {jack_of_spades: 10}, {queen_of_spades: 10},
      {king_of_spades: 10}, {ace_of_hearts: 1}, {two_of_hearts: 2},
      {three_of_hearts: 3}, {four_of_hearts: 4}, {five_of_hearts: 5},
      {six_of_hearts: 6}, {seven_of_hearts: 7}, {eight_of_hearts: 8},
      {nine_of_hearts: 9}, {ten_of_hearts: 10}, {jack_of_hearts: 10},
      {queen_of_hearts: 10}, {king_of_hearts: 10}, {ace_of_clubs: 1},
      {two_of_clubs: 2}, {three_of_clubs: 3}, {four_of_clubs: 4},
      {five_of_clubs: 5}, {six_of_clubs: 6}, {seven_of_clubs: 7},
      {eight_of_clubs: 8}, {nine_of_clubs: 9}, {ten_of_clubs: 10},
      {jack_of_clubs: 10}, {queen_of_clubs: 10}, {king_of_clubs: 10},
      {ace_of_diamonds: 1}, {two_of_diamonds: 2}, {three_of_diamonds: 3},
      {four_of_diamonds: 4}, {five_of_diamonds: 5}, {six_of_diamonds: 6},
      {seven_of_diamonds: 7}, {eight_of_diamonds: 8}, {nine_of_diamonds: 9},
      {ten_of_diamonds: 10}, {jack_of_diamonds: 10}, {queen_of_diamonds: 10},
      {king_of_diamonds: 10}
    ]
  end
end
