class TravelTime
  require 'httparty'

  attr_accessor :east_desc, :east_travel_time, :west_desc, :west_travel_time

  def initialize
    travel_time_hash = fetch_travel_times
    assign_values(travel_time_hash)
  end

  def fetch_travel_times
    auth = {:username => "#{ENV['CDOT_USERNAME']}", :password => "#{ENV['CDOT_PASSWORD']}"}
    HTTParty.get(" https://data.cotrip.org/xml/speed_routes.xml",
                         :basic_auth => auth)
  end

  def assign_values(time_hash)
    route = []
    responses = time_hash["SpeedDetails"]["Route"]
    responses.each do |response|
      if response["RouteId"] == "18" || response["RouteId"] == "116"
      route << response
      end
    end
    east_bound = route[0]
    self.east_desc = east_bound["Description"]
    self.east_travel_time = format_travel_time(east_bound["ExpectedTravelTime"])
    west_bound = route[1]
    self.west_desc = west_bound["Description"]
    self.west_travel_time = format_travel_time(west_bound["ExpectedTravelTime"])
  end

  def format_travel_time(time)
    hour = time["Hours"]
    minutes = time["Minutes"]
    "#{hour} hour #{minutes} minutes"

  end

end

