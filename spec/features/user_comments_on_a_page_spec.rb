require 'rails_helper'

feature 'User Comments on a Page', type: 'feature' do
  scenario 'on a page' do
    commenter    = FactoryGirl.create(:user)
    commentable  = 'about'

    sign_in_user commenter
    navigate_to_page commentable
    fill_in_page_comment_form commentable

    verify_comment
  end

  def navigate_to_page(id)
    visit "pages/#{id}"
  end

  def fill_in_page_comment_form(commentable)
    fill_in "#{commentable}_page_comment", with: 'This is a comment'

    click_button 'submit_new_comment'
  end

  def verify_comment
    expect(page).to have_content 'This is a comment'
  end
end
