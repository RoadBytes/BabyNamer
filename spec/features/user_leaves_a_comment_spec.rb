require 'rails_helper'

feature 'User Leaves a Comment', type: 'feature' do
  scenario 'on a baby name' do
    moana_name = FactoryGirl.create(:baby_name, name: 'Moana')
    commenter  = FactoryGirl.create(:user)

    sign_in_user commenter
    navigate_to_commentable moana_name
    fill_in_comment_form moana_name

    verify_comment moana_name
  end

  scenario 'on a user' do
    commenter    = FactoryGirl.create(:user)
    commentable  = FactoryGirl.create(:user)
    FactoryGirl.create(:baby_name, user_id: commentable.id)

    sign_in_user commenter
    navigate_to_commentable commentable
    fill_in_comment_form commentable

    verify_comment commentable
  end

  scenario 'when not signed in' do
    moana_name = FactoryGirl.create(:baby_name, name: 'Moana')

    visit root_path
    navigate_to_commentable moana_name

    verify_no_comment_form
  end

  def navigate_to_commentable(commentable)
    class_name = commentable.class.to_s.tableize[0..-2]

    click_link "show_#{class_name}_#{commentable.id}"
  end

  def fill_in_comment_form(commentable)
    class_name = commentable.class.to_s.tableize[0..-2]

    fill_in "#{class_name}_#{commentable.id}_comment", with: 'This is a comment'

    click_button 'submit_new_comment'
  end

  def verify_comment(commenteable)
    expect(page).to have_content 'This is a comment'
    expect(commenteable.comments.size).to eq 1
  end

  def verify_no_comment_form
    expect(page).to_not have_content '#submit_new_comment'
  end
end
