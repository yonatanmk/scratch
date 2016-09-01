def get_guess word_letters, missed_letters
  puts "Please guess a letter."
  while true
    guess = gets.chomp.downcase
    if guess.length != 1
      puts "Please enter only a single letter."
    elsif word_letters.include? guess or missed_letters.include? guess
      puts "You have already guessed that letter."
    elsif not "abcdefghijklmnopqrstuvwxyz".include? guess
      puts "Please enter a letter. No numbers or symbols will be accepted."
    else
      puts
      return guess
    end
  end
end

word_letters = "as"
missed_letters = "zxy"

get_guess word_letters, missed_letters

puts "sentence after"
