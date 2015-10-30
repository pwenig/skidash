class TravelTime
  require 'httparty'

  attr_accessor :duration

  def initialize(city, state)
    HTTParty::Basement.default_options.update(verify: false)
    travel_time_hash = fetch_travel_time_west(city, state)
    assign_values(travel_time_hash)
  end

  def fetch_travel_time_west(city, state)
    HTTParty.get("https://maps.googleapis.com/maps/api/distancematrix/json?origins=Boulder,CO&destinations=#{city},#{state}&mode=driving&language=en-EN&key=#{ENV['GOOGLE_API']}")

  end

  def assign_values(travel_hash)
    travel_response = travel_hash.parsed_response['rows'].first
    simple_hash= travel_response['elements'].first
    time = simple_hash['duration']['text']
    self.duration = time
  end

end