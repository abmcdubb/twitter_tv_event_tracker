class TwitterStream
  
  def initialize(*search_terms)
    @search_terms = search_terms
    binding.pry
  end

  TweetStream.configure do |config|  
    config.consumer_key       = ENV['TWITTER_CONSUMER_KEY']
    config.consumer_secret    = ENV['TWITTER_CONSUMER_SECRET']
    config.oauth_token        = ENV['TWITTER_OAUTHTOKEN']
    config.oauth_token_secret = ENV['TWITTER_OAUTHTOKEN_SECRET']
    config.auth_method        = :oauth
  end

  client = TweetStream::Client.new

  # TweetStream::Client.new.sample do |status|
  #   # The status object is a special Hash with
  #   # method access to its keys.
  #   # puts "#{status.created_at} #{status.text}"
  #   count = $redis.incr("#{[status.created_at]}")
  #   puts "#{status.created_at}: #{status.text} #{count}"
  # end 

  # client.on_error do |message|
  #   puts message  
  # end

  client.track('world cup', 'worldcup') do |status|
    count = $redis.incr("#{[status.created_at]}")
    puts "#{status.created_at}: #{status.text} #{count}"
  end

end