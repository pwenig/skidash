require 'rails_helper'
require 'httparty'

feature "weather API" do

  scenario "successfully connets to API" do
      response = HTTParty.get("http://api.wunderground.com/api/13c25173081aa036/hourly/q/80466.xml")

      expect(response.present?).to eq(true)
  end

end