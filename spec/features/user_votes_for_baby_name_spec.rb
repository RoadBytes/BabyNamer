require 'rails_helper'

feature 'User Votes on Baby Name', type: 'feature' do
  scenario 'with true' do
    FactoryGirl.create(:user)
    baby_name = FactoryGirl.create(:baby_name)

    visit root_path
    click_link "baby_name_up_vote_#{baby_name.id}"

    expect(page).to have_content '1'
  end

  scenario 'with false' do
    baby_name = FactoryGirl.create(:baby_name)

    visit root_path
    click_link "baby_name_down_vote_#{baby_name.id}"

    expect(page).to have_content '-1'
  end
end
