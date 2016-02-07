require 'rails_helper'
require 'spec_helper'
require 'httparty'

describe 'RoadCondition' do

  before do
    VCR.use_cassette('road_conditions', :record => :new_episodes) do
      @road_conditions = RoadCondition.new
    end
  end


  it "successfully connects to road condition endpoint" do
    expect(@road_conditions.present?).to eq (true)
  end

  it "successfully retrieves road conditions" do
    conditions = @road_conditions.conditions
    expect(conditions).to eq("Dry  Wind")
  end

end