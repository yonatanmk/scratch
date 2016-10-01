require 'date'
require 'httparty'

request_date = DateTime.now.to_s[0..9].delete!("-")
puts request_date

response = HTTParty.get("https://data.cityofnewyork.us/resource/hc8x-tcnd.json")
