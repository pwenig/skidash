require 'rails_helper'
require 'httparty'

feature "weather API forecast" do

  before response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WEATHER_API']}/forecast/q/80466.xml") do

  end

  scenario "successfully connects to API for forecast" do
    expect(response.present?).to eq(true)
  end

  scenario "successfully retrieves forecast" do
    forecast_response = response.parsed_response['response']['forecast']['txt_forecast']['forecastdays']['forecastday'].first
    forecast_text = forecast_response['fcttext']
    expect(forecast_text.present?).to eq(true)
  end

end