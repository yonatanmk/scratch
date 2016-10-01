require 'httparty'
require 'pry'

auth = '&oauth_consumer_key=DC0sePOBbQ8bYdC8r4Smg&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1475279465&oauth_nonce=669612049&oauth_version=1.0&oauth_token=769279003433771008-YvwoqgRKGtwen2nTgSPftghYjHDyGF9&oauth_signature=0KZadqs6DWo1dPsBKTg3%2BLa2GE8%3D'

user_id_url = 'https://api.twitter.com/1.1/users/show.json?screen_name=NASA&user_id=%09%2011348282' + auth

data = nasa_timeline = HTTParty.get(user_id_url)

print data.first
puts

binding.pry
