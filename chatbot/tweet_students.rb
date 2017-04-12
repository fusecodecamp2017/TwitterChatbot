require 'twitter'

@responded = []

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "Pff53nmHzjtUVbJZgixV9gd8B"
  config.consumer_secret     = "TeNxFb10f457S9hgVoa7HwiAGe2b3phVvn2nrLF29Ns1svIWw5"
  config.access_token        = "715188951544426498-WZSLHBwQ13ERlHxpcGZw6MUBe2X0Z24"
  config.access_token_secret = "nh2ulyMCb7rQpurn7PO45X7ie0RmwvZSXjZwEZROouxPU"
end

def post_tweet(message)
  @client.update(message)
end

def get_last_x_mentions(num)
  @client.mentions_timeline.take(num)
end

def has_prompt?(tweet)
  tweet.include?('ask me')
end

while true
  get_last_x_mentions(20).each do |mention|
    txt = mention.text
    id = mention.id
    next unless has_prompt?(txt) || @responded.include?(id)

    case txt
      when /name/
        post_tweet("@#{mention.user.screen_name} what is your name?")
      when /age/
        post_tweet("@#{mention.user.screen_name} what is your age?")
      when /hobby/
        post_tweet("@#{mention.user.screen_name} what is your favorite hobby?")
      when /birthday/
        post_tweet("@#{mention.user.screen_name} when is your birthday?")
    end

    @responded << id
  end
  sleep 20 # API limit for mentions queries is 5/min
end
