class WeatherForecast
  require 'httparty'

  attr_accessor :forecast_today, :forecast_day2, :forecast_title_day2

  def initialize(zip)
    weather_forecast_hash = fetch_weather_forecast(zip)
    assign_forecast_values(weather_forecast_hash)
  end

  def fetch_weather_forecast(zip_code)
    HTTParty.get("http://api.wunderground.com/api/#{ENV['WEATHER_API']}/forecast/q/#{zip_code}.xml")
  end

  def assign_forecast_values(weather_hash)
    forecast_response = weather_hash.parsed_response['response']['forecast']['txt_forecast']['forecastdays']['forecastday']
    self.forecast_today = forecast_response[0]['fcttext']
    self.forecast_title_day2 = forecast_response[2]['title']
    self.forecast_day2 = forecast_response[2]['fcttext']

  end
end
