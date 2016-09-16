class CompPlayer
  attr_reader :decision, :wins
  def initialize
    @decision = nil
    @wins = 0
  end

  def reset
    @decision = nil
  end

  def victory
    @wins += 1
  end

  def make_decision
    @decision = rand(3)
    if @decision == 0
      @decision = "rock"
    elsif @decision == 1
      @decision = "paper"
    else
      @decision = "scissor"
    end
  end
end

class Player
  attr_reader :name, :decision, :wins
  def initialize
    @name = name
    @decision = nil
    @wins = 0
  end

  def reset
    @decision = nil
  end

  def get_name
    puts "What is your name?"
    @name = gets.chomp
  end

  def victory
    @wins += 1
  end

  def make_decision
    puts "What would you like to do?"
    puts "1. Rock"
    puts "2. Paper"
    puts "3. Scissor"
    while true
      action = gets.chomp
      if action == "1"
        @decision = "rock"
        break
      elsif action == "2"
        @decision = "paper"
        break
      elsif action == "3"
        @decision = "scissor"
        break
      else
        puts "Please enter 1 or 2 or 3."
      end
    end
  end
end
#_________________________________________________________

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
#_________________________________________________________
computer = CompPlayer.new
player = Player.new

system "clear"

puts "Welcome to Rock Paper Scissor"
player.get_name

while true
  while true
    player.make_decision
    computer.make_decision
    puts "#{player.name} plays #{player.decision}"
    puts "The computer plays #{computer.decision}"

    if player.decision == "rock"
      if computer.decision == "rock"
        puts "It's a Tie!"
      elsif computer.decision == "paper"
        puts "#{player.name} loses!"
        computer.victory
        break
      else
        puts "#{player.name} wins!"
        player.victory
        break
      end
    elsif player.decision == "paper"
      if computer.decision == "paper"
        puts "It's a Tie!"
      elsif computer.decision == "scissor"
        puts "#{player.name} loses!"
        computer.victory
        break
      else
        puts "#{player.name} wins!"
        player.victory
        break
      end
    else
      if computer.decision == "scissor"
        puts "It's a Tie!"
      elsif computer.decision == "rock"
        puts "#{player.name} loses!"
        computer.victory
        break
      else
        puts "#{player.name} wins!"
        player.victory
        break
      end
    end
  end

  puts "#{player.name}: #{player.wins}"
  puts "Computer: #{computer.wins}"

  if replay
    computer.reset
    player.reset
    system "clear"
  else
    break
  end
end
