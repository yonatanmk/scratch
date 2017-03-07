require_relative 'replay.rb'
require 'Pry'

extend Replay

class Board
  attr_reader :board, :x_axis_length, :y_axis_length, :lines, :labels, :play_options
  def initialize x_axis_length, y_axis_length
    @x_axis_length = x_axis_length
    @y_axis_length = y_axis_length
    @board = []
    y_axis_length.times do
      @board << []
    end
    @board.each do |row|
      x_axis_length.times do |x|
        row << [x + 1, " "]
      end
    end
    @lines = '-' * (x_axis_length * 4 + 1)
    @labels = '  '
    @play_options = []
    x_axis_length.times do |x|
      @play_options << (x + 65).chr
      @labels +=  "#{(x + 65).chr}   "
    end


  end

  def print_board
    puts @labels
    @board.each do |row|
      print "|"
      (1..@x_axis_length).each do |column|
        print " " + row[column - 1][1] + " |"
      end
      puts
      puts @lines
    end
  end

  def play(player)
    end_play = false
    puts "Player #{player}, where would you like to go? (1-7)"
    until end_play == true
      column = gets.chomp.upcase.ord - 64
      if not @play_options.include?((column + 64).chr)
        puts "That is not an option."
      elsif @board[0][column - 1][1] != " "
        puts "That column is full."
      else
        @board.reverse.each do |row|
          row.each_index do |x|
            if row[x][0] == column && row[x][1] == " "
              row[x][1] = player
              end_play = true
            end
          end
          break if end_play == true
        end
      end
    end
  end

  def check_win
    @board.reverse.each do |row_num|      #checking for horzontal wins
      (0..@x_axis_length-4).each do |column|
        #binding.pry
        if row_num[column][1] != " " && row_num[column][1] == row_num[column + 1][1] && row_num[column][1] == row_num[column + 2][1] && row_num[column][1] == row_num[column + 3][1]
          return true
        end
      end
    end
    (3..@y_axis_length-1).each do |row_num|          #checking for vertical wins
      (0..@x_axis_length-1).each do |column|
        if @board[row_num][column][1] != " " && @board[row_num][column][1] == @board[row_num - 1][column][1] && @board[row_num][column][1] == @board[row_num - 2][column][1] && @board[row_num][column][1] == @board[row_num - 3][column][1]
          return true
        end
      end
    end
    (3..@y_axis_length-1).each do |row_num|          #checking for / diagonal wins
      (0..@x_axis_length-4).each do |column|
        if @board[row_num][column][1] != " " && @board[row_num][column][1] == @board[row_num - 1][column + 1][1] && @board[row_num][column][1] == @board[row_num - 2][column + 2][1] && @board[row_num][column][1] == @board[row_num - 3][column + 3][1]
          return true
        end
      end
    end
    (3..@y_axis_length-1).each do |row_num|          #checking for \ diagonal wins
      (3..@x_axis_length-1).each do |column|
        if @board[row_num][column][1] != " " && @board[row_num][column][1] == @board[row_num - 1][column - 1][1] && @board[row_num][column][1] == @board[row_num - 2][column - 2][1] && @board[row_num][column][1] == @board[row_num - 3][column - 3][1]
          return true
        end
      end
    end
    return false
  end
end

def num_filter
  loop do
    x = gets.chomp
    if x.to_i.to_s != x
      puts "Please enter an integer."
    elsif x.to_i > 20 || x.to_i < 4
      puts "Please enter an integer between 4 and 20."
    else
      return x.to_i
    end
  end
end

#_______________________________________________________________________________
while true
  system "clear"
  puts "How many columns should the board have?"
  x_axis_length = num_filter
  puts "How many rows should the board have?"
  y_axis_length = num_filter
  board = Board.new(x_axis_length, y_axis_length)
  turn = 0
  tie = false
  until board.check_win
    system "clear"
    puts "   Welcome to Connect Four"
    puts
    board.print_board
    player = "O"
    player = "X" if turn % 2 == 0
    board.play(player)
    turn += 1

    if turn == x_axis_length * y_axis_length
      tie = true
      break
    end
  end

  system "clear"
  puts "   Welcome to Connect Four"
  puts
  board.print_board
  if tie == true
    puts "It's a tie."
  else
    puts "Player #{player} wins!"
  end

  unless replay
    break
  end
end
