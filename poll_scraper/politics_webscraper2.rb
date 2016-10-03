require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'csv'

page = HTTParty.get('http://www.realclearpolitics.com/epolls/latest_polls/president/')

parse_page = Nokogiri::HTML(page)

date_array = []
race_array = []
pollster_array = []
results_array = []
spread_array = []

date_count = parse_page.css('.table-races').xpath('//table').length / 2 - 1
(0..(parse_page.css('.table-races').xpath('//table').length - 1)).each do |table_num|
  if table_num % 2 == 0
    date_array << [date_count, parse_page.css('.table-races').xpath('//table')[table_num].children.children.text.strip]                       #Fills date_array with values from site
    date_count -= 1
  else
    day_races = []                                                                                                              #Fills race_array with values from site
    parse_page.css('.table-races').xpath('//table')[table_num].css('.lp-race a').each do |race|
      day_races << race.text.delete(":")
    end
    race_array << day_races
    day_polls = []                                                                                                              #Fills race_array with values from site
    parse_page.css('.table-races').xpath('//table')[table_num].css('.lp-poll a').each do |pollster|
      day_polls << pollster.text
    end
    pollster_array << day_polls
    day_results = []                                                                                                             #Fills results_array with values from site
    parse_page.css('.table-races').xpath('//table')[table_num].css('.lp-results a').each do |result|
      day_results << result.text.delete(",")
    end
    results_array << day_results
    day_spread = []                                                                                                            #Fills spread_array with values from site
    parse_page.css('.table-races').xpath('//table')[table_num].children.children.children.children.children.each do |result|
      day_spread << result.text.strip
    end
    spread_array << day_spread
  end
end

date_array.each_index do |date_num|               #makes day number double digits
  edited_date = date_array[date_num][1].split(" ")
  edited_date[2].insert(0,"0") if edited_date[2].length == 1
  date_array[date_num][1] = edited_date.join(" ")
end

#Pry.start(binding)

race_array.each_index do |day_races_num|                                                                                        #edits race_array to only show race locations
  race_array[day_races_num].each_index do |race_num|
    if race_array[day_races_num][race_num].split(" ")[0] == "General" || race_array[day_races_num][race_num].split(" ")[0] == "New" || race_array[day_races_num][race_num].split(" ")[0] == "North" || race_array[day_races_num][race_num].split(" ")[0] == "South" || race_array[day_races_num][race_num].split(" ")[0] == "West" || race_array[day_races_num][race_num].split(" ")[0] == "Rhode"
      race_array[day_races_num][race_num] = race_array[day_races_num][race_num].split(" ")[0] + " " + race_array[day_races_num][race_num].split(" ")[1]
    else
      race_array[day_races_num][race_num] = race_array[day_races_num][race_num].split(" ")[0]
    end
  end
end

results_array.each_index do |day_results_num|                                                                                   #edits results_array to only show clinton, trump w/ clinton first
  results_array[day_results_num].each_index do |result_num|
    results_array[day_results_num][result_num] = results_array[day_results_num][result_num].split(" ")[0..3].join(" ")
    if results_array[day_results_num][result_num].split(" ")[0] == "Trump"
      reordered_result = []
      reordered_result << results_array[day_results_num][result_num].split(" ")[2]
      reordered_result << results_array[day_results_num][result_num].split(" ")[3]
      reordered_result << results_array[day_results_num][result_num].split(" ")[0]
      reordered_result << results_array[day_results_num][result_num].split(" ")[1]
      results_array[day_results_num][result_num] = reordered_result.join(" ")
    end
  end
end

date_array.reverse!     #reverse arrays so you see the most recent first
race_array.reverse!
pollster_array.reverse!
results_array.reverse!
spread_array.reverse!

def print_polls(parse_page, date_array, race_array, pollster_array, results_array, spread_array)
  puts "-----------------------------------------------------------------------------------------------------------"
  (0..(parse_page.css('.table-races').xpath('//table').length / 2 - 1)).each do |print_num|
    puts date_array[print_num][1]                                                  #Printing Date
    puts
    puts "Poll Location\t\t\tPollster\t\t\tPoll Results\t\t\tPoll Spread"
    puts
    (0..race_array[print_num].length - 1).each do |race_num|
      if race_array[print_num][race_num].length < 8                             #Printing Race Location
        print "#{race_array[print_num][race_num]}\t\t\t\t"
      elsif race_array[print_num][race_num].length < 16
        print "#{race_array[print_num][race_num]}\t\t\t"
      else
        print "#{race_array[print_num][race_num]}\t\t"
      end
      if pollster_array[print_num][race_num].length < 8                         #Printing Pollster Name
        print "#{pollster_array[print_num][race_num]}\t\t\t\t"
      elsif pollster_array[print_num][race_num].length < 16
        print "#{pollster_array[print_num][race_num]}\t\t\t"
      elsif pollster_array[print_num][race_num].length < 24
        print "#{pollster_array[print_num][race_num]}\t\t"
      else
        print "#{pollster_array[print_num][race_num]}\t"
      end
      print "#{results_array[print_num][race_num].split(" ")[0..1].join(" ")}: #{results_array[print_num][race_num].split(" ")[2..3].join(" ")}\t\t"                       #Printing Results
      puts spread_array[print_num][race_num]                                    #Printing Poll Spread
    end
    puts "-----------------------------------------------------------------------------------------------------------"
  end
end

#print_polls(parse_page, date_array, race_array, pollster_array, results_array, spread_array)               #******************PRINT****************



poll_list = []
general_graph_data = []
general_graph_data_avg = []

(0..29).each do |array_num|
  race_array[array_num].each_index do |poll_num|
    row = []
    row << date_array[array_num][1]
    row << race_array[array_num][poll_num]
    row << pollster_array[array_num][poll_num]
    row << results_array[array_num][poll_num]
    row << spread_array[array_num][poll_num]
    poll_list << row
  end
end

(0..29).each do |array_num|
  row = []
  row << "#{date_array[array_num][1].split(" ")[1][0..2]} #{date_array[array_num][1].split(" ")[2]}"
  clinton_scores = []
  trump_scores = []
  score_sum = 0
  results_array[array_num].each_index do |poll_num|
    if race_array[array_num][poll_num] == "General Election"
      clinton_scores << results_array[array_num][poll_num].split(" ")[1].to_f
      score_sum += results_array[array_num][poll_num].split(" ")[1].to_f
    end
  end
  row << (score_sum / clinton_scores.length).round(1) unless score_sum == 0
  score_sum = 0
  results_array[array_num].each_index do |poll_num|
    if race_array[array_num][poll_num] == "General Election"
      trump_scores << results_array[array_num][poll_num].split(" ")[3].to_f
      score_sum += results_array[array_num][poll_num].split(" ")[3].to_f
    end
  end
  row << (score_sum / trump_scores.length).round(1) unless score_sum == 0
  row << (row[1] - row[2]).round(1) if row[1]
  general_graph_data << row if row[1]
end

Pry.start(binding)

CSV.open("/Users/yehonatanmeschede-krasa/Desktop/scratch/poll_scraper/poll_list.csv", 'w') do |csv_object|
  poll_list.each do |row_array|
    csv_object << row_array
  end
end

CSV.open("/Users/yehonatanmeschede-krasa/Desktop/scratch/poll_scraper/graph_data.csv", 'w') do |csv_object|
  csv_object << ["Date", "Clinton", "Trump", "Spread"]
  general_graph_data.each do |row_array|
    csv_object << row_array
  end
end
