require 'rails_helper'
require 'spec_helper'
require 'httparty'

describe "weather API condition" do

  before do
    VCR.use_cassette('weather_condition', :record => :new_episodes) do
      @response = WeatherCondition.new(80466)
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


