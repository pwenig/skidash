class WeatherCondition
 require 'httparty'

  attr_accessor :condition_hash, :forecast_hash


 def initialize(zip)
    weather_condition_hash = fetch_weather_conditions(zip)
    assign_condition_values(weather_condition_hash)
    weather_forecast_hash = fetch_weather_forecast(zip)
    assign_forecast_values(weather_forecast_hash)

  end

  def fetch_weather_conditions(zip_code)
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=#{zip_code},us&mode=xml&units=imperial&appid=#{ENV['OPEN_WEATHER_API']}")
  end

 def fetch_weather_forecast(zip_code)
   HTTParty.get("http://api.wunderground.com/api/#{ENV['WEATHER_API']}/forecast/q/#{zip_code}.xml")
 end


  def assign_condition_values(weather_hash)
    condition_hash = {}
    forecast_response = weather_hash['current']
    condition_hash[:temperature] = forecast_response['temperature']['value'].to_i.round
    condition_hash[:condition] = forecast_response['weather']['value'].capitalize
    condition_hash[:icon] = "http://openweathermap.org/img/w/#{forecast_response['weather']['icon']}.png"
    condition_hash[:wind_string] = forecast_response['wind']['speed']['name']
    self.condition_hash =  condition_hash
  end

 def assign_forecast_values(weather_hash)
   forecast_hash = {}
   forecast_response = weather_hash.parsed_response['response']['forecast']['txt_forecast']['forecastdays']['forecastday']
   simple_forecast_response = weather_hash.parsed_response['response']['forecast']['simpleforecast']['forecastdays']['forecastday']
   forecast_hash[:forecast_today] = forecast_response[0]['fcttext']
   forecast_hash[:today_high] = simple_forecast_response[0]['high']['fahrenheit']
   forecast_hash[:today_low] = simple_forecast_response[0]['low']['fahrenheit']
   forecast_hash[:snow_today] = simple_forecast_response[0]['snow_allday']['in']
   forecast_hash[:forecast_title_day2] = forecast_response[2]['title']
   forecast_hash[:forecast_day2] = forecast_response[2]['fcttext']
   forecast_hash[:forecast_title_day3] = forecast_response[4]['title']
   forecast_hash[:forecast_day3] = forecast_response[4]['fcttext']
   self.forecast_hash = forecast_hash

 end


end

