require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'


feature 'the mountain selection process' do


  scenario 'selects a mountain to look up' do
    VCR.use_cassette('dashboard_load', :record => :new_episodes) do
    create_mountains
    visit '/'
    select("Eldora", :from => 'mountain-form1')

    click_button('Get Forecast')

    expect(page).to have_css('h2', text: 'Eldora')

    end
  end

end