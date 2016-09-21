class Board
  attr_reader :board
  def initialize

    @board = [
      [{"1" => " "},{"2" => " "},{"3" => " "},{"4" => " "},{"5" => " "},{"6" => " "},{"7" => " "}],
      [{"1" => " "},{"2" => " "},{"3" => " "},{"4" => " "},{"5" => " "},{"6" => " "},{"7" => " "}],
      [{"1" => " "},{"2" => " "},{"3" => " "},{"4" => " "},{"5" => " "},{"6" => " "},{"7" => " "}],
      [{"1" => " "},{"2" => " "},{"3" => " "},{"4" => " "},{"5" => " "},{"6" => " "},{"7" => " "}],
      [{"1" => " "},{"2" => " "},{"3" => " "},{"4" => " "},{"5" => " "},{"6" => " "},{"7" => " "}],
      [{"1" => " "},{"2" => " "},{"3" => " "},{"4" => " "},{"5" => " "},{"6" => " "},{"7" => " "}]
    ]
    @lines = '-----------------------------'
  end

  def print_board
    puts "  1   2   3   4   5   6   7"
    @board.each do |row|
      print "|"
      (1..7).each do |column|
        print " " + row[column - 1][column.to_s] + " |"
      end
      puts
      puts @lines
    end
  end

  def play(player)
    end_play = false
    puts "Player #{player}, where would you like to go? (1-7)"
    while true
      column = gets.chomp
      if not ["1","2","3","4","5","6","7"].include?(column)
        puts "That is not an option."
      elsif @board[0][column.to_i - 1][column] != " "
        puts "That column is full."
      else
        @board.reverse.each do |row|
          row.each_index do |x|
            if row[x][column] == " "
              row[x][column] = player
              end_play = true
            end
          end
          break if end_play == true
        end
      end
      break if end_play == true
    end
  end

  def check_win
    @board.reverse.each do |row|      #checking for horzontal wins
      (0..3).each do |column|
        if row[column].values != [" "] && row[column].values == row[column + 1].values && row[column].values == row[column + 2].values && row[column].values == row[column + 3].values
          return true
        end
      end
    end
    (3..5).each do |row_num|          #checking for vertical wins
      (0..6).each do |column|
        if @board[row_num][column].values != [" "] && @board[row_num][column].values == @board[row_num - 1][column].values && @board[row_num][column].values == @board[row_num - 2][column].values && @board[row_num][column].values == @board[row_num - 3][column].values
          return true
        end
      end
    end
    (3..5).each do |row_num|          #checking for / diagonal wins
      (0..3).each do |column|
        if @board[row_num][column].values != [" "] && @board[row_num][column].values == @board[row_num - 1][column + 1].values && @board[row_num][column].values == @board[row_num - 2][column + 2].values && @board[row_num][column].values == @board[row_num - 3][column + 3].values
          return true
        end
      end
    end
    (3..5).each do |row_num|          #checking for \ diagonal wins
      (3..6).each do |column|
        if @board[row_num][column].values != [" "] && @board[row_num][column].values == @board[row_num - 1][column - 1].values && @board[row_num][column].values == @board[row_num - 2][column - 2].values && @board[row_num][column].values == @board[row_num - 3][column - 3].values
          return true
        end
      end
    end
    return false
  end
end
#_________________________________________________________________
board = Board.new
turn = 0


while true
  system "clear"
  puts "Welcome to Connect Four"
  puts

  board.print_board

  player = "O"
  player = "X" if turn % 2 == 0

  board.play(player)
  turn += 1

  if board.check_win
    break
  end
end

system "clear"
board.print_board
puts "Player #{player} wins!"
