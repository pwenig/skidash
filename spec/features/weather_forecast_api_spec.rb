require 'rails_helper'
require 'httparty'

feature "weather API forecast" do

  before response = WeatherForecast.new(80466) do

  end

  scenario "successfully connects to API for forecast" do
    expect(response.present?).to eq(true)
  end

  scenario "successfully retrieves forecast" do
    expect(response.forecast_today.present?).to eq(true)
  end

  scenario "successfully retrieves forecast for tomorrow" do
    expect(response.forecast_day2.present?).to eq(true)
  end

end