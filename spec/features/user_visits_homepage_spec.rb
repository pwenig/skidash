require 'rails_helper'
require 'spec_helper'

feature "user visits homepage" do

  scenario "successfully" do
    VCR.use_cassette('home_page', :record => :new_episodes) do
      create_mountains
      visit root_path
    end
    expect(page).to have_css "h1", text: "SkiDash"


  end
end

