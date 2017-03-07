# require 'date'
class Mirror
  attr_reader :response
  def initialize
    @response = 1
  end
  def echo
    print "enter something: "
    @response = gets.chomp
  end
end

# class Birthday
#
#  def is_it_your_birthday?
#   today = Date.today.strftime("%m/%d")
#   puts "When is your birthday (mm/dd)?"
#   puts gets.chomp == today ? "Happy Birthday!" : "It is just another day,then."
#  end
#
# end

# day = Birthday.new
#
# day.is_it_your_birthday?
