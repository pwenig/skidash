require 'rails_helper'
require 'spec_helper'
require 'httparty'

describe 'RoadCondition' do

  before do
    VCR.use_cassette('road_conditions', :record => :new_episodes) do
      auth = {:username => "#{ENV['CDOT_USERNAME']}", :password => "#{ENV['CDOT_PASSWORD']}"}
      @response = HTTParty.get(" https://data.cotrip.org/xml/road_conditions.xml",
                               :basic_auth => auth)
    end
  end


  it "successfully connects to road condition endpoint" do
    expect(@response.present?).to be(true)
  end

  it "successfully retrieves the first weather route" do
    first_route = @response["RoadConditionsDetails"]["WeatherRoute"].first
    expect(first_route["WeatherRouteId"]).to eq("29")
  end

  it "successfully retreives specific weather routes" do
    weather_routes = []
    routes = @response["RoadConditionsDetails"]["WeatherRoute"]
    routes.each do |route|
      if route["WeatherRouteId"] == "12"
        weather_routes << route
      end
    end
    expect(weather_routes[0]["WeatherRouteId"]).to eq("12")
  end

  it "successfully retreives multiple weather routes" do
    weather_routes = []
    routes = @response["RoadConditionsDetails"]["WeatherRoute"]
    routes.each do |route|
      if route["WeatherRouteId"].to_i.between?(2, 12)
        weather_routes << route
      end
    end
    expect(weather_routes.count).to eq(9)
  end
end