require 'gruff'
require 'csv'
require 'Pry'

google = CSV.read('graph_data.csv', headers: true)

graph = Gruff::Line.new(1000)
graph.title = 'Election 2016 Polls'

x_axis = []
google.each { |row|  x_axis << row['Date'] }

#Pry.start(binding)

start_date = x_axis.min
middle_date = x_axis[(x_axis.length ) / 2]
end_date = x_axis.max

graph.labels = { 0 => start_date, 50 => middle_date, 100 => end_date }

graph.data('Clinton', google.collect { |x| x['Clinton'].to_i }, '#179EE0')
graph.data('Trump', google.collect{ |x| x['Trump'].to_i }, '#FF5D40' )
graph.data('Spread', google.collect { |x| x['Spread'].to_i }, '#999999')

graph.x_axis_label = 'Date'
graph.y_axis_label = 'Points'

graph.write('Election_2016_Polls.png')
Pry.start(binding)
