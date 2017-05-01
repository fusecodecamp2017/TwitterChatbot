require 'twitter'

@responded = []

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

student_handles = %w(

)

def post_tweet(message, opts={})
  @client.update(message, opts)
end

student_handles.each do |handle|
  post_tweet("@#{handle} Welcome to the Twitter Chatbot course at FUSE Code Camp 2017!")
  post_tweet("@#{handle} what is your name?")
end
