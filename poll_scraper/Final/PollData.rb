require 'HTTParty'
require 'Nokogiri'
require 'Pry'

class PollData
  attr_reader :page, :parse_page, :date_array, :race_array, :pollster_array, :results_array, :spread_array, :poll_list, :swing_states

  def initialize
    @page = HTTParty.get('http://www.realclearpolitics.com/epolls/latest_polls/president/')
    @parse_page = Nokogiri::HTML(@page)
    @date_array = []
    @race_array = []
    @pollster_array = []
    @results_array = []
    @spread_array = []

    @poll_list = []             #just a tool to help with debuggin, ignore
    @swing_states = ["Arizona", "New Mexico", "Colorado", "Iowa", "Wisconsin", "Ohio", "New Hampshire", "Pennsylvania", "Virginia", "North Carolina", "Georgia", "Florida" ]

    (0..(@parse_page.css('.table-races').xpath('//table').length - 1)).each do |table_num|
      if table_num % 2 == 0
        @date_array << @parse_page.css('.table-races').xpath('//table')[table_num].children.children.text.strip                      #Fills date_array with values from site
      else
        day_races = []                                                                                                              #Fills race_array with values from site
        @parse_page.css('.table-races').xpath('//table')[table_num].css('.lp-race a').each do |race|
          day_races << race.text.delete(":")
        end
        @race_array << day_races
        day_polls = []                                                                                                              #Fills race_array with values from site
        @parse_page.css('.table-races').xpath('//table')[table_num].css('.lp-poll a').each do |pollster|
          day_polls << pollster.text
        end
        @pollster_array << day_polls
        day_results = []                                                                                                             #Fills results_array with values from site
        @parse_page.css('.table-races').xpath('//table')[table_num].css('.lp-results a').each do |result|
          day_results << result.text.delete(",")
        end
        @results_array << day_results
        day_spread = []                                                                                                            #Fills spread_array with values from site
        @parse_page.css('.table-races').xpath('//table')[table_num].children.children.children.children.children.each do |result|
          day_spread << result.text.strip
        end
        @spread_array << day_spread
      end
    end

    @date_array.each_index do |date_num|               #makes day number double digits
      edited_date = @date_array[date_num].split(" ")
      edited_date[2].insert(0,"0") if edited_date[2].length == 1
      @date_array[date_num] = edited_date.join(" ")
    end

    @race_array.each_index do |day_races_num|                                                                                        #edits race_array to only show race locations
      @race_array[day_races_num].each_index do |race_num|
        if @race_array[day_races_num][race_num].split(" ")[0] == "General" || @race_array[day_races_num][race_num].split(" ")[0] == "New" || @race_array[day_races_num][race_num].split(" ")[0] == "North" || @race_array[day_races_num][race_num].split(" ")[0] == "South" || @race_array[day_races_num][race_num].split(" ")[0] == "West" || @race_array[day_races_num][race_num].split(" ")[0] == "Rhode"
          @race_array[day_races_num][race_num] = @race_array[day_races_num][race_num].split(" ")[0] + " " + @race_array[day_races_num][race_num].split(" ")[1]
        else
          @race_array[day_races_num][race_num] = @race_array[day_races_num][race_num].split(" ")[0]
        end
      end
    end

    @results_array.each_index do |day_results_num|                                                                                   #edits results_array to only show clinton, trump w/ clinton first
      @results_array[day_results_num].each_index do |result_num|
        @results_array[day_results_num][result_num] = @results_array[day_results_num][result_num].split(" ")[0..3].join(" ")
        if @results_array[day_results_num][result_num].split(" ")[0] == "Trump"
          @reordered_result = []
          @reordered_result << @results_array[day_results_num][result_num].split(" ")[2]
          @reordered_result << @results_array[day_results_num][result_num].split(" ")[3]
          @reordered_result << @results_array[day_results_num][result_num].split(" ")[0]
          @reordered_result << @results_array[day_results_num][result_num].split(" ")[1]
          @results_array[day_results_num][result_num] = @reordered_result.join(" ")
        end
      end
    end

    @date_array.reverse!     #reverse arrays so you see the most recent first
    @race_array.reverse!
    @pollster_array.reverse!
    @results_array.reverse!
    @spread_array.reverse!

    (0..29).each do |array_num|                               #creates a list of each poll
      @race_array[array_num].each_index do |poll_num|
        row = []
        row << date_array[array_num]
        row << race_array[array_num][poll_num]
        row << pollster_array[array_num][poll_num]
        row << results_array[array_num][poll_num]
        row << spread_array[array_num][poll_num]
        @poll_list << row
      end
    end


  end   #end initialize

  def print_polls(type, input)
    puts "-----------------------------------------------------------------------------------------------------------"
    (0..(@parse_page.css('.table-races').xpath('//table').length / 2 - 1)).each do |print_num|
      if type == "all" || @race_array[print_num].include?("General Election") && type == "general" || @race_array[print_num].any? {|state| @swing_states.include?(state)} && type == "swing" || @date_array[print_num].split(" ")[1..2].join(" ") == input && type == "date" || @race_array[print_num].include?(input) && type == "state"
        puts @date_array[print_num]                                                  #Printing Date
        puts
        puts "Poll Location\t\t\tPollster\t\t\tPoll Results\t\t\tPoll Spread"
        puts
        (0..@race_array[print_num].length - 1).each do |race_num|
          if type == "all" || @race_array[print_num][race_num] == "General Election" && type == "general" || @swing_states.include?(@race_array[print_num][race_num]) && type == "swing" || type == "date" || @race_array[print_num][race_num] == input && type == "state"
            if @race_array[print_num][race_num].length < 8                             #Printing Race Location
              print "#{@race_array[print_num][race_num]}\t\t\t\t"
            elsif @race_array[print_num][race_num].length < 16
              print "#{@race_array[print_num][race_num]}\t\t\t"
            else
              print "#{@race_array[print_num][race_num]}\t\t"
            end
            if @pollster_array[print_num][race_num].length < 8                         #Printing Pollster Name
              print "#{@pollster_array[print_num][race_num]}\t\t\t\t"
            elsif @pollster_array[print_num][race_num].length < 16
              print "#{@pollster_array[print_num][race_num]}\t\t\t"
            elsif @pollster_array[print_num][race_num].length < 24
              print "#{@pollster_array[print_num][race_num]}\t\t"
            else
              print "#{@pollster_array[print_num][race_num]}\t"
            end
            print "#{@results_array[print_num][race_num].split(" ")[0..1].join(" ")}: #{@results_array[print_num][race_num].split(" ")[2..3].join(" ")}\t\t"                       #Printing Results
            puts @spread_array[print_num][race_num]                                    #Printing Poll Spread
          end
        end
        puts "-----------------------------------------------------------------------------------------------------------"
      end
    end
  end

end #end class

# Pry.start(binding)
