require 'rails_helper'

describe 'comments' do



  context 'when leaving a comment' do
    # before do
    #   Post.create(name:'First')
    # end

    let!(:first){Post.create(name:'First')}

    context 'when signed out' do

      it 'does not let users leave a comment' do
        visit '/'
        click_link 'First'
        click_link 'Leave a Comment'
        expect(page).to have_content 'Sign up'
      end

    end

    context 'when signed in' do

      before do
        visit '/'
        click_link('Register')
        fill_in('Email', with: 'test@tester.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
      end

      it 'lets users leave a comment' do
        visit '/'
        click_link 'First'
        click_link 'Leave a Comment'
        fill_in "Comment", with: 'This is a comment'
        click_button 'Leave Comment'
        expect(current_path).to eq "/posts/#{first.id}"
        expect(page).to have_content 'This is a comment' 
      end

    end

  end

end