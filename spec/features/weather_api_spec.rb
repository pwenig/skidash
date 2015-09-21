require 'rails_helper'
require 'httparty'

feature "weather API" do

  scenario "successfully connets to API" do
      response = HTTParty.get("http://api.wunderground.com/api/#{ENV['WEATHER_API']}/hourly/q/80466.xml")

      expect(response.present?).to eq(true)
  end

end