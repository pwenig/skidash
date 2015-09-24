require 'rails_helper'
require 'spec_helper'
require 'httparty'

describe "weather API forecast" do


  before do
    VCR.use_cassette('weather_forecast', :record => :new_episodes) do
      @response = WeatherForecast.new(80466)
    end
  end


  it "successfully connects to API for forecast" do
    expect(@response.present?).to eq(true)
  end

  it "successfully retrieves forecast" do
    expect(@response.forecast_today.present?).to eq(true)
  end

  it "successfully retrieves forecast for tomorrow" do
    expect(@response.forecast_day2.present?).to eq(true)
  end

end
