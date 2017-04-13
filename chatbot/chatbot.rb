require 'twitter'

@client = Twitter::REST::@Client.new do |config|
  config.consumer_key        = "Pff53nmHzjtUVbJZgixV9gd8B"
  config.consumer_secret     = "TeNxFb10f457S9hgVoa7HwiAGe2b3phVvn2nrLF29Ns1svIWw5"
  config.access_token        = "715188951544426498-WZSLHBwQ13ERlHxpcGZw6MUBe2X0Z24"
  config.access_token_secret = "nh2ulyMCb7rQpurn7PO45X7ie0RmwvZSXjZwEZROouxPU"
end

######################################################################################################
# 1.)
# Show https://github.com/sferik/twitter/blob/aa909b3b7733ca619d80f1c8cba961033d1fc7e6/lib/twitter/rest/tweets.rb
# and explain what is happening behind the scenes
@client.update("THIS TWEET IS COMING FROM A ROBOT")

######################################################################################################
# 2.)
# Create the method to ease the introduction of the class-level var
def post_tweet(message)
  @client.update(message)
end
post_tweet("THIS TWEET IS ALSO COMING FROM A ROBOT")

######################################################################################################
# 3.)
# Read the last 5 tweets mentioning you. Have all students tweet at bot account to get a few mentions
def get_last_five_tweets()
  @client.mentions_timeline.take(5)
end

get_last_five_tweets().each do |tweet|
  puts tweet.text
end

######################################################################################################
# 4.) Introduce the skeleton for the chatbot
get_last_five_tweets().each do |tweet|
  message = tweet.text
  if message.include?("what is your name?")
    puts "I'm going to tweet back"
  end
end

######################################################################################################
# 5.) Reply to the tweet
get_last_five_tweets().each do |tweet|
  message = tweet.text
  if message.include?("what is your name?")
    user = tweet.user
    user_name = user.name
    reply_text = "@" + user_name + " my name is WHAT"
    post_tweet(reply_text)
  end
end

######################################################################################################
# 6.) Answer multiple questions
get_last_five_tweets().each do |tweet|
  message = tweet.text
  if message.include?("what is your name?")
    user = tweet.user
    user_name = user.name
    reply_text = "@" + user_name + " my name is WHAT"
    post_tweet(reply_text)
  end

  if message.include?("what is your favorite food?")
    user = tweet.user
    user_name = user.name
    reply_text = "@" + user_name + " my favorite food is whatever we're having for lunch at code camp"
    post_tweet(reply_text)
  end
end

######################################################################################################
# Penultimate.) Put it on a loop
while true
  # REPLY LOGIC #
  sleep 20
end

# Last.) Have the students write battling chat bots. A chattle, if you will.
