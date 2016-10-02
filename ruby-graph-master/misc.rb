require 'Pry'

data = File.read('data.txt')


# Break into array, e.g. [["Jan", 1], ["Feb", 19], etc]
array ||= data.split(/\n/).reject{ |s| s.nil? || s == "" }.map{ |s| s.strip.split(/\s+/) }
array.each_index do |date|
  array[date][0] = array[date][0] + " " + array[date][1]
  array[date].delete_at(1)
end

Pry.start(binding)
