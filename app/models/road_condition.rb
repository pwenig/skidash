class RoadCondition
  require 'httparty'

  attr_accessor :conditions

  def initialize
    road_condition_hash = fetch_road_conditions
    assign_values(road_condition_hash)
  end

  def fetch_road_conditions
    auth = {:username => "#{ENV['CDOT_USERNAME']}", :password => "#{ENV['CDOT_PASSWORD']}"}
    HTTParty.get(" https://data.cotrip.org/xml/road_conditions.xml",
                 :basic_auth => auth)
  end

  def assign_values(condition_hash)
  weather_routes = []
  road_conditions = []
  routes = condition_hash["RoadConditionsDetails"]["WeatherRoute"]
    routes.each do |route|
      if route["WeatherRouteId"].to_i.between?(2,12)
        weather_routes << route
      end
    end

  weather_routes.each do |route|
    # removing Loveland Pass
    weather_routes.delete_if { |h| h["WeatherRouteId"] == "7" }
      road_conditions << route["RoadConditionCategoryTxt"]
  end
  self.conditions = road_conditions.flatten.uniq.join(',').gsub(/,/, '  ')
  end

end