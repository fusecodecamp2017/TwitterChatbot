require 'twitter'

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "Pff53nmHzjtUVbJZgixV9gd8B"
  config.consumer_secret     = "TeNxFb10f457S9hgVoa7HwiAGe2b3phVvn2nrLF29Ns1svIWw5"
  config.access_token        = "715188951544426498-WZSLHBwQ13ERlHxpcGZw6MUBe2X0Z24"
  config.access_token_secret = "nh2ulyMCb7rQpurn7PO45X7ie0RmwvZSXjZwEZROouxPU"
end

def post_tweet(message, opts={})
  @client.update(message, opts)
end

def get_last_x_mentions(num)
  @client.mentions_timeline.take(num)
end

def has_prompt?(tweet)
  tweet.downcase.include?('what is') || tweet.include?('when is')
end

@responded = []
File.open("tweets_responded_to.txt", "r").each_line do |line|
  @responded << line.chomp
end

while true
  get_last_x_mentions(20).each do |mention|
    txt = mention.text
    id = mention.id
    next if @responded.include?(id.to_s)

    reply = ''
    if (txt.include?("hi there"))
      reply = "oh, hello! How are you?"
    elsif (txt.include?("How are you?"))
      reply = "I'm doing well, thanks. What are you up to?"
    elsif (txt.include?("What are you up to?"))
      reply = "I'm just writing a chatbot at FUSE. Isn't this cool?"
    elsif (txt.include?("Isn't this cool?"))
      reply = "Definitely! Programming is kind of fun"
    elsif (txt.include?("Programming is kind of fun"))
      reply = "I wouldn't know...I'm just a computer. Beep boop."
    elsif (txt.include?("I'm just a computer"))
      reply = "Wait...me too. I mean beep boop."
    end

    next if reply == ''
    puts "Replying to #{mention.user.screen_name} with: #{reply}"
    post_tweet("@#{mention.user.screen_name} #{reply}", in_reply_to_status_id: id)

    @responded << id
    File.open('tweets_responded_to.txt', 'a') do |f|
      f.puts id
    end
  end
  sleep 20 # API limit for mentions queries is 5/min
end
