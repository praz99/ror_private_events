require 'rails_helper'

RSpec.feature 'Event page' do
  before(:each) do
    visit '/signup'
    expect(page).to have_content('Sign up')
    FactoryBot.create(:user)
    fill_in 'username', with: 'kikiolla'
    fill_in 'name', with: 'okiki'
    click_on 'Create account'
    visit '/login'
    fill_in 'username', with: 'kikiolla'
    click_on 'Log in'
  end

  scenario 'redirects to the events page and displays the content' do 
    expect(page).to have_content 'kikiolla'  
  end

  scenario 'redirects to event index page ' do
    click_on 'Events'
    expect(page).to have_content 'All Event'
  end

  scenario 'redirects to display single user events' do    
    visit '/users/1'
    expect(page).to have_content 'Display all user event'
  end

  scenario 'redirects to create a new events page' do
    visit '/events/new'
    expect(page).to have_content 'Create a new Event'
  end
end
