require 'rails_helper'
require 'spec_helper'
require 'httparty'

describe 'TravelAlert' do


  before do
    VCR.use_cassette('travel_alerts', :record => :new_episodes) do
    @travel_alert = TravelAlert.new
    end
  end

  it "successfully connects to travel alert endpoint" do
    expect(@travel_alert.present?).to be(true)
  end

  it "successfully retreives alert message" do
    alert = @travel_alert.road_alerts
    expect(alert.first["Title"]).to eq("NONE")
  end

end