require 'Pry'
require 'gruff'

class DrawPollGraph
  attr_reader :data, :general_graph_data, :state_graph_data, :swing_graph_data, :edited_date_array

  def initialize(data)
    @data = data
    @general_graph_data = []
    @state_graph_data = []
    @swing_graph_data = []
    @edited_date_array = []

    @data.date_array.each do |date|
      @edited_date_array << "#{date.split(" ")[1][0..2]} #{date.split(" ")[2]}"
    end

    self.create_graph_data("not_swing", "General Election")
    self.create_graph_data("swing", "NONE")
  end

  def create_graph_data(type, state)
    graph_data = []
    count = 0
    (0..(@data.date_array.length - 1)).each do |array_num|                                 #fill general_graph_data array
      row = []
      row << count
      count += 1
      row << @edited_date_array[array_num]
      clinton_day_scores = []
      trump_day_scores = []
      score_sum = 0
      @data.results_array[array_num].each_index do |poll_num|
        if (@data.race_array[array_num][poll_num] == state && type == "not_swing") || (@data.swing_states.include?(@data.race_array[array_num][poll_num]) if type == "swing")
          clinton_day_scores << @data.results_array[array_num][poll_num].split(" ")[1].to_f
          score_sum += @data.results_array[array_num][poll_num].split(" ")[1].to_f
        end
      end
      if score_sum != 0
        row << (score_sum / clinton_day_scores.length).round(1)
      end
      score_sum = 0
      @data.results_array[array_num].each_index do |poll_num|
        if (@data.race_array[array_num][poll_num] == state && type == "not_swing") || (@data.swing_states.include?(@data.race_array[array_num][poll_num]) if type == "swing")
          trump_day_scores << @data.results_array[array_num][poll_num].split(" ")[3].to_f
          score_sum += @data.results_array[array_num][poll_num].split(" ")[3].to_f
        end
      end
      if score_sum != 0
        row << (score_sum / trump_day_scores.length).round(1)
      end
      row << (row[2] - row[3]).round(1) if row[2]
      graph_data << row
    end

    30.times do
      graph_data.each_index do |index|
        if graph_data[index].length == 2
          graph_data.delete_at(index)
        end
      end
    end

    if type == "not_swing"
      if state == "General Election"
        @general_graph_data = graph_data
      else
        @state_graph_data = graph_data
      end
    else type == "swing"
      @swing_graph_data = graph_data
    end
  end


  def draw(type, output, state)
    clinton_scores = []
    trump_scores = []
    spread_list = []
    title = ""
    file_title = ""

    if type == "general"
      dataset = @general_graph_data
      title = "General"
      file_title = "General"
    elsif type == "state"
      dataset = @state_graph_data
      title = state
      file_title = state.split(" ").join("_")
      if @state_graph_data.length == 1
        puts "Apologies, there is not enough poll data in #{state} to graph the poll #{output}."
        return
      end
    else
      dataset = @swing_graph_data
      title = "Swing States"
      file_title = "Swing_States"
    end

    dataset.each do |day|
      clinton_scores << day[2]
      trump_scores << day[3]
      spread_list << day[4]
    end

    graph = Gruff::Line.new(1400)

    x_axis = []
    dataset.each do |x|
      x_axis << x[0]
    end

    label_x_axis = []
    (dataset.first[0]..dataset.last[0]).each do |x|
      label_x_axis << x
    end

    start_date = @edited_date_array[label_x_axis.first]
    quarter_date = @edited_date_array[label_x_axis[label_x_axis.length / 4]]
    middle_date = @edited_date_array[label_x_axis[label_x_axis.length / 2 - 1]]
    three_quarter_date = @edited_date_array[label_x_axis[label_x_axis.length / 4 * 3]]
    end_date = @edited_date_array[label_x_axis.last]

    graph.labels = {
      label_x_axis.first => start_date,
      label_x_axis[label_x_axis.length / 4] => quarter_date,
      label_x_axis[label_x_axis.length / 2 - 1] => middle_date,
      label_x_axis[label_x_axis.length / 4 * 3] => three_quarter_date,
      label_x_axis.last => end_date
    }

    graph.x_axis_label = 'Date'
    graph.y_axis_label = 'Points'

    if output == "results"
      graph.title = "#{title} Election 2016 Poll Results"
      graph.dataxy('Clinton', x_data_points = x_axis, clinton_scores, color = '#179EE0')
      graph.dataxy('Trump', x_data_points = x_axis, trump_scores, color = '#FF5D40')
      graph.write("/Users/yehonatanmeschede-krasa/Desktop/#{file_title}_Election_2016_Polls.png")
    else
      graph.title = "#{title} Election 2016 Poll Spread"
      graph.dataxy('Spread', x_data_points = x_axis, spread_list, color = '#999999')
      graph.write("/Users/yehonatanmeschede-krasa/Desktop/#{file_title}_Election_2016_Poll_Spread.png")
    end

    puts "We have outputted the graph to your desktop."
  end

end
