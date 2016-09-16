class Team
  attr_reader :name
  attr_accessor :season_score
  def initialize name
    @name = name
    @season_score = 0
  end
end

class Season
  attr_reader :roster
  def initialize
    @roster = {}
  end

  def add_team name, score
    @roster.store(name.downcase, (Team.new name.split.map(&:capitalize).join(" ")))
    @roster.each do |key, value|
      if key == name.downcase
        value.season_score += score
      end
    end
  end

  def organize_roster
    team_rankings = []
    @roster.each do |key, value|
      team_rankings << value
    end
    team_rankings.sort_by!{|team| team.season_score}
    team_rankings.reverse!
    team_rankings.length.times do
      team_rankings.each do |team|
        if team_rankings[team_rankings.index(team) + 1].class.to_s != "NilClass" and team_rankings[team_rankings.index(team) + 1].season_score == team.season_score
          if team.name > team_rankings[team_rankings.index(team) + 1].name
            team_rankings.insert(team_rankings.index(team), team_rankings.delete_at(team_rankings.index(team) + 1))
          end
        end
      end
    end
    @roster = {}
    team_rankings.each do |team|
      @roster.store(team.name.downcase, team)
    end
  end

  def display_roster
    @roster.each do |key, team|
      if team.name.length > 7
        puts "#{team.name}\t#{team.season_score}"
      else
        puts "#{team.name}\t\t#{team.season_score}"
      end
    end
  end
end
#________________________________________________________________
season = Season.new

season.add_team "Yankees", 3
season.add_team "Red Sox", 7
season.add_team "Cardinals", 4
season.add_team "Mets", 3
season.add_team "Diamondbacks", 5
season.add_team "Astros", 1
season.add_team "White Sox", 3

season.roster.each do |key, team|
  if team.name.length > 7
    puts "#{team.name}\t#{team.season_score}"
  else
    puts "#{team.name}\t\t#{team.season_score}"
  end
end
puts

season.organize_roster

season.display_roster
