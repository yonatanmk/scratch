class Person
  attr_accessor :name, :age, :political_affiliation

  def initialize name, age, political_affiliation
    self.name = name
    self.age = age
    self.political_affiliation = political_affiliation
    self.say_hello
  end

  def say_hello
    puts "Hello. My name is #{self.name}. I am #{self.age} years old and I am a #{self.political_affiliation}"
  end

  def death
    puts "You have killed me"
  end

  def age
    age = age + 1
    puts "I am one year closer to death. I am now #{self.age}"
  end
end
