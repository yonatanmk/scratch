class Board
  attr_reader :board
  def initialize

    @board = [
      [[" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "]],
      [[" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "]],
      [[" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "]],
      [[" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "]],
      [[" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "]],
      [[" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "]],
      [[" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "]],
      [[" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "]],
      [[" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "]],
      [[" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "], [" "," "]],
    ]
    @lines = '   -------------------------------------'
    @a_hits = 0
    @b_hits = 0
    @d_hits = 0
    @s_hits = 0
    @p_hits = 0


    #place boats on the board
    #aircraft carrer
    @a_position_y = ""
    @a_position_x = ""
    boat_rotation = rand(0..1)
    if boat_rotation == 1
      @a_position_y = rand(5..9)
      @a_position_x = rand(1..9)
      @board[@a_position_y-1][@a_position_x-1][1] = "A"
      @board[@a_position_y-2][@a_position_x-1][1] = "A"
      @board[@a_position_y-3][@a_position_x-1][1] = "A"
      @board[@a_position_y-4][@a_position_x-1][1] = "A"
      @board[@a_position_y-5][@a_position_x-1][1] = "A"
    else
      @a_position_y = rand(1..9)
      @a_position_x = rand(1..5)
      @board[@a_position_y-1][@a_position_x-1][1] = "A"
      @board[@a_position_y-1][@a_position_x][1] = "A"
      @board[@a_position_y-1][@a_position_x+1][1] = "A"
      @board[@a_position_y-1][@a_position_x+2][1] = "A"
      @board[@a_position_y-1][@a_position_x+3][1] = "A"
    end

    #battleship
    @b_position_y = ""
    @b_position_x = ""
    while true
      boat_rotation = rand(0..1)
      if boat_rotation == 1
        @b_position_y = rand(4..9)
        @b_position_x = rand(1..9)
        unless @board[@b_position_y-1][@b_position_x-1][1] != " " || @board[@b_position_y-2][@b_position_x-1][1] != " " || @board[@b_position_y-3][@b_position_x-1][1] != " " || @board[@b_position_y-4][@b_position_x-1][1] != " "
          @board[@b_position_y-1][@b_position_x-1][1] = "B"
          @board[@b_position_y-2][@b_position_x-1][1] = "B"
          @board[@b_position_y-3][@b_position_x-1][1] = "B"
          @board[@b_position_y-4][@b_position_x-1][1] = "B"
          break
        end
      else
        @b_position_y = rand(1..9)
        @b_position_x = rand(1..6)
        unless @board[@b_position_y-1][@b_position_x-1][1] != " " || @board[@b_position_y-1][@b_position_x][1] != " " || @board[@b_position_y-1][@b_position_x+1][1] != " " || @board[@b_position_y-1][@b_position_x+2][1] != " "
          @board[@b_position_y-1][@b_position_x-1][1] = "B"
          @board[@b_position_y-1][@b_position_x][1] = "B"
          @board[@b_position_y-1][@b_position_x+1][1] = "B"
          @board[@b_position_y-1][@b_position_x+2][1] = "B"
          break
        end
      end
    end

    #destroyer
    @d_position_y = ""
    @d_position_x = ""
    while true
      boat_rotation = rand(0..1)
      if boat_rotation == 1
        @d_position_y = rand(3..9)
        @d_position_x = rand(1..9)
        unless @board[@d_position_y-1][@d_position_x-1][1] != " " || @board[@d_position_y-2][@d_position_x-1][1] != " " || @board[@d_position_y-3][@d_position_x-1][1] != " "
          @board[@d_position_y-1][@d_position_x-1][1] = "D"
          @board[@d_position_y-2][@d_position_x-1][1] = "D"
          @board[@d_position_y-3][@d_position_x-1][1] = "D"
          break
        end
      else
        @d_position_y = rand(1..9)
        @d_position_x = rand(1..7)
        unless @board[@d_position_y-1][@d_position_x-1][1] != " " || @board[@d_position_y-1][@d_position_x][1] != " " || @board[@d_position_y-1][@d_position_x+1][1] != " "
          @board[@d_position_y-1][@d_position_x-1][1] = "D"
          @board[@d_position_y-1][@d_position_x][1] = "D"
          @board[@d_position_y-1][@d_position_x+1][1] = "D"
          break
        end
      end
    end

    #submarine
    @s_position_y = ""
    @s_position_x = ""
    while true
      boat_rotation = rand(0..1)
      if boat_rotation == 1
        @s_position_y = rand(3..9)
        @s_position_x = rand(1..9)
        unless @board[@s_position_y-1][@s_position_x-1][1] != " " || @board[@s_position_y-2][@s_position_x-1][1] != " " || @board[@s_position_y-3][@s_position_x-1][1] != " "
          @board[@s_position_y-1][@s_position_x-1][1] = "S"
          @board[@s_position_y-2][@s_position_x-1][1] = "S"
          @board[@s_position_y-3][@s_position_x-1][1] = "S"
          break
        end
      else
        @s_position_y = rand(1..9)
        @s_position_x = rand(1..7)
        unless @board[@s_position_y-1][@s_position_x-1][1] != " " || @board[@s_position_y-1][@s_position_x][1] != " " || @board[@s_position_y-1][@s_position_x+1][1] != " "
          @board[@s_position_y-1][@s_position_x-1][1] = "S"
          @board[@s_position_y-1][@s_position_x][1] = "S"
          @board[@s_position_y-1][@s_position_x+1][1] = "S"
          break
        end
      end
    end

    #patrol_boat
    @p_position_y = ""
    @p_position_x = ""
    while true
      boat_rotation = rand(0..1)
      if boat_rotation == 1
        @p_position_y = rand(3..9)
        @p_position_x = rand(1..9)
        unless @board[@p_position_y-1][@p_position_x-1][1] != " " || @board[@p_position_y-2][@p_position_x-1][1] != " "
          @board[@p_position_y-1][@p_position_x-1][1] = "P"
          @board[@p_position_y-2][@p_position_x-1][1] = "P"
          break
        end
      else
        @p_position_y = rand(1..9)
        @p_position_x = rand(1..7)
        unless @board[@p_position_y-1][@p_position_x-1][1] != " " || @board[@p_position_y-1][@p_position_x][1] != " "
          @board[@p_position_y-1][@p_position_x-1][1] = "P"
          @board[@p_position_y-1][@p_position_x][1] = "P"
          break
        end
      end
    end

  end #ends initialize

  def print_board
    puts "     1   2   3   4   5   6   7   8   9"
    (1..9).each do |y|
      print "#{y}  |"
      (1..9).each do |x|
        print " " + @board[y-1][x - 1][0] + " |"
      end
      puts
      puts @lines
    end
  end

  def boat_locations                                  #for debugging
    puts "Aircraft Carrier: (#{@a_position_x},#{@a_position_y})"
    puts "Battleship: (#{@b_position_x},#{@b_position_y})"
    puts "Destroyer: (#{@d_position_x},#{@d_position_y})"
    puts "Submarine: (#{@s_position_x},#{@s_position_y})"
    puts "Patrol Boat: (#{@p_position_x},#{@p_position_y})"
  end

  def play(player, board)
    puts "#{player}, where would you like to go? (1-9)"
    while true
      print "X:"
      x = gets.chomp.to_i
      print "Y:"
      y = gets.chomp.to_i
      if not [1,2,3,4,5,6,7,8,9].include?(x) or not [1,2,3,4,5,6,7,8,9].include?(y)
        puts "That is not an option."
      elsif @board[y-1][x-1][0] != " "
        puts "You've already guessed that location"
      else
        if @board[y-1][x - 1][1] == "A"
          @board[y-1][x - 1][0] = "O"
          @a_hits += 1
          if @a_hits == 5
            @board.each do |row|
              row.each do |x|
                x[0] = x[1] if x[1] == "A"
              end
            end
            return "a_sink"
          else
            return "hit"
          end
        elsif @board[y-1][x - 1][1] == "B"
          @board[y-1][x - 1][0] = "O"
          @b_hits += 1
          if @b_hits == 4
            @board.each do |row|
              row.each do |x|
                x[0] = x[1] if x[1] == "B"
              end
            end
            return "b_sink"
          else
            return "hit"
          end
        elsif @board[y-1][x - 1][1] == "D"
          @board[y-1][x - 1][0] = "O"
          @d_hits += 1
          if @d_hits == 3
            @board.each do |row|
              row.each do |x|
                x[0] = x[1] if x[1] == "D"
              end
            end
            return "d_sink"
          else
            return "hit"
          end
        elsif @board[y-1][x - 1][1] == "S"
          @board[y-1][x - 1][0] = "O"
          @s_hits += 1
          if @s_hits == 3
            @board.each do |row|
              row.each do |x|
                x[0] = x[1] if x[1] == "S"
              end
            end
            return "s_sink"
          else
            return "hit"
          end
        elsif @board[y-1][x - 1][1] == "P"
          @board[y-1][x - 1][0] = "O"
          @p_hits += 1
          if @p_hits == 2
            @board.each do |row|
              row.each do |x|
                x[0] = x[1] if x[1] == "P"
              end
            end
            return "p_sink"
          else
            return "hit"
          end
        else
          @board[y-1][x - 1][0] = "X"
          return "miss"
        end
      end
    end
  end

end

class Player
  attr_reader :name, :hits
  def initialize name
    @name = name
    @hits = 0
  end

  def update_hits
    @hits += 1
  end

  def reset_hits
    @hits = 0
  end

  def check_win
    if @hits == 17
      return true
    else
      return false
    end
  end
end

#_________________________________________________________________
def replay
  while true
    puts "Do you want to play again? (yes or no)"
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
#_________________________________________________________________
system "clear"

puts "Welcome to Battleship"
puts "Player 1, what's your name?"
player1 = Player.new gets.chomp.capitalize
puts "Player 2, what's your name?"
while true
  player2_name = gets.chomp.capitalize
  if player2_name == player1.name
    puts "The other player already took that name."
  else
    break
  end
end
player2 = Player.new player2_name

while true
  player = player1
  board1 = Board.new
  board2 = Board.new
  turn = 0

  until player.check_win
    system "clear"
    puts "           B A T T L E S H I P"
    puts "#{player1.name}: #{player1.hits}"                #debugging
    puts "#{player2.name}: #{player2.hits}"                #debugging

    player = player2
    player = player1 if turn % 2 == 0
    board = board2
    board = board1 if turn % 2 == 0

    puts "#{player.name}'s turn."
    puts

    board.boat_locations                                  #debugging
    board.print_board

    attack = board.play(player.name, board)

    if attack == "hit"
      player.update_hits
      system "clear"
      puts "           B A T T L E S H I P"
      puts "#{player.name} hits a ship."
      puts
      board.print_board
    elsif attack == "a_sink"
      player.update_hits
      system "clear"
      puts "           B A T T L E S H I P"
      puts "#{player.name} sunk the opponent's Aircraft Carrier."
      puts
      board.print_board
    elsif attack == "b_sink"
      player.update_hits
      system "clear"
      puts "           B A T T L E S H I P"
      puts "#{player.name} sunk the opponent's Battleship."
      puts
      board.print_board
    elsif attack == "d_sink"
      player.update_hits
      system "clear"
      puts "           B A T T L E S H I P"
      puts "#{player.name} sunk the opponent's Destroyer."
      puts
      board.print_board
    elsif attack == "s_sink"
      player.update_hits
      system "clear"
      puts "           B A T T L E S H I P"
      puts "#{player.name} sunk the opponent's Submarine."
      puts
      board.print_board
    elsif attack == "p_sink"
      player.update_hits
      system "clear"
      puts "           B A T T L E S H I P"
      puts "#{player.name} sunk the opponent's Patrol Boat."
      puts
      board.print_board
    else
      system "clear"
      puts "           B A T T L E S H I P"
      puts "#{player.name} misses."
      puts
      board.print_board
    end
    gets
    turn += 1
  end

  system "clear"
  puts "           B A T T L E S H I P"
  puts "#{player.name} wins!"
  puts
  board.print_board

  if replay
    player1.reset_hits
    player2.reset_hits
  else
    break
  end
end
