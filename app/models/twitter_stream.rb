class TwitterStream

  def initialize(*search_terms)
    TweetStream.configure do |config|  
      config.consumer_key       = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret    = ENV['TWITTER_CONSUMER_SECRET']
      config.oauth_token        = ENV['TWITTER_OAUTHTOKEN']
      config.oauth_token_secret = ENV['TWITTER_OAUTHTOKEN_SECRET']
      config.auth_method        = :oauth
    end

    @client = TweetStream::Client.new

    @search_terms = search_terms
    @search_terms.concat(['world cup','worldcup','worldcupbrazil','worldcup2014','FIFAWorldCup','2014WC_Brazil','copadomundo','LaCopaFIFA', 'FIFA2014'])
  end

  # client.on_error do |message|
  #   puts message  
  # end

  def start_stream  
    @client.track(@search_terms.each {|term| print "'#{term} ',"}) do |status|
      count = $redis.incr("#{[status.created_at]}")
      puts "#{status.created_at}: #{status.text} #{count}"
      # puts @search_terms
    end
  end

end