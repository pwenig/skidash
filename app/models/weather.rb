class Weather
 require 'httparty'

  attr_accessor :temperature, :icon, :condition, :wspd, :humidity

  def initialize(zip)
    weather_hourly_hash = fetch_weather_hourly(zip)
    assign_hourly_values(weather_hourly_hash)
  end

  def fetch_weather_hourly(zip_code)
    HTTParty.get("http://api.wunderground.com/api/#{ENV['WEATHER_API']}/hourly/q/#{zip_code}.xml")
  end


  def assign_hourly_values(weather_hash)
    hourly_forecast_response = weather_hash.parsed_response['response']['hourly_forecast']['forecast'].first
    self.temperature = hourly_forecast_response['temp']['english']
    self.condition = hourly_forecast_response['condition']
    self.humidity = hourly_forecast_response['humidity']
    self.wspd = hourly_forecast_response['wspd']['english']
    self.icon = hourly_forecast_response['icon_url']
  end


end
