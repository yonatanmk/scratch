require 'Pry'

def action_filter3
  while true
    system 'clear'
    puts 'Election 2016 Polls'
    puts 'Main Menu'
    puts
    puts "What would you like to do?"
    puts
    puts "1. View Poll Data"
    puts "2. Graph Poll Data"
    puts "3. Exit"
    action = gets.chomp.downcase
    if action == "1"
      return "1"
    elsif action == "2"
      return "2"
    elsif action == "3" || action == "exit"
      return "3"
    else
      puts "Please enter 1, 2, or 3."
      gets
    end
  end
end

def action_filter6
  while true
    system 'clear'
    puts 'Election 2016 Polls'
    puts "View Poll Data"
    puts
    puts "What polls would you like to view?"
    puts
    puts "1. Polls by Date"
    puts "2. Polls by State"
    puts "3. General Election Polls"
    puts "4. Swing State Polls"
    puts "5. All Polls"
    puts "6. Back"
    action = gets.chomp.downcase
    if action == "1"
      return "1"
    elsif action == "2"
      return "2"
    elsif action == "3"
      return "3"
    elsif action == "4"
      return "4"
    elsif action == "5"
      return "5"
    elsif action == "6" || action == "back"
      return "6"
    else
      puts "Please enter 1, 2, 3, 4, 5, or 6."
      gets
    end
  end
end

def action_filter7
  while true
    system 'clear'
    puts 'Election 2016 Polls'
    puts "Graph Poll Data"
    puts
    puts "What polls would you like to graph?"
    puts
    puts "1. Graph Poll Results within a State"
    puts "2. Graph Poll Spread within a State"
    puts "3. Graph Poll Results within Swing States"
    puts "4. Graph Poll Spread within Swing States"
    puts "5. Graph General Election Poll Results"
    puts "6. Graph General Election Poll Spread"
    puts "7. Back"
    action = gets.chomp.downcase
    if action == "1"
      return "1"
    elsif action == "2"
      return "2"
    elsif action == "3"
      return "3"
    elsif action == "4"
      return "4"
    elsif action == "5"
      return "5"
    elsif action == "6"
      return "6"
    elsif action == "7" || action == "back"
      return "7"
    else
      puts "Please enter 1, 2, 3, 4, 5, 6, or 7."
      gets
    end
  end
end

def get_date(data)
  date_array = []
  data.date_array.each do |date|
    date_array << date.split(" ")[1..2].join(" ")
  end
  while true
    system 'clear'
    puts 'Election 2016 Polls'
    puts "Polls by Date"
    puts
    puts "Please enter a date within the past month."
    puts 'Type "back" if you want to go back.'
    date = gets.chomp.capitalize
    date = date.split(" ")
    date[1].insert(0,"0") if date[1] && date[1].length == 1
    date = date.join(" ")
    if date_array.include?(date)
      return date
    elsif date == "Back"
      return "back"
    else
      puts "Apologies, we do not have any poll data for that date."
      gets
    end
  end
end

def get_state(data, description)
  state_array = []
  data.race_array.each do |day|
    day.each do |poll_location|
      state_array << poll_location if poll_location != "General Election" && !state_array.include?(poll_location)
    end
  end
  while true
    system 'clear'
    puts 'Election 2016 Polls'
    puts description
    puts
    puts "Please enter a state."
    puts 'Type "back" if you want to go back.'
    state = gets.chomp.split.map(&:capitalize).join(' ')
    if state_array.include?(state)
      return state
    elsif state == "Back"
      return "back"
    else
      puts "Apologies, we do not have any poll data for that state."
      gets
    end
  end
end
