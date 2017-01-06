require 'rails_helper'

feature 'User Favorites a Baby Name', type: 'feature' do
  scenario 'from BabyName#Show' do
    moana_name = FactoryGirl.create(:baby_name, name: 'Moana')
    favoriter  = FactoryGirl.create(:user)

    sign_in_user favoriter
    navigate_to_commentable moana_name
    click_favorite moana_name

    verify_page_info
    verify_favorite favoriter, moana_name
  end

  def navigate_to_commentable(commentable)
    class_name = commentable.class.to_s.tableize[0..-2]

    click_link "show_#{class_name}_#{commentable.id}"
  end

  def click_favorite(baby_name)
    click_link "favorite_baby_name_#{baby_name.id}"
  end
end
