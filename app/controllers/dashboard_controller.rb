class DashboardController < ApplicationController

  def index
    weather_hourly_lookup
    weather_forecast_lookup

  end


  def weather_hourly_lookup

    eld = Mountain.find_by_name("Eldora").zip_code
    ste = Mountain.find_by_name("Steamboat").zip_code
    bre = Mountain.find_by_name("Breckenridge").zip_code
    vail = Mountain.find_by_name("Vail").zip_code

    @weather_lookup_eld = WeatherHourly.new(eld)
    @weather_lookup_ste = WeatherHourly.new(ste)
    @weather_lookup_bre = WeatherHourly.new(bre)
    @weather_lookup_vail = WeatherHourly.new(vail)
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

end