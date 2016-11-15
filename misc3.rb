class Person
  attr_accessor :address
  
  def initialize(name)
    @name = name
  end

  def greet
    "Hi there, #{@name}!"
  end

  def part_ways
    "Bye now, #{@name}!"
  end


end
