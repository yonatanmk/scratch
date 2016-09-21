class Board
  attr_reader :board
  def initialize
    @board = [[{"1" => "1"},{"2" => "2"},{"3" => "3"}],[{"4" => "4"},{"5" => "5"},{"6" => "6"}],[{"7" => "7"},{"8" => "8"},{"9" => "9"}]]
  end

  def reset
    @board = [["1","2","3"],["4","5","6"],["7","8","9"]]
  end

  def print_board
    @board.each do |x|
      print x
      puts
    end
  end

  def play location, player
    @board.each do |row|
      row.each_index do |x|
        if location == "X" or location == "O"
          puts "You're an idiot. Lose a turn."
          return false
        elsif row[x] == location and player == "1"
          row[x] = "X"
          return true
        elsif row[x] == location and player == "2"
          row[x] = "O"
          return true
        else
          puts "That's not an option. Lose a turn."
        end
      end
    end
  end

  def check_win
    if @board[0][0] == @board[1][1] and @board[1][1] == @board[2][2]
      puts "Player 1 wins" if @board[0][0] == "X"
      puts "Player 2 wins" if @board[0][0] == "O"
      true
    elsif @board[0][2] == @board[1][1] and @board[1][1] == @board[2][0]
      puts "Player 1 wins" if @board[0][2] == "X"
      puts "Player 2 wins" if @board[0][2] == "O"
      true
    elsif @board[0][0] == @board[0][1] and @board[0][1] == @board[0][2]
      puts "Player 1 wins" if @board[0][0] == "X"
      puts "Player 2 wins" if @board[0][0] == "O"
      true
    elsif @board[0][1] == @board[1][1] and @board[1][1] == @board[2][1]
      puts "Player 1 wins" if @board[0][1] == "X"
      puts "Player 2 wins" if @board[0][1] == "O"
      true
    elsif @board[0][2] == @board[1][2] and @board[1][2] == @board[2][2]
      puts "Player 1 wins" if @board[0][2] == "X"
      puts "Player 2 wins" if @board[0][2] == "O"
      true
    elsif @board[1][0] == @board[1][1] and @board[1][1] == @board[1][2]
      puts "Player 1 wins" if @board[1][0] == "X"
      puts "Player 2 wins" if @board[1][0] == "O"
      true
    elsif @board[2][0] == @board[2][1] and @board[2][1] == @board[2][2]
      puts "Player 1 wins" if @board[2][0] == "X"
      puts "Player 2 wins" if @board[2][0] == "O"
      true
    elsif @board[0][0] == @board[0][1] and @board[0][1] == @board[0][2]
      puts "Player 1 wins" if @board[0][0] = "X"
      puts "Player 2 wins" if @board[0][0] = "O"
      true
    else
      false
    end
  end

end

class Player
  attr_reader :name
  def initialize name
    @name = name
  end
end

#_________________________________________
system "clear"
board = Board.new
puts "Welcome to tic tac toe."

# puts "Player 1 what's your name?"
# player1 = Player.new (gets.chomp)
# puts "Player 2 what's your name?"
# player2 = Player.new (gets.chomp)

while true
  board.print_board
  if board.check_win
    break
  end
  puts "Player 1 where would you like to go?"
  location = gets.chomp
  board.play location, "1"

  board.print_board
  if board.check_win
    break
  end

  puts "Player 2 where would you like to go?"
  location = gets.chomp
  board.play location, "2"

end
