require 'rails_helper'
require 'spec_helper'
require 'httparty'

describe 'SpeedSegments' do

  before do
    VCR.use_cassette('speed_segments', :record => :new_episodes) do
      @speeds = SpeedSegment.new
    end
  end

  it "successfully connects to the message endpoint" do
    expect(@speeds.present?).to eq(true)
  end

  it "successfully sets specific westbound speed segments" do
    west_bound = @speeds.west_bound_speeds
    expect(west_bound.first["SegmentId"]).to eq "20"
    expect(west_bound.first["Direction"]).to eq "West"
  end

  it "successfully sets specific east speed segments" do
    east_bound = @speeds.east_bound_speeds
    expect(east_bound.first["SegmentId"]).to eq "31"
    expect(east_bound.first["Direction"]).to eq "East"
  end


end