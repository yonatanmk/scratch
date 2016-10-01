require 'httparty'
require 'pry'

auth = '&oauth_consumer_key=DC0sePOBbQ8bYdC8r4Smg&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1475277887&oauth_nonce=-259877318&oauth_version=1.0&oauth_token=769279003433771008-YvwoqgRKGtwen2nTgSPftghYjHDyGF9&oauth_signature=eLrwSdI5uQtj0YnkPff%2B4LXQOf8%3D'

base_url = 'https://api.twitter.com/1.1/statuses/user_timeline.json'

nasa_url = 'https://api.twitter.com/1.1/statuses/user_timeline.json?count=10&user_id=11348282&screen_name=NASA' + auth



nasa_timeline = HTTParty.get(nasa_url)

nasa_timeline.each do |post|
  puts post["text"]
  puts
end

binding.pry
