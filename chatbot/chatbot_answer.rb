require 'twitter'

@responded = []

@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
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

def has_prompt?(tweet)
  tweet.downcase.include?('what is') || tweet.include?('when is')
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
