require 'rails_helper'
require 'spec_helper'

RSpec.feature 'the signup process' do
  before(:example) do 
    visit new_user_url
  end

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'Sign up'
  end
end

RSpec.feature 'sign up a user' do
  before(:example) do
    visit new_user_path
    fill_in 'username', with: 'kikiolla'
    fill_in 'name', with: 'kiki'
    click_on 'Create account'
    visit '/login'
    fill_in 'username', with: 'kikiolla'
    click_on 'Log in'
  end

  scenario 'redirect to user SHOW page' do
    expect(page).to have_content 'Display all user event'
  end

  scenario 'display username ontop of the page after signing up' do
    expect(page).to have_content 'kikiolla'
  end
end

RSpec.feature 'sign in as a non-existing user' do
  before(:example) do
    visit '/signup'
    expect(page).to have_content('Sign up')
    FactoryBot.create(:user)
    fill_in 'username', with: 'kikiolla'
    fill_in 'name', with: 'okiki'
    click_on 'Create account'
    visit login_path
    fill_in 'username', with: 'ccccccc'
    click_on 'Log in'
  end

  scenario 'should not redirect to user page' do 
    expect(page).not_to have_content ' Hello world '
  end

  scenario 'should display error message if user does not exist' do
    expect(page).to have_content 'Invalid username'
  end
end

RSpec.feature 'should sign in an existing user' do 
  before(:example) do
    visit '/signup'
    expect(page).to have_content('Sign up')
    FactoryBot.create(:user)
    fill_in 'username', with: 'kikiolla'
    fill_in 'name', with: 'okiki'
    click_on 'Create account'
    FactoryBot.create(:user)
    visit '/login'
    fill_in 'session[username]', with: 'kikiolla'
    click_on 'Log in'
  end

  scenario 'should redirect to user page after signup' do
    expect(page).to have_content 'Display all user event'
  end

  scenario 'shows username on the homepage after signup' do
    expect(page).to have_content 'kikiolla'
  end

end
