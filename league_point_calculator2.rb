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

  def input_processor
    while true
      game_result = gets.chomp
      game_result_array = game_result.split
      num_check = false
      if game_result_array.length < 4
        puts 'Please enter scores in the format "Team1 score Team2 score"'
      else
        game_result_array[0].split("").each do |x|
          if x.to_i.to_s == x
            num_check = true
          end
        end
        game_result_array[2].split("").each do |x|
          if x.to_i.to_s == x
            num_check = true
          end
        end
        if num_check == true
          puts "Team names cannot have numbers."
        elsif game_result_array[1].to_i.to_s == game_result_array[1] and game_result_array[3].to_i.to_s == game_result_array[3] and game_result_array.length == 4
          break
        else
          puts 'Please enter scores in the format "Team1 score Team2 score"'
        end
      end
    end
    if not @roster.include?game_result_array[0].downcase
      @roster.store(game_result_array[0], (Team.new game_result_array[0].capitalize))
    end
    if not @roster.include?game_result_array[2].downcase
      @roster.store(game_result_array[2], (Team.new game_result_array[2].capitalize))
    end
    @roster.each do |key, value|
      if key == game_result_array[0].downcase
        if game_result_array[1].to_i > game_result_array[3].to_i
          value.season_score += 3
        elsif game_result_array[1].to_i == game_result_array[3].to_i
          value.season_score += 1
        end
      end
      if key == game_result_array[2].downcase
        if game_result_array[3].to_i > game_result_array[1].to_i
          value.season_score += 3
        elsif game_result_array[1].to_i == game_result_array[3].to_i
          value.season_score += 1
        end
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
    puts "Team Name\tScore"
    @roster.each do |key, team|
      if team.name.length > 7
        puts "#{team.name}\t#{team.season_score}"
      else
        puts "#{team.name}\t\t#{team.season_score}"
      end
    end
  end

  def delete_team
    team = gets.chomp
  end

end
#________________________________________
def replay
  while true
    puts "Do you have more to do? (yes or no)"
    play_again_answer = gets.chomp.downcase
    puts
    if play_again_answer == "y" || play_again_answer == "yes"
      return true
    elsif play_again_answer == "n" || play_again_answer == "no"
      return false
    else
      puts "Please only enter yes or no."
    end
  end
end

def action_filter
  while true
  action = gets.chomp
    if action == "1"
      return "1"
    elsif action == "2"
      return "2"
    elsif action == "3"
    else
      puts "Please enter 1, 2, or 3."
    end
  end
end

#_________________________________________
system "clear"
season = Season.new

while true
  puts "What would you like to do?"
  puts "1. Input Game Results."
  puts "2. View League Rankings."
  puts "3. Delete a Team From the Roster."
  action = action_filter
  puts
  if action == "1"
    puts "Please enter the final scores of a game."
    season.input_processor
    puts
    season.organize_roster
    season.display_roster
    puts
  elsif action == "2"
    season.display_roster
    puts
  elsif action == "3"

  end
  unless replay
    break
  end
end
