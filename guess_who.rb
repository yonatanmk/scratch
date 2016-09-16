require 'csv'

class Person
  attr_reader :name, :gender, :skin_color, :hair_color, :eye_color, :person_traits
  def initialize suspect_list
    person_selector = rand(21)
    @name = suspect_list[person_selector][0]
    @gender = suspect_list[person_selector][1]
    @skin_color = suspect_list[person_selector][2]
    @hair_color = suspect_list[person_selector][3]
    @eye_color = suspect_list[person_selector][4]
    @person_traits = suspect_list[person_selector]
  end
end

class SuspectList
  attr_accessor :suspect_list, :name_list, :gender_list, :skin_list, :hair_list, :eye_list

  def initialize
    @suspect_list = CSV.read('Suspects.csv')
    @name_list = []
    @gender_list = []
    @skin_list = []
    @hair_list = []
    @eye_list = []

    suspect_list.each do |suspect|
      @name_list << suspect[0] unless name_list.include? suspect[0]
      @gender_list << suspect[1] unless gender_list.include? suspect[1]
      @skin_list << suspect[2] unless skin_list.include? suspect[2]
      @hair_list << suspect[3] unless hair_list.include? suspect[3]
      @eye_list << suspect[4] unless eye_list.include? suspect[4]
    end
  end

  def trait_lists_reset
    @name_list = []
    @gender_list = []
    @skin_list = []
    @hair_list = []
    @eye_list = []
    suspect_list.each do |suspect|
      @name_list << suspect[0] unless name_list.include? suspect[0]
      @gender_list << suspect[1] unless gender_list.include? suspect[1]
      @skin_list << suspect[2] unless skin_list.include? suspect[2]
      @hair_list << suspect[3] unless hair_list.include? suspect[3]
      @eye_list << suspect[4] unless eye_list.include? suspect[4]
    end
  end

  def print_list
    @suspect_list.each do |suspect|
      if suspect[0].length > 7
        print suspect[0] + "\t" + suspect[1..(suspect.length - 1)].join("\t\t")
        puts
      else
        print suspect.join("\t\t")
        puts
      end
    end
  end

  def get_name
    while true
      name = gets.chomp.downcase.capitalize
      if @name_list.include? name
        return name
      else
        return false
      end
    end
  end

  def name_remove name_guess
    @suspect_list.each do |suspect|
      if suspect[0] == name_guess
        @suspect_list.delete(suspect)
      end
    end
  end

  def get_gender
    while true
      gender = gets.chomp.downcase
      if @gender_list.include? gender
        return gender
      else
        return false
      end
    end
  end

  def gender_remove gender_guess
    new_list = []
    @suspect_list.each do |suspect|
      if suspect[1] != gender_guess
        new_list << suspect
      end
    end
    @suspect_list = new_list
  end

  def gender_remove_other gender_guess
    new_list = []
    @suspect_list.each do |suspect|
      if suspect[1] == gender_guess
        new_list << suspect
      end
    end
    @suspect_list = new_list
  end

  def get_skin
    while true
      skin = gets.chomp.downcase
      if @skin_list.include? skin
        return skin
      else
        return false
      end
    end
  end

  def skin_remove skin_guess
    new_list = []
    @suspect_list.each do |suspect|
      if suspect[2] != skin_guess
        new_list << suspect
      end
    end
    @suspect_list = new_list
  end

  def skin_remove_other skin_guess
    new_list = []
    @suspect_list.each do |suspect|
      if suspect[2] == skin_guess
        new_list << suspect
      end
    end
    @suspect_list = new_list
  end

  def get_hair
    while true
      hair = gets.chomp.downcase
      if @hair_list.include? hair
        return hair
      else
        return false
      end
    end
  end

  def hair_remove hair_guess
    new_list = []
    @suspect_list.each do |suspect|
      if suspect[3] != hair_guess
        new_list << suspect
      end
    end
    @suspect_list = new_list
  end

  def hair_remove_other hair_guess
    new_list = []
    @suspect_list.each do |suspect|
      if suspect[3] == hair_guess
        new_list << suspect
      end
    end
    @suspect_list = new_list
  end

  def get_eye
    while true
      eye = gets.chomp.downcase
      if @eye_list.include? eye
        return eye
      else
        return false
      end
    end
  end

  def eye_remove eye_guess
    new_list = []
    @suspect_list.each do |suspect|
      if suspect[4] != eye_guess
        new_list << suspect
      end
    end
     @suspect_list = new_list
  end

  def eye_remove_other eye_guess
    new_list = []
    @suspect_list.each do |suspect|
      if suspect[4] == eye_guess
        new_list << suspect
      end
    end
    @suspect_list = new_list
  end

  def question_number question_type
    if question_type == "skin"
      if @gender_list.length == 1
        return "2"
      else
        return "3"
      end
    elsif question_type == "hair"
      if @gender_list.length == 1
        if @skin_list.length == 1
          return "2"
        else
          return "3"
        end
      else
        if @skin_list.length == 1
          return "3"
        else
          return "4"
        end
      end
    elsif question_type == "eye"
      if @gender_list.length == 1
        if @skin_list.length == 1
          if @hair_list.length == 1
            return "2"
          else
            return "3"
          end
        else
          if @hair_list.length == 1
            return "3"
          else
            return "4"
          end
        end
      else
        if @skin_list.length == 1
          if @hair_list.length == 1
            return "3"
          else
            return "4"
          end
        else
          if @hair_list.length == 1
            return "4"
          else
            return "5"
          end
        end
      end
    end
  end

end
#___________________________________________________
def get_question_type
  while true
    question_type = gets.chomp.downcase
    if question_type == "name" or question_type == "1"
      return "1"
    elsif question_type == "gender" or question_type == "2"
      return "2"
    elsif question_type == "skin color" or question_type == "3"
      return "3"
    elsif question_type == "hair color" or question_type == "4"
      return "4"
    elsif question_type == "eye color" or question_type == "5"
      return "5"
    else
      puts "Please choose one of the above options."
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

def report_guess_result guess_list
  guess_list.each do |key, value|
    if value[0] == "name"
      if value[1] == true
        puts "The person is #{key}."
      else
        puts "The person is not #{key}."
      end
    elsif value[0] == "gender"
      if value[1] == true
        puts "The person is a #{key}."
      else
        puts "The person is not a #{key}."
      end
    elsif value[0] == "skin"
      if value[1] == true
        puts "The person has #{key} skin."
      else
        puts "The person does not have #{key} skin."
      end
    elsif value[0] == "hair"
      if value[1] == true
        puts "The person has #{key} hair."
      else
        puts "The person does not have #{key} hair."
      end
    elsif value[0] == "eye"
      if value[1] == true
        puts "The person has #{key} eyes."
      else
        puts "The person does not have #{key} eyes."
      end
    end
  end
end
#_________________________________________

while true
  system "clear"
  puts "Welcome to Guess Who!"
  person = Person.new (CSV.read('Suspects.csv'))
  current_suspect_list = SuspectList.new
  guess_count = 0
  player_wins = false
  show_board = true
  guess_list = {}

  while guess_count < 3
    current_suspect_list.trait_lists_reset
    if show_board == true
      report_guess_result guess_list
      puts "You have #{3 - guess_count} #{"lives" if guess_count < 2}#{"life" if guess_count == 2} remaining."
      # print person.person_traits                #shows the answer for debugging
      # puts
      # puts guess_list                           #shows the guess_list for debugging
      puts
      puts "Here are your suspects:"
      print "Name" + "\t\t" + "Gender" + "\t\t" + "Skin Color" + "\t" + "Hair Color" + "\t" + "Eye Color"
      puts
      puts
      current_suspect_list.print_list
      puts
    end
    show_board = true
    puts "Which trait would you like to ask about?"
    puts "1. Name."
    puts "2. Gender." unless current_suspect_list.gender_list.length == 1
    puts "#{current_suspect_list.question_number "skin"}. Skin Color." unless current_suspect_list.skin_list.length == 1
    puts "#{current_suspect_list.question_number "hair"}. Hair Color." unless current_suspect_list.hair_list.length == 1
    puts "#{current_suspect_list.question_number "eye"}. Eye Color." unless current_suspect_list.eye_list.length == 1

    question_type = get_question_type
    puts

    if question_type == "1"
      puts "Please enter a name."
      name_guess = current_suspect_list.get_name
      puts
      if name_guess == false
        puts "That name is not an option."
        puts
        show_board = false
      elsif name_guess == person.name
        guess_list.store(name_guess.capitalize, ["name", true])
        player_wins = true
        break
      else
        guess_list.store(name_guess.capitalize, ["name", false])
        guess_count += 1
        current_suspect_list.name_remove(name_guess)
      end
    elsif question_type == "2" and current_suspect_list.gender_list.length != 1
      puts "Please enter a gender."
      gender_guess = current_suspect_list.get_gender
      puts
      if gender_guess == false
        puts "That gender is not an option."
        puts
        show_board = false
      elsif gender_guess == person.gender
        guess_list.store(gender_guess, ["gender", true])
        current_suspect_list.gender_remove_other(gender_guess)
      else
        guess_list.store(gender_guess, ["gender", false])
        guess_count += 1
        current_suspect_list.gender_remove(gender_guess)
      end
    elsif question_type == current_suspect_list.question_number("skin") and current_suspect_list.skin_list.length != 1
      puts "Please enter a skin color."
      skin_guess = current_suspect_list.get_skin
      puts
      if skin_guess == false
        puts "That skin color is not an option."
        puts
        show_board = false
      elsif skin_guess == person.skin_color
        guess_list.store(skin_guess, ["skin", true])
        current_suspect_list.skin_remove_other(skin_guess)
      else
        guess_list.store(skin_guess, ["skin", false])
        guess_count += 1
        current_suspect_list.skin_remove(skin_guess)
      end
    elsif question_type == current_suspect_list.question_number("hair") and current_suspect_list.hair_list.length != 1
      puts "Please enter a hair color."
      hair_guess = current_suspect_list.get_hair
      puts
      if hair_guess == false
        puts "That hair color is not an option."
        puts
        show_board = false
      elsif hair_guess == person.hair_color
        guess_list.store(hair_guess, ["hair", true])
        current_suspect_list.hair_remove_other(hair_guess)
      else
        guess_list.store(hair_guess, ["hair", false])
        guess_count += 1
        current_suspect_list.hair_remove(hair_guess)
      end
    elsif question_type == current_suspect_list.question_number("eye")
      puts "Please enter a eye color."
      eye_guess = current_suspect_list.get_eye
      puts
      if eye_guess == false
        puts "That eye color is not an option."
        puts
        show_board = false
      elsif eye_guess == person.eye_color
        guess_list.store(eye_guess, ["eye", true])
        current_suspect_list.eye_remove_other(eye_guess)
      else
        guess_list.store(eye_guess, ["eye", false])
        guess_count += 1
        current_suspect_list.eye_remove(eye_guess)
      end
    end
    system "clear" unless show_board == false
  end

  if player_wins == true
    puts "YES. The person is #{person.name}."
    puts "Congratulations! You Win!"
  else
    puts "You lose. The person was #{person.name}."
  end

  unless replay
    break
  end
end
