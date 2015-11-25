require 'rails_helper'
require 'nokogiri'
require 'open-uri'


describe "Mountain" do

  before mountain = Mountain.create(name: "Breckenridge",
                                    zip_code: "80424",
                                    opening_date: "12/01/2015 8:30 AM",
                                    lifts_open: "n/a",
                                    runs_open: "n'a",
                                    terrain_url: "http://www.breckenridge.com/mountain/terrain-status.aspx#/Lifts",
                                    mtn_image1: "foo",
                                    mtn_image2: "foo",
                                    mtn_image3: "foo") do

    VCR.use_cassette('terrain_status', :record => :new_episodes) do
      url = "http://www.breckenridge.com/mountain/terrain-status.aspx#/Lifts"
      @doc_breck = Nokogiri::HTML(open(url))
    end

  end


  it "returns a mountain name" do
    expect(mountain.name).to eq("Breckenridge")

  end

  it "returns a mountain zip code" do
    expect(mountain.zip_code).to eq("80424")
  end

  it "returns a mountain opening_date" do
    expect(mountain.opening_date).to eq("12/01/2015 8:30 AM")
  end

  it "returns a mountain video_url" do
    expect(mountain.mtn_image1).to eq("foo")
  end

  it "returns a mountain terrain status url" do
    expect(mountain.terrain_url).to eq("http://www.breckenridge.com/mountain/terrain-status.aspx#/Lifts")
  end

  it "updates a mountain terrain status with number of lifts" do
      lift_string_breck = @doc_breck.at_css(".firstItem").text
      lifts_breck = lift_string_breck.gsub(/\s+/, "")[12]
      mountain.update_attribute(:lifts_open, lifts_breck)
      expect(mountain.lifts_open).to eq(lifts_breck)
  end

  it "updates a mountain terrain status with number of runs" do
    run_string_breck = @doc_breck.at_css(".firstItem+li").text
    runs_breck = run_string_breck.gsub(/\s+/, "")[8]
    mountain.update_attribute(:runs_open, runs_breck)
    expect(mountain.runs_open).to eq(runs_breck)

  end

  end

