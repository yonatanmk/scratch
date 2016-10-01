require 'date'
require 'httparty'
require 'pry'
#________________________________________________________________________________________________________________________________________________________________________________________________________
#Formatting API URL

client_id = 'HSQ1PZB2IWJEYMEG5MHORWA3UGXS0U1BGJWPYLBOZRJGGX4A'
client_secret = '0OSNZMMGR330RMOVJEUWQVNZKSHDVKYEYFV0AEQTIA1GZ2LB'

request_date = DateTime.now.to_s[0..9].delete!("-")

base_url = 'https://api.foursquare.com/v2/'
search_endpoint = 'venues/search?'
categories_endpoint = 'venues/categories?'

location=gets.chomp.capitalize

params = "near=#{location}"
#params = "ll=42.3,-71.2"
radius = "&radius=16000"
limit = "&limit=500"
query = "&query=Food"
intent = "&intent=browse"

auth = "&client_id=#{client_id}&client_secret=#{client_secret}&v=#{request_date}"

search_url = base_url + search_endpoint + params + limit + intent + auth
#search_url = base_url + search_endpoint + params + radius + limit + intent + auth         #API URL for searching locations near X
categories_url = base_url + categories_endpoint + auth                          #API URL for list of venue categories

#binding.pry
#________________________________________________________________________________________________________________________________________________________________________________________________________
#Creating Arrays of different data
search_data = HTTParty.get(search_url)
search_venues = search_data["response"]["venues"]

categories_data = HTTParty.get(categories_url)

food_category_list = []                                                           #List of different food categories
categories_data["response"]["categories"][3]["categories"].each do |category|
  food_category_list << category["name"]
end

food_venues = []                                                                  #List of venues that serve food
(0..search_venues.length-2).each do |venue_num|
  if search_venues[venue_num].class.to_s == "Hash" && search_venues[venue_num]["categories"][0] != nil && food_category_list.include?(search_venues[venue_num]["categories"][0]["name"])
    food_venues << search_venues[venue_num]
  end
end

food_venue_names = []                                                             #List of food venues names
food_venues.each do |venue|
  food_venue_names << venue["name"]
  puts "#{venue['name']}\t\t#{venue['location']['address']}\t\t#{venue['categories'][0]['name']}"
  # print venue['name']
  # if venue['name'].length < 7
  #   print "\t\t"
  # else
  #   print "\t"
  # end
  # print venue['location']['address']
  #
  # if venue['location']['address'] = nil
  #   print "\t\t\t\t"
  # elsif venue['location']['address'].length < 7
  #   print "\t\t"
  # else
  #   print "\t"
  # end
  # puts venue['categories'][0]['name']

end

# print venue['name']
# if venue['name'] = nil
#   print "\t\t\t\t"
# elsif venue['name'].length < 7
#   print "\t\t"
# else
#   print "\t"
# end
# print venue['location']['address']
# if venue['location']['address'] = nil
#   print "\t\t\t\t"
# elsif venue['location']['address'].length < 7
#   print "\t\t"
# else
#   print "\t"
# end
# puts venue['categories'][0]['name']


#binding.pry
