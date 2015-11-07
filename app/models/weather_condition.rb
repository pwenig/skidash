class WeatherCondition
 require 'httparty'

  attr_accessor :temperature, :icon, :condition, :wspd, :humidity

  def initialize(zip)
    weather_condition_hash = fetch_weather_hourly(zip)
    assign_condition_values(weather_condition_hash)
  end

  def fetch_weather_hourly(zip_code)
    HTTParty.get("http://api.wunderground.com/api/#{ENV['WEATHER_API']}/conditions/q/#{zip_code}.xml")
  end


  def assign_condition_values(weather_hash)
    forecast_response = weather_hash.parsed_response['response']['current_observation']
    self.temperature = forecast_response['temp_f']
    self.condition = forecast_response['weather']
    self.icon = forecast_response['icon_url']
  end


end
