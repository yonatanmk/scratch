require 'Pry'

require './PollData.rb'
require './DrawPollGraph.rb'
require './filters.rb'

class PollWebscraper
  attr_reader :data, :graph

  def initialize
    @data = PollData.new
    @graph = DrawPollGraph.new(@data)
  end

  def start
    while true
      action = action_filter3
      if action == "1"
        while true
          action2 = action_filter7
          if action2 == "1"
            while true
              date = get_date(@data)
              if date == "back"
                break
              elsif date == "exit"
                exit
              else
                @data.print_polls("date", date)
                gets
              end
            end
          elsif action2 == "2"
            while true
              state = get_state(@data, "Polls by State")
              if state == "back"
                break
              elsif state == "exit"
                exit
              else
                @data.print_polls("state", state)
                gets
              end
            end
          elsif action2 == "3"
            @data.print_polls("general", "NONE")
            gets
          elsif action2 == "4"
            @data.print_polls("swing", "NONE")
            gets
          elsif action2 == "5"
            @data.print_polls("all", "NONE")
            gets
          elsif action2 == "6"
            break
          else
            exit
          end
        end
      elsif action == "2"
        while true
          action2 = action_filter8
          if action2 == "1"
            while true
              state = get_state(@data, "Graph Poll Results within a State")
              if state == "back"
                break
              elsif state == "exit"
                exit
              else
                @graph.create_graph_data("not_swing", state)
                @graph.draw("state", "results", state)
                gets
              end
            end
          elsif action2 == "2"
            while true
              state = get_state(@data, "Graph Poll Spread within a State")
              if state == "back"
                break
              elsif state == "exit"
                exit
              else
                @graph.create_graph_data("not_swing", state)
                @graph.draw("state", "spread", state)
                gets
              end
            end
          elsif action2 == "3"
            @graph.draw("swing_state", "results", "NONE")
            gets
          elsif action2 == "4"
            @graph.draw("swing_state", "spread", "NONE")
            gets
          elsif action2 == "5"
            @graph.draw("general", "results", "NONE")
            gets
          elsif action2 == "6"
            @graph.draw("general", "spread", "NONE")
            gets
          elsif action2 == "7"
            break
          else
            exit
          end
        end
      else
        break
      end
    end
  end

end

polls = PollWebscraper.new
polls.start
