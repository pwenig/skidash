class WeatherForecast
  require 'httparty'

  attr_accessor :forecast_today, :forecast_day2, :forecast_title_day2, :forecast_title_day3, :forecast_day3,
                :today_high, :today_low

  def initialize(zip)
    weather_forecast_hash = fetch_weather_forecast(zip)
    assign_forecast_values(weather_forecast_hash)
  end

  def fetch_weather_forecast(zip_code)
    HTTParty.get("http://api.wunderground.com/api/#{ENV['WEATHER_API']}/forecast/q/#{zip_code}.xml")
  end

  def assign_forecast_values(weather_hash)
    forecast_response = weather_hash.parsed_response['response']['forecast']['txt_forecast']['forecastdays']['forecastday']
    simple_forecast_response = weather_hash.parsed_response['response']['forecast']['simpleforecast']['forecastdays']['forecastday']

    self.forecast_today = forecast_response[0]['fcttext']
    self.today_high = simple_forecast_response[0]['high']['fahrenheit']
    self.today_low = simple_forecast_response[0]['low']['fahrenheit']
    self.forecast_title_day2 = forecast_response[2]['title']
    self.forecast_day2 = forecast_response[2]['fcttext']
    self.forecast_title_day3 = forecast_response[4]['title']
    self.forecast_day3 = forecast_response[4]['fcttext']

  end
end
