require 'twitter'

@client = Twitter::REST::@Client.new do |config|
  config.consumer_key        = "Pff53nmHzjtUVbJZgixV9gd8B"
  config.consumer_secret     = "TeNxFb10f457S9hgVoa7HwiAGe2b3phVvn2nrLF29Ns1svIWw5"
  config.access_token        = "715188951544426498-WZSLHBwQ13ERlHxpcGZw6MUBe2X0Z24"
  config.access_token_secret = "nh2ulyMCb7rQpurn7PO45X7ie0RmwvZSXjZwEZROouxPU"
end

# 1.)
# Show https://github.com/sferik/twitter/blob/aa909b3b7733ca619d80f1c8cba961033d1fc7e6/lib/twitter/rest/tweets.rb
# and explain what is happening behind the scenes
# @client.update("THIS TWEET IS COMING FROM A ROBOT")

# 2.)
def post_tweet(message)
  @client.update(message)
end

def get_last_five_tweets()
  @client.mentions_timeline.take(5)
end

# 1.)
get_last_five_tweets().each do |tweet|
  puts tweet.text
end

# 2.)
get_last_five_tweets().each do |tweet|
  message = tweet.text
  if message.include?("what is your name?")
    puts "I'm going to tweet back"
  end
end

# Idea: create function that will tweet at all of the kids twitter accounts with a "What is your name?" question
# Have a topic for conversation for lunch
