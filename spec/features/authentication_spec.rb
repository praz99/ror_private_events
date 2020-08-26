require 'rails_helper'

RSpec.feature 'the signup process' do
  before(:example) do 
    visit new_user_url
  end

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'Sign up'
  end
end

RSpec.feature 'signing up a user' do
  before(:example) do
    visit new_user_path
    fill_in 'user_name', with: 'kikiolla'
    fill_in 'name', with: 'kiki'
    click_on 'Create account'
  end

  scenario 'after signing up redirect to user SHOW page' do
    expect(page).to have_content ' '
  end

  scenario 'display username ontop of the page after signing up' do
    expect(page).to have_content 'kikiolla'
  end
end