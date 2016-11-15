require 'colorize'

String.colors.each do |color|
  puts color.to_s.colorize(color)
end
