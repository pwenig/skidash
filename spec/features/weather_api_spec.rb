require 'rails_helper'
require 'httparty'

feature "weather API_hourly" do

  before response = Weather.new.fetch_weather_hourly(80466) do
  end

  scenario "successfully connets to API for hourly forecast" do
      expect(response.present?).to eq(true)
  end

  scenario "successfully retrieves hourly forecast" do
     initial_response = response['response']['hourly_forecast']['forecast'].first
     temperature = initial_response['temp']['english']
     expect(temperature.present?).to eq(true)
  end

  scenario "successfully retrieves forecast icon" do
    initial_response = response['response']['hourly_forecast']['forecast'].first
    icon = initial_response['icon_url']
    expect(icon.present?).to eq(true)
  end

end