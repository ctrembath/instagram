require 'rails_helper'

feature 'visiting homepage' do

  context 'user has not signed in' do

    scenario 'should display the website title' do
      visit '/' 
      expect(page).to have_content 'Instagram'
    end

#     scenario 'user should be asked to sign in or register' do
#       visit '/'
#       expect(page).to have_link 'Sign In'
#       expect(page).to have_link 'Register'
#     end

#     scenario 'user should not be asked to sign out' do
#       visit '/'
#       expect(page).not_to have_link 'Sign Out'
#     end

  end
end