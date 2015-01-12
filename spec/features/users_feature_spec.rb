require 'rails_helper'

feature 'visiting homepage' do

  context 'user has not signed in' do

    scenario 'should display the website title' do
      visit '/' 
      expect(page).to have_content 'Instagram'
    end

    scenario 'user should be asked to sign in or register' do
      visit '/'
      expect(page).to have_link 'Sign In'
      expect(page).to have_link 'Register'
    end

  end

  context 'user has signed in' do

    before do
      visit '/'
      click_link('Register')
      fill_in('Email', with: 'test@tester.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_buttion('Register')
    end

    scenario 'user should not be asked to sign out' do
      visit '/'
      expect(page).not_to have_link 'Sign Out'
    end

  end

end