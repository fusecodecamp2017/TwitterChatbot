require 'twitter'

@responded = []

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "Pff53nmHzjtUVbJZgixV9gd8B"
  config.consumer_secret     = "TeNxFb10f457S9hgVoa7HwiAGe2b3phVvn2nrLF29Ns1svIWw5"
  config.access_token        = "715188951544426498-WZSLHBwQ13ERlHxpcGZw6MUBe2X0Z24"
  config.access_token_secret = "nh2ulyMCb7rQpurn7PO45X7ie0RmwvZSXjZwEZROouxPU"
end

def post_tweet(message, opts={})
  @client.update(message)
end

def get_last_x_mentions(num)
  @client.mentions_timeline.take(num)
end

def has_prompt?(tweet)
  tweet.include?('what is') || tweet.include?('when is')
end

while true
  get_last_x_mentions(20).each do |mention|
    txt = mention.text
    id = mention.id
    next if !has_prompt?(txt) || @responded.include?(id)

    reply = ''
    case txt
      when /name/
        reply = 'My name is Inigo Montoya. You killed my father. Prepare to die.'
      when /age/
        reply = '11010'
      when /hobby/
        reply = 'I enjoy the occasional round of disc golf'
      when /snack/
        reply = "Don't be ridiculous. It's Dunkaroos, everybody knows that."
    end

    next if reply == ''
    puts "Replying to #{mention.user.screen_name} with: #{reply}"
    post_tweet("@#{mention.user.screen_name} #{reply}", in_reply_to_status_id: id)
    @responded << id
  end
  sleep 20 # API limit for mentions queries is 5/min
end
