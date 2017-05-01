require 'twitter'

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "" # fill in user 1's twitter credentials
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

def post_tweet(message, opts={})
  @client.update(message, opts)
end

def get_last_x_mentions(num)
  @client.mentions_timeline.take(num)
end

@responded = []
# make sure this file is created beforehand
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
