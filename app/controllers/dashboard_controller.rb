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
  end
end