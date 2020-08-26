require 'rails_helper'

RSpec.feature 'Event page' do
  before(:each) do
    FactoryBot.create(:user)
    visit '/login'
    fill_in 'username', with: 'kikiolla'
    first(:link, 'Log in').click
  end
  
  scenario 'should be able to view events on user page' do
    expect(page).to have_content 'Display all users'  
  end
end
