#!/usr/bin/env ruby
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "L0NUCMAYKt0YxXWasVATc4bfR"
  config.consumer_secret     = ENV['twitter_consumer_secret']
  config.access_token        = "116874266-26ZmiMug5Sa8mwvNW895eMe3akaj6gcxXCgrBrdM"
  config.access_token_secret = ENV['twitter_access_token_secret']
end

#client.update('Tweet from the command line!')

#client.search("#ruby").take(50).each do |tweet|
 # puts tweet.text
#end
#search_options = {
  #result_type: "recent",
  #geocode: "39.9525839,-75.1652215,10mi"
#}

#client.search("pope", search_options).take(50).each do |tweet|
 # puts "#{tweet.user.screen_name}: #{tweet.text}"
#end

#search_options = {
 # result_type: "recent",
  #geocode: "39.9525839,-75.1652215,10mi"
#}

#client.search("pope", search_options).take(50).each do |tweet|
#  puts "#{tweet.user.screen_name}: #{tweet.text}"
# client.favorite(tweet)
# client.update("@{tweet.user.screen_name} Welcome to Philly!")
#end

search_options = {
  result_type: "recent",
  geocode: "39.9525839,-75.1652215,10mi"
}
client.search("#hitchbot", search_options).take(10).each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
  client.favorite(tweet)
  client.update("@#{tweet.user.screen_name} Avenge me...",
                in_reply_to_status_id: tweet.id)
end
