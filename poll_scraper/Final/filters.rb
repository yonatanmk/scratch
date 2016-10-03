require 'Pry'
require './PollData.rb'

def action_filter3
  while true
    action = gets.chomp.downcase
    if action == "1"
      return "1"
    elsif action == "2"
      return "2"
    elsif action == "3" || action == "exit"
      return "3"
    else
      puts "Please enter 1, 2, or 3."
    end
  end
end

def action_filter6
  while true
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
    end
  end
end

def action_filter7
  while true
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
    end
  end
end

def get_date(data)
  date_array = []
  data.date_array.each do |date|
    date_array << date.split(" ")[1..2].join(" ")
  end
  while true
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
    end
  end
end

def get_state(data)
  state_array = []
  data.race_array.each do |day|
    day.each do |poll_location|
      state_array << poll_location if poll_location != "General Election" && !state_array.include?(poll_location)
    end
  end
  while true
    state = gets.chomp.split.map(&:capitalize).join(' ')
    if state_array.include?(state)
      return state
    elsif state == "Back"
      return "back"
    else
      puts "Apologies, we do not have any poll data for that state."
    end
  end
end

# data = PollData.new
#
# state_array = []
# data.race_array.each do |day|
#   day.each do |poll_location|
#     state_array << poll_location if poll_location != "General Election" && !state_array.include?(poll_location)
#   end
# end
