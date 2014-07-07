class OnConnect
  def initialize
    @conn = Faraday.new(:url => 'http://data.tmsapi.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.headers = {'Accept-encoding' => 'gzip'}
    end
  end

  def pull_sporting_events_for_the_day(params)
  end

  #   @conn.get "v1/sports/#{params[:sports_id]}/events/airings", { :lineupId => params[:lineup_id], :startDateTime => params[:start_date], :api_key => ENV['TMS_ON_CONNECT_KEY'] } 
  # end
  # http://data.tmsapi.com/v1/sports/199/events/airings?lineupId=USA-TX42500-X&startDateTime=2014-06-30T20%3A30Z&api_key=2fkv5t6hbcgk9bgr895rdxbh
  # http://data.tmsapi.com/sports/events/airings?api_key=2fkv5t6hbcgk9bgr895rdxbh&lineupId=USA-TX42500-X&startDateTime=2014-06-30T20%3A30Z 
  


end

# OnConnect.new
# pull_sporting_events_for_the_day({sports_id: '199', lineup_id: 'USA-TX42500-X', start_date: '2014-06-30T20:30Z'})

# sportsID = 199
# "seriesId": "7900709",


    #        "entityType": "Sports"
    #     }
    # },
    # {
    #     "startTime": "2014-06-30T19:30Z",
    #     "endTime": "2014-06-30T22:00Z",
    #     "duration": 150,
    #     "qualifiers": [
    #         "Live",
    #         "New"
    #     ],
    #     "channels": [
    #         "052"
    #     ],
    #     "station": {
    #         "preferredImage": {
    #             "uri": "sources/generic/generic_sources_h3.png"
    #         },
    #         "callSign": "ESPNLO1",
    #         "stationId": "20384"
    #     },
    #     "stationId": "20384",
    #     "program": {
    #         "tmsId": "EP017953380054",
    #         "rootId": "10670720",
    #         "seriesId": "7900709",
    #         "title": "2014 FIFA World Cup",
    #         "titleLang": "en",
    #         "shortDescription": "Algeria faces Germany. From Jose Pinheiro Borda Stadium in Porto Alegre, Rio Grande do Sul, Brazil.",
    #         "longDescription": "After advancing to the knockout stage for the first time in team history, Algeria faces a difficult challenge against three-time World Cup champion Germany. From Jose Pinheiro Borda Stadium in Porto Alegre, Rio Grande do Sul, Brazil.",
    #         "descriptionLang": "en",
    #         "subType": "Sports event",
    #         "genres": [
    #             "Soccer"
    #         ],
    #         "preferredImage": {
    #             "uri": "assets/p10204724_b_v5_ab.jpg",
    #             "height": "360",
    #             "width": "240",
    #             "primary": "true",
    #             "category": "Banner-L2",
    #             "tier": "Sport"
    #         },
    #         "eventTitle": "Round of 16: Germany vs. Algeria",
    #         "gameDate": "2014-06-30",
    #         "teams": [
    #             {
    #                 "name": "Germany",
    #                 "teamBrandId": "7831"
    #             },
    #             {
    #                 "name": "Algeria",
    #                 "teamBrandId": "7995"
    #             }
    #         ],
    #         "organizationId": "8025",
    #         "sportsId": "199",
    #         "entityType": "Sports"
    #     }
    # },