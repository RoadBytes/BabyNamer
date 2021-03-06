require 'rails_helper'

feature 'User Favorites a Baby Name', type: 'feature' do
  scenario 'from BabyName#Show' do
    moana_name = FactoryGirl.create(:baby_name, name: 'moana')
    favoriter  = FactoryGirl.create(:user)

    sign_in_user favoriter
    navigate_to_baby_name moana_name
    click_favorite moana_name

    verify_page_info moana_name
    verify_favorite favoriter, moana_name
  end

  def navigate_to_baby_name(commentable)
    class_name = commentable.class.to_s.tableize[0..-2]

    click_link "show_#{class_name}_#{commentable.id}"
  end

  def click_favorite(baby_name)
    click_button "favorite_baby_name_#{baby_name.id}"
  end

  def verify_page_info(baby_name)
    expect(page).to have_content 'Moana added to your favorites'
    expect(page).to have_selector "#unfavorite_baby_name_#{baby_name.id}"
  end

  def verify_favorite(favoriter, baby_name)
    expect(favoriter.favorites).to include baby_name
  end
end
