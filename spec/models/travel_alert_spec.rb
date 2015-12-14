require 'rails_helper'
require 'spec_helper'
require 'httparty'

describe 'TravelAlert' do


  before do
    VCR.use_cassette('travel_alerts', :record => :new_episodes) do
      auth = {:username => "#{ENV['CDOT_USERNAME']}", :password => "#{ENV['CDOT_PASSWORD']}"}
      @response = HTTParty.get(" https://data.cotrip.org/xml/alerts.xml",
                               :basic_auth => auth)
    end
  end

  it "successfully connects to travel alert endpoint" do
    expect(@response.present?).to be(true)
  end

  it "successfully retreives alert message" do
    first_alert = @response["Alerts"]["Alert"]
    expect(first_alert[0]["AlertId"]).to eq("227817")
  end

  it "only gets alert types that are restricted and for I-70" do
    restrictions = []
    @response["Alerts"]["Alert"].each do |response|
      if response["Type"] == "Restriction" && response["RoadName"] == "I-70"
        restrictions << response
      end
    end
    expect(restrictions[0]["Type"]).to eq("Restriction")
    expect(restrictions[0]["RoadName"]).to eq("I-70")
    expect(restrictions[0]["RoadName"]).to_not eq("I-25")
  end


end