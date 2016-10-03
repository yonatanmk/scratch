require 'HTTParty'
require 'Nokogiri'
require 'Pry'
require 'gruff'

require './PollData.rb'
require './DrawPollGraph.rb'
require './filters.rb'
#_______________________________________________________________________________
data = PollData.new
graph = DrawPollGraph.new(data)

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
  action = action_filter3
  if action == "1"
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
      action2 = action_filter6
      if action2 == "1"
        while true
          system 'clear'
          puts 'Election 2016 Polls'
          puts "Polls by Date"
          puts
          puts "Please enter a date within the past month."
          puts 'Type "back" if you want to go back.'
          date = get_date(data)
          if date == "back"
            break
          else
            data.print_polls_date(date)
            gets
          end
        end
      elsif action2 == "2"
        while true
          system 'clear'
          puts 'Election 2016 Polls'
          puts "Polls by State"
          puts
          puts "Please enter a state."
          puts 'Type "back" if you want to go back.'
          state = get_state(data)
          if state == "back"
            break
          else
            data.print_polls_state(state)
            gets
          end
        end
      elsif action2 == "3"
        data.print_polls_general
        gets
      elsif action2 == "4"
        data.print_polls_swing
        gets
      elsif action2 == "5"
        data.print_polls_all
        gets
      else
        break
      end
    end #end action == 1 action2 loop
  elsif action == "2"
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
      action2 = action_filter7
      if action2 == "1"
      elsif action2 == "2"
      elsif action2 == "3"
      elsif action2 == "4"
      elsif action2 == "5"
      elsif action2 == "6"
        graph.draw_general
        gets
      else
        break
      end
    end #end action == 2 action2 loop
  else
    break
  end #end action loop
end #end overall loop

# data = PollData.new
# graph = DrawPollGraph.new(data)
#
# graph.draw
