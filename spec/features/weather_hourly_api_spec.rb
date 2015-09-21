require 'rails_helper'
require 'httparty'

feature "weather API hourly" do

  before response = WeatherHourly.new(80466) do
  end

  scenario "successfully connets to API for hourly forecast" do
      expect(response.present?).to eq(true)
  end

  scenario "successfully retrieves hourly forecast" do
     expect(response.temperature.present?).to eq(true)
  end

  scenario "successfully retrieves forecast icon" do
    expect(response.icon.present?).to eq(true)
  end

end