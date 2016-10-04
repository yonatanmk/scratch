require 'gruff'

g = Gruff::Line.new
g.title = "A Line Graph"
g.data 'Fries', [20, 23, 19, 8]
g.data 'Hamburgers', [50, 19, 99, 29]

g.minimum_value = 0
g.maximum_value = 100

g.write("/Users/yehonatanmeschede-krasa/Desktop/line.png")
