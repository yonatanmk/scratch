class Team
  attr_reader :name
  attr_accessor :season_score
  def initialize name, score
    @name = name
    @season_score = score
  end
end

array = [Team.new("Yankees", 7), Team.new("White Sox", 4), Team.new("Red Sox", 8), Team.new("Cardinals", 20), Team.new("Mets", 106), Team.new("Diamondbacks", 4)]


array.sort_by!{|item| [item.season_score, item.name]}
array.reverse!

array.each do |team|
  if team.name.length > 7
    puts "#{team.name}\t#{team.season_score}"
  else
    puts "#{team.name}\t\t#{team.season_score}"
  end
end
