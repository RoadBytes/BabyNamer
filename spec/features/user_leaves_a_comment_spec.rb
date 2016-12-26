require 'rails_helper'

feature 'User Leaves a Comment', type: 'feature' do
  scenario 'on a baby name' do
    moana_name = FactoryGirl.create(:baby_name, name: 'Moana')
    commenter  = FactoryGirl.create(:user)

    sign_in_user commenter
    navigate_to_baby_name moana_name
    fill_in_comment_form moana_name

    verify_comment commenter
  end

  scenario 'when not signed in' do
    moana_name = FactoryGirl.create(:baby_name, name: 'Moana')

    visit root_path
    navigate_to_baby_name moana_name

    verify_no_comment_form
  end

  def navigate_to_baby_name(baby_name)
    click_link "show_baby_name_#{baby_name.id}"
  end

  def fill_in_comment_form(commentable)
    fill_in "baby_name_#{commentable.id}_comment", with: 'This is a comment'

    click_button 'submit_new_comment'
  end

  def verify_comment(commenter)
    expect(page).to have_content 'This is a comment'
    expect(commenter.comments.size).to eq 1
  end

  def verify_no_comment_form
    expect(page).to_not have_content '#submit_new_comment'
  end
end
