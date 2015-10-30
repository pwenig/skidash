require 'rails_helper'
require 'spec_helper'
require 'httparty'



describe "google travel time api" do

  before do
    VCR.use_cassette('travel_time', :record => :new_episodes) do
      @response = TravelTime.new('Breckendrige', 'CO')
    end
  end

  it "successfully connects to API for travel time" do
    expect(@response.present?).to eq(true)
  end
end