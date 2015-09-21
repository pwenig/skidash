class DashboardController < ApplicationController

  ELD = 80466
  STE = 80487
  BRE = 80424
  ABA = 80435

  def index
  @weather_lookup_eld = WeatherHourly.new(ELD)
  @weather_lookup_ste = WeatherHourly.new(STE)
  @weather_lookup_bre = WeatherHourly.new(BRE)
  @weather_lookup_aba = WeatherHourly.new(ABA)

  @weather_forecast_lookup_eld = WeatherForecast.new(ELD)
  @weather_forecast_lookup_ste = WeatherForecast.new(STE)
  @weather_forecast_lookup_bre = WeatherForecast.new(BRE)
  @weather_forecast_lookup_aba = WeatherForecast.new(ABA)
  end
end