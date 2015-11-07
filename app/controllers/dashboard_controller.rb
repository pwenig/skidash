class DashboardController < ApplicationController

  def index
    weather_condition_lookup
    weather_forecast_lookup
    travel_time

  end


  def weather_condition_lookup
    eld = Mountain.find_by_name("Eldora").zip_code
    ste = Mountain.find_by_name("Steamboat").zip_code
    bre = Mountain.find_by_name("Breckenridge").zip_code
    vail = Mountain.find_by_name("Vail").zip_code

    @weather_lookup_eld = WeatherCondition.new(eld)
    @weather_lookup_bre = WeatherCondition.new(bre)
    @weather_lookup_ste = WeatherCondition.new(ste)
    @weather_lookup_vail = WeatherCondition.new(vail)
  end

  def weather_forecast_lookup
    eld = Mountain.find_by_name("Eldora").zip_code
    ste = Mountain.find_by_name("Steamboat").zip_code
    bre = Mountain.find_by_name("Breckenridge").zip_code
    vail = Mountain.find_by_name("Vail").zip_code

    @weather_forecast_lookup_eld = WeatherForecast.new(eld)
    @weather_forecast_lookup_ste = WeatherForecast.new(ste)
    @weather_forecast_lookup_bre = WeatherForecast.new(bre)
    @weather_forecast_lookup_vail = WeatherForecast.new(vail)
  end

  def travel_time
    @travel_time_breck = TravelTime.new('Breckenridge', 'CO')
    @travel_time_vail = TravelTime.new('Vail', 'CO')
  end

end