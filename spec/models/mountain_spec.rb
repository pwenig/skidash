require 'rails_helper'


describe "Mountain" do

  before mountain = Mountain.create(name: "Eldora",
                                    zip_code: "80466",
                                    opening_date: "12/01/2015 8:30 AM",
                                    video_url: "http://63.147.112.178:9595/axis-cgi/jpg/image.cgi") do
  end

  it "returns a mountain name" do
    expect(mountain.name).to eq("Eldora")

  end

  it "returns a mountain zip code" do
    expect(mountain.zip_code).to eq("80466")
  end

  it "returns a mountain opening_date" do
    expect(mountain.opening_date).to eq("12/01/2015 8:30 AM")
  end

  it "returns a mountain video_url" do
    expect(mountain.video_url).to eq("http://63.147.112.178:9595/axis-cgi/jpg/image.cgi")
  end


end
