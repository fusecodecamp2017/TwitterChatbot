require 'twitter'

@responded = []

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "7ZZkyiXVmhnElLWMuhzQKUOjA"
  config.consumer_secret     = "j6tAB3W2TVHmP0fSupw3jITWMBOhQ0bUCPc4ZYP99HVCuNsCHG"
  config.access_token        = "856935198499459073-pYelv9yh31hBrJeMFgiYmwe1JqHAscj"
  config.access_token_secret = "OHTxxbZVLKFi7K8tP4X29sXfK6qhBtq2zUTw8XzqRBmVR"
end

student_handles = %w(
  AaronAnderpun
)

def post_tweet(message, opts={})
  @client.update(message, opts)
end

student_handles.each do |handle|
  post_tweet("@#{handle} Welcome to the Twitter Chatbot course at FUSE Code Camp 2017!")
  post_tweet("@#{handle} what is your name?")
end
