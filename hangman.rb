hangman_pics = ['
        ______
       |      |
       |
       |
       |
       |
   ____|______________
  /  __|__          / |
 /_________________/  |
|                  | /
|___________________/  ', '
        ______
       |      |
       |      O
       |
       |
       |
   ____|______________
  /  __|__          / |
 /_________________/  |
|                  | /
|___________________/  ', '
        ______
       |      |
       |      O
       |      |
       |
       |
   ____|______________
  /  __|__          / |
 /_________________/  |
|                  | /
|___________________/  ', '
        ______
       |      |
       |      O
       |     /|
       |
       |
   ____|______________
  /  __|__          / |
 /_________________/  |
|                  | /
|___________________/  ''', '''
        ______
       |      |
       |      O
       |     /|\\
       |
       |
   ____|______________
  /  __|__          / |
 /_________________/  |
|                  | /
|___________________/  ', '
        ______
       |      |
       |      O
       |     /|\\
       |      |
       |
   ____|______________
  /  __|__          / |
 /_________________/  |
|                  | /
|___________________/  ''', '''
        ______
       |      |
       |      O
       |     /|\\
       |      |
       |     /
   ____|______________
  /  __|__          / |
 /_________________/  |
|                  | /
|___________________/  ', '
        ______
       |      |
       |      O
       |     /|\\
       |      |
       |     / \\
   ____|______________
  /  __|__          / |
 /_________________/  |
|                  | /
|___________________/  ']

word_list = [
'acres', 'adult', 'advice', 'arrangement', 'attempt', 'border', 'constantly', 'contrast', 'cookies',
'customs', 'damage', 'deeply', 'depth', 'discussion', 'doll', 'donkey', 'fireplace', 'floating', 'folks', 'fort', 'garage', 'grabbed', 'grandmother', 'habit',
'happily', 'heading', 'hunter', 'image', 'independent', 'instant', 'kids', 'label', 'lungs', 'manufacturing', 'mathematics', 'melted', 'memory', 'mill', 'mission', 'monkey', 'mysterious', 'neighborhood',
'nuts', 'occasionally', 'official', 'ourselves', 'palace', 'plates', 'poetry', 'policeman', 'positive', 'possibly',
'practical', 'pride', 'promised', 'recall', 'relationship', 'remarkable', 'require', 'rhyme', 'rocky', 'rubbed', 'rush', 'sale', 'satellites', 'satisfied', 'scared', 'selection',
'shake', 'shaking', 'shallow', 'shout', 'silly', 'simplest', 'slight', 'slip', 'slope', 'soap', 'solar', 'species', 'spin', 'stiff', 'swung', 'tales', 'thumb', 'tobacco', 'toy', 'trap'
]
#----------------------------------------------------------------------------------------------------------------------------
def random_word word_list
  return word_list[rand(0..87)]
end

def draw_board hangman_pics, missed_letters, word_letters, hidden_word
  puts hangman_pics[missed_letters.length]
  puts
  blank = "_" * hidden_word.length
  char_pos = 0
  hidden_word.each_char do |x|
    if word_letters.include? x
      blank = blank[0...char_pos] + x + blank[char_pos + 1...hidden_word.length]
    end
    char_pos += 1
  end
  print blank[0].upcase + " "
  blank[1...hidden_word.length].each_char do |x|
    print x + " "
  end
  puts
  print "Missed Letters: "
  missed_letters.chars.sort.join.each_char do |x|
    print x + " "
  end
  puts
end

def get_guess word_letters, missed_letters
  puts "Please guess a letter."
  while true
    guess = gets.chomp.downcase
    puts
    if guess.length != 1
      puts "Please enter only a single letter."
    elsif word_letters.include? guess or missed_letters.include? guess
      puts "You have already guessed that letter."
    elsif not "abcdefghijklmnopqrstuvwxyz".include? guess
      puts "Please enter a letter. No numbers or symbols will be accepted."
    else
      return guess
    end
  end
end

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
#----------------------------------------------------------------------------------------------------------------------------
hidden_word = random_word word_list
missed_letters = ""
word_letters = ""
game_over = false
win_count = 0
lose_count = 0
wrong_guess = false
guess = ""

puts "Welcome to Hangman!!!"
puts
while true
  system "clear"
  puts "Welcome to Hangman!!!"
  if wrong_guess == true
    puts "The letter #{guess.upcase} is not in the hidden word."
    wrong_guess = false
  else
    puts
  end
  puts
  draw_board hangman_pics, missed_letters, word_letters, hidden_word
  guess = get_guess word_letters, missed_letters

  if hidden_word.include? guess
    word_letters << guess
    complete_word = true
    hidden_word.each_char do |x|
      if not word_letters.include? x
        complete_word = false
      end
    end
    if complete_word
      game_over = true
      win_count += 1
      puts "Congratulations! You've won! The hidden word was #{hidden_word}!"
    end

  else
    missed_letters << guess.upcase
    wrong_guess = true
    if missed_letters.length == hangman_pics.length - 1
      puts "G A M E  O V E R"
      puts "You have run out of guesses!"
      puts "You had #{missed_letters.length} wrong guess#{"es" unless missed_letters.length == 1} and #{word_letters.length} correct guess#{"es" unless word_letters.length == 1}."
      puts "The word was #{hidden_word}."
      game_over = true
      lose_count += 1
    end
  end

  if game_over
    puts "Wins: #{win_count}"
    puts "Losses: #{lose_count}"
    if replay
      hidden_word = random_word word_list
      missed_letters = ""
      word_letters = ""
      game_over = false
    else
      break
    end
  end
end
