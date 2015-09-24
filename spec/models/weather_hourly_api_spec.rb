require 'rails_helper'
require 'spec_helper'
require 'httparty'

describe "weather API hourly" do

  before  do
    VCR.use_cassette('weather_hourly', :record => :new_episodes) do
      @response = WeatherHourly.new(80466)
    end
  end

  it "successfully connets to API for hourly forecast" do
      expect(@response.present?).to eq(true)
  end

  it "successfully retrieves hourly forecast" do
     expect(@response.temperature.present?).to eq(true)
  end

  it "successfully retrieves forecast icon" do
    expect(@response.icon.present?).to eq(true)
  end

end


