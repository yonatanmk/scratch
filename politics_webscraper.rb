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

(0..(parse_page.css('.table-races').xpath('//table').length - 1)).each do |table_num|
  if table_num % 2 == 0
    date_array << parse_page.css('.table-races').xpath('//table')[table_num].children.children.text.strip                       #Fills date_array with values from site
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

race_array.each_index do |day_races_num|                                                                                        #edits race_array to only show race locations
  race_array[day_races_num].each_index do |race_num|
    if race_array[day_races_num][race_num].split(" ")[0] == "General" || race_array[day_races_num][race_num].split(" ")[0] == "New" || race_array[day_races_num][race_num].split(" ")[0] == "North" || race_array[day_races_num][race_num].split(" ")[0] == "South" || race_array[day_races_num][race_num].split(" ")[0] == "West" || race_array[day_races_num][race_num].split(" ")[0] == "Rhode"
      race_array[day_races_num][race_num] = race_array[day_races_num][race_num].split(" ")[0] + " " + race_array[day_races_num][race_num].split(" ")[1]
    else
      race_array[day_races_num][race_num] = race_array[day_races_num][race_num].split(" ")[0]
    end
  end
end

results_array.each_index do |day_results_num|
  results_array[day_results_num].each_index do |result_num|
    results_array[day_results_num][result_num] = results_array[day_results_num][result_num].split(" ")[0..3].join(" ")
  end
end

#Pry.start(binding)

def print_polls(parse_page, date_array, race_array, pollster_array, results_array, spread_array)
  puts "-------------------------------------------"
  (0..(parse_page.css('.table-races').xpath('//table').length / 2 - 1)).each do |print_num|
    puts date_array[print_num]                                                  #Printing Date
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
      print "#{results_array[print_num][race_num]}\t\t"                       #Printing Results
      puts spread_array[print_num][race_num]                                   #Printing Poll Spread
    end


    # (0..race_array[print_num].length - 1).each do |race_num|                 #Printing Poll Results
    #   if race_num == 0
    #     print "#{pollster_array[print_num]}\t\t"
    #     puts results_array[print_num][result_num]
    #   else
    #     puts "\t\t\t\t#{results_array[print_num][result_num]}"
    #   end
    # end
    puts "-----------------------------------------------------------------------------------------------------------"
  end
end



print_polls(parse_page, date_array, race_array, pollster_array, results_array, spread_array)

#Pry.start(binding)



#parse_page.css('.table-races').xpath('//table')[1].at_css('.lp-poll a').children.text

# print parse_page.css('.table-races').xpath('//table')[3].children.children.children.children.children.text.strip
# puts
# print parse_page.css('.table-races').xpath('//table')[3].children.children.children.children.children.text.strip.split(" ")
