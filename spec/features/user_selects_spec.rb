require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'


feature 'the mountain selection process' do


  scenario 'selects a mountain to look up' do
    VCR.use_cassette('dashboard_load', :record => :new_episodes) do
    create_mountains
    create_conditions
    visit '/'
    select("Eldora", :from => 'mountain-form', match: :first)

    click_button('Get Forecast')

    expect(page).to have_css('h2', text: 'Eldora')
    expect(page).to_not have_css('h2', text: 'Steamboat')

    end
  end

end