require 'rails_helper'
require 'spec_helper'
require 'Httparty'

describe TravelTime do

  before do
    VCR.use_cassette('cdot_destinations', :record => :new_episodes) do
    auth = {:username => "#{ENV['CDOT_USERNAME']}", :password => "#{ENV['CDOT_PASSWORD']}"}
    @response = HTTParty.get(" https://data.cotrip.org/xml/speed_routes.xml",
                 :basic_auth => auth)
    end

  end


  it "successfully connects to endpoint" do
    expect(@response.present?).to eq(true)
  end

  it "successfully retrieves the first route" do
    first_route = @response["SpeedDetails"]["Route"].first
    expect(first_route["RouteId"]).to eq("207")
  end

  it "successfully retrieves a specific route" do
    route = []
    responses = @response["SpeedDetails"]["Route"]
    responses.each do |response|
     if response["RouteId"] == "18"
       route << response

    end
    end
    expect(route[0]["Description"]).to eq "Vail (VMS) to DEN/C-470"
    expect(route[0]["RouteId"]).to eq "18"
  end
end
