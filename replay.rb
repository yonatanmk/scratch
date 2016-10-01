# def replay
#   while true
#     puts "Do you want to play again? (yes or no)"
#     play_again_answer = gets.chomp.downcase
#     puts
#     if play_again_answer == "y" || play_again_answer == "yes"
#       puts "Starting a new game..."
#       return true
#     elsif play_again_answer == "n" || play_again_answer == "no"
#       puts "Ending the game..."
#       return false
#     else
#       puts "Please only enter yes or no."
#     end
#   end
# end

module Replay
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
end

# include adds module to instances of class
# extend adds module to class (Class methods)
  #generally used extend when addling modules to main class
