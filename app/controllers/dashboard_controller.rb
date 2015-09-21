class DashboardController < ApplicationController

  ELD = 80466
  STE = 80487
  BRE = 80424
  ABA = 80435

  def index
  @weather_lookup_eld = Weather.new(ELD)
  @weather_lookup_ste = Weather.new(STE)
  @weather_lookup_bre = Weather.new(BRE)
  @weather_lookup_aba = Weather.new(ABA)
  end
end