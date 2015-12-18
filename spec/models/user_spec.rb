require 'rails_helper'
require 'spec_helper'

describe 'User' do

before user = User.create(name: "Chuck Wagon",
                          phone_number: "13033333333") do

end

  it "returns a user name" do
    expect(user.name).to eq("Chuck Wagon")
  end

  it "returns a user phone number" do
    expect(user.phone_number).to eq("13033333333")
  end

end