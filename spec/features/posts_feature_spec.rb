require 'rails_helper'

describe 'posts page' do

  context 'when no posts have been added' do

    it 'should ask you to add a post' do
      visit '/'
      expect(page).to have_content 'We don\'t have any posts yet!'
      expect(page).to have_link 'Why not add the first?'
    end

    it 'should let you create a post' do
      visit '/'
      click_link 'Why not add the first?'
      fill_in 'Name', with: 'New Post'
      click_button 'Create Post'
      expect(page).to have_content 'New Post'
      expect(current_path).to eq '/'
    end


  end

  context 'when posts have been added' do
    before do
      Post.create(name:'First')
    end

    it 'should show the posts' do
      visit '/'
      expect(page).to have_content 'First'
      expect(page).not_to have_content 'We don\'t have any posts yet!'
    end

    it 'should let you add a post' do
      visit '/'
      click_link 'Add a new post!'
      fill_in 'Name', with: 'New Post'
      click_button 'Create Post'
      expect(page).to have_content 'New Post'
      expect(current_path).to eq '/'
    end

    it 'should give each post its own page' do
      visit '/'
      click_link 'First'
      expect(page).to have_content 'First'
      # expect(current_path).to eq "/posts/#{first.id}"
    end

    # it 'should let a post be deleted' do
    #   visit '/'
    #   click_link 'First'
    #   expect(page)
    # end

  end

end