require 'HTTParty'
require 'Nokogiri'
require 'Pry'
require 'gruff'

class DrawPollGraph
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def draw_general
    graph = Gruff::Line.new(1400)
    graph.title = 'Election 2016 Polls'

    x_axis = []
    (1..@data.general_graph_data.length).each do |x|
      x_axis << x
    end

    start_date = @data.general_graph_data.first[0]
    middle_date = @data.general_graph_data[@data.general_graph_data.length / 2][0]
    end_date = @data.general_graph_data.last[0]

    graph.labels = { 0 => start_date, 14 => middle_date, 29 => end_date }

    graph.data('Clinton', @data.clinton_scores, '#179EE0')
    graph.data('Trump', @data.trump_scores, '#FF5D40' )
    graph.data('Spread', @data.spread_list, '#999999')

    graph.x_axis_label = 'Date'
    graph.y_axis_label = 'Points'

    graph.write('/Users/yehonatanmeschede-krasa/Desktop/Election_2016_Polls.png')
    puts "The graph has been outputted to your desktop."
    gets
  end

end
