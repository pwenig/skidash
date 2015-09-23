class DashboardController < ApplicationController

  ELD = 80466
  STE = 80487
  BRE = 80424
  VAIL = 81657

  def index
  @weather_lookup_eld = WeatherHourly.new(ELD)
  @weather_lookup_ste = WeatherHourly.new(STE)
  @weather_lookup_bre = WeatherHourly.new(BRE)
  @weather_lookup_vail = WeatherHourly.new(VAIL)

  @weather_forecast_lookup_eld = WeatherForecast.new(ELD)
  @weather_forecast_lookup_ste = WeatherForecast.new(STE)
  @weather_forecast_lookup_bre = WeatherForecast.new(BRE)
  @weather_forecast_lookup_vail = WeatherForecast.new(VAIL)

  end
end