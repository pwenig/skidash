require 'rails_helper'


describe "Condition" do


  it "returns the temperature" do
    create_conditions
    expect(Condition.first.temperature).to eq 32
  end

  it "returns the condition" do
    create_conditions
    expect(Condition.first.condition).to eq "Clear"
  end

  it "returns the wind" do
    create_conditions
    expect(Condition.first.wind).to eq "From the North at 5 MPH"
  end

  it "returns todays forecast" do
    create_conditions
    expect(Condition.first.forecast_today).to eq "Mostly clear. Lows overnight in the upper single digits."
  end

  it "returns the high temp" do
    create_conditions
    expect(Condition.first.high_temp).to eq 32
  end

  it "returns the low temp" do
    create_conditions
    expect(Condition.first.low_temp).to eq 5
  end

  it "returns the conditions for specific mountain" do
    create_mountains
    create_conditions
    mountain = Mountain.find(1)
    mountain_condition = Condition.find_by_mountain_id(mountain.id)
    expect(mountain_condition.temperature).to eq 32
    expect(mountain_condition.condition).not_to eq("Snow")
  end

end

