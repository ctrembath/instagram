require 'rails_helper'

describe 'posts page' do

  context 'when no posts have been added' do

    it 'should ask you to add a post' do
      visit '/posts'
      expect(page).to have_content 'We don\'t have any posts yet!'
      expect(page).to have_link 'Why not add the first?'
    end

  end

  context 'when posts have been added' do
    before do
      Post.create(name: 'First Post')
    end

    it 'should show the posts' do
      expect(page).to have_content 'First Post'
      expect(page).not_to have content 'We don\'t have any posts yet!'
    end

  end

end