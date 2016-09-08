class Animal
  attr_accessor :predator, :age, :species, :name
  attr_reader :dead

  def initialize predator, age, species, name
    @predator - predator
    @age = age
    @species = species
    @name = name
    @dead = false
  end

  def birthday
    age = age + 1
  end

  def hunt
    if predator
      puts "You hunt and kill"
    else
      puts "You not a predator. You dont hunt"
    end
  end

  def swim
    if species = "bulldog"
      dead = "true"
    else
      puts "You have a nice swim"
    end
  end

  def bite
    if age < 50
      puts "Ouch"
    else
      puts "You lost your teeth long ago"
    end
  end

  def fight opponent
    if opponent.dead
      puts "You are fighting a corpse"
    else
      if self.predator && opponent.predator
        puts "You fight to a standstill"
      elsif !self.predator && opponent.predator
        @dead = true
        puts "You were killed for challenging a predator"
      elsif self.predator && !opponent.predator
        puts "You scared it off"
      else
        puts "Nothing happens. You are both pacifists."
      end
    end
  end

end
