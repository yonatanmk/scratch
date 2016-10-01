require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'csv'

page = HTTParty.get('https://newyork.craigslist.org/search/pet?s=0')

parse_page = Nokogiri::HTML(page)

pets_array = []

File.open('pets.html', 'w') { |file| file.write(parse_page) }

Pry.start(binding)
