require 'rails_helper'

describe 'comments' do


  context 'when leaving a comment' do
    # before do
    #   Post.create(name:'First')
    # end

    let!(:first){Post.create(name:'First')}

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