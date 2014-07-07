class BeamlyRetrieve
  def initialize
    @conn = Faraday.new(:url => 'https://api.zeebox.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.headers = {'zeebox-app-id' => '8e40ef06', 'zeebox-app-key' => '9a7caddc6a9e5434fb02ab06f7277be4'}
    end
  end

  def masterproviders_by_postcode(tvc, postcode)
    conn.get do |req|
      req.url "/epg/1/#{tvc}/#{masterproviders_by_postcode}/masterproviders/"
    end    
  end

  def filtered_tweets(tvc, episode_id)
    conn.get do |req|
      req.url "/buzz/1/fts/#{tvc}/episode/#{episode_id}"
    end
  end
  

  def get_catalog_provider(country, postcode, masterprovider)
  things = conn.get do |req|
    req.url '/epg/1/which-catalogue'
    req.params = {'country' => 'us', 'postcode' => '10035', 'masterprovider' => '342'}
   end 
  end

  def populate_episodes_by_series(brand)
    episodes = get_episodes_by_series(brand)
    binding.pry
  end

  #use this one:
  def get_episodes_by_series(series_id)
    @conn.get do |req|
      req.url "/meta/episodes?brand=#{series_id}"
    end
  end

  #use this one:
  def get_episode(episode_id)
    conn.get do |req|
      req.url "/epg/1/episode/#{episode_id}"
    end
  end

  def get_initial_tweets(tvc, episode_id, reveal_time)
    reveal_time = 6
    while reveal_time <= 3600
      twitter_stream = conn.get do |req|
        req.url "/api/1/hts/us/populate/4217295/#{reveal_time.to_s}/"
       end
    binding.pry
    reveal_time += 6
    end
  end

  def get_historical_tweets(tvc, episode_id)
    conn.get do |req|
      req.url "/api/1/hts/#{tvc}/metadata/#{episode_id}/"
    end
  end
end
