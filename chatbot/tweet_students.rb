require 'twitter'

@responded = []

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "7ZZkyiXVmhnElLWMuhzQKUOjA"
  config.consumer_secret     = "j6tAB3W2TVHmP0fSupw3jITWMBOhQ0bUCPc4ZYP99HVCuNsCHG"
  config.access_token        = "856935198499459073-pYelv9yh31hBrJeMFgiYmwe1JqHAscj"
  config.access_token_secret = "OHTxxbZVLKFi7K8tP4X29sXfK6qhBtq2zUTw8XzqRBmVR"
end

def post_tweet(message, opts={})
  @client.update(message, opts)
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
    next if !has_prompt?(txt) || @responded.include?(id)

    case txt
      when /name/
        reply = 'what is your name?'
      when /age/
        reply = 'what is your age?'
      when /hobby/
        reply = 'what is your favorite hobby?'
      when /birthday/
        reply = 'when is your birthday?'
    end

    next if reply == ''
    puts "Replying to #{mention.user.screen_name} with: #{reply}"
    post_tweet("@#{mention.user.screen_name} #{reply}", in_reply_to_status_id: id)
    @responded << id
  end
  sleep 20 # API limit for mentions queries is 5/min
end