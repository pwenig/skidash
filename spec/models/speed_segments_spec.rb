require 'rails_helper'
require 'spec_helper'
require 'httparty'

describe 'SpeedSegments' do

  before do
    VCR.use_cassette('speed_segments', :record => :new_episodes) do
      auth = {:username => "#{ENV['CDOT_USERNAME']}", :password => "#{ENV['CDOT_PASSWORD']}"}
      @response = HTTParty.get(" https://data.cotrip.org/xml/speed_segments.xml",
                               :basic_auth => auth)
    end
  end

  it "successfully connects to the message endpoint" do
    expect(@response.present?).to be(true)
  end

  it "successfully retrieves the first speed segment" do
    first_segment = @response["SpeedDetails"]["Segment"].first
    expect(first_segment["SegmentId"]).to eq("336")
  end


  it "successfully retrieves specific westbound speed segments" do
    segments = []
    responses = @response["SpeedDetails"]["Segment"]
    responses.each do |response|
      if response["RoadName"] == "I-70" &&
          response["Direction"] == "West" &&
          response["SegmentId"].to_i.between?(20, 25) ||
          response["SegmentId"].to_i.between?(27, 30) ||
          response["SegmentId"].to_i.between?(270, 271)
        segments << response
      end
    end
    expect(segments[0]["RoadName"]).to eq "I-70"
    expect(segments[0]["Direction"]).to eq "West"
    expect(segments[0]["Direction"]).to_not eq "East"
    expect(segments[0]["RoadName"]).to_not eq "I-25"
  end

  it "successfully retrieves a specific speed eastbond segments" do
    segments = []
    responses = @response["SpeedDetails"]["Segment"]
    responses.each do |response|
      if response["RoadName"] == "I-70" &&
          response["Direction"] == "East" &&
          response["SegmentId"].to_i.between?(31, 34) ||
          response["SegmentId"].to_i.between?(272, 273) ||
          response["SegmentId"].to_i.between?(36, 41)
        segments << response
      end
    end
    expect(segments[0]["RoadName"]).to eq "I-70"
    expect(segments[0]["Direction"]).to eq "East"
    expect(segments[0]["Direction"]).to_not eq "West"
    expect(segments[0]["RoadName"]).to_not eq "I-25"
  end

  it "checks speeds and adds a color to the hash" do
    segments_with_colors = []
    segments = []
    responses = @response["SpeedDetails"]["Segment"]
    responses.each do |response|
      if response["RoadName"] == "I-70" &&
          response["Direction"] == "West" &&
          response["SegmentId"].to_i.between?(20, 25) ||
          response["SegmentId"].to_i.between?(27, 30) ||
          response["SegmentId"].to_i.between?(270, 271)
        segments << response
      end
      segments.each do |segment|
        if segment["AverageSpeed"].to_i < 30
          segment["Color"] = "red"
          segments_with_colors << segment
        elsif segment["AverageSpeed"].to_i > 31 && segment["AverageSpeed"].to_i <60
          segment["Color"] = "yellow"
          segments_with_colors << segment
        else
          segment["Color"] = "green"
          segments_with_colors << segment

        end
      end
    end
    expect(segments_with_colors.first["Color"].present?).to be(true)
  end



end