class DashboardController < ApplicationController

  def index
  @weather_lookup = Weather.new

  end
end