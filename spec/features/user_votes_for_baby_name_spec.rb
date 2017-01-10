require 'rails_helper'

feature 'User Votes on Baby Name', type: 'feature' do
  scenario "from 'Top Names' with true" do
    user      = FactoryGirl.create(:user)
    baby_name = FactoryGirl.create(:baby_name)

    sign_in_user user
    click_link "baby_name_up_vote_#{baby_name.id}"

    expect(page).to have_content '1'
    expect(page).to have_selector 'a.is-active'
  end

  scenario "from 'Top Names' with false" do
    user      = FactoryGirl.create(:user)
    baby_name = FactoryGirl.create(:baby_name)

    sign_in_user user
    click_link "baby_name_down_vote_#{baby_name.id}"

    expect(page).to have_content '-1'
    expect(page).to have_selector 'a.is-active'
  end

  scenario "from 'Latest Names' with false" do
    user      = FactoryGirl.create(:user)
    baby_name = FactoryGirl.create(:baby_name)

    sign_in_user user
    click_link "latestbaby_name_down_vote_#{baby_name.id}"

    expect(page).to have_content '-1'
    expect(page).to have_selector 'a#latest.is-active'
  end

  scenario "from 'Latest Names' with true" do
    user      = FactoryGirl.create(:user)
    baby_name = FactoryGirl.create(:baby_name)

    sign_in_user user
    click_link "latestbaby_name_up_vote_#{baby_name.id}"

    expect(page).to have_content '1'
    expect(page).to have_selector 'a#latest.is-active'
  end

  scenario "from 'User#Show' with true" do
    user      = FactoryGirl.create(:user)
    baby_name = FactoryGirl.create(:baby_name, user_id: user.id)
    sign_in_user user

    click_link "show_user_#{user.id}"
    click_link "baby_name_up_vote_#{baby_name.id}"

    expect(page).to have_content '1'
    expect(page).to have_selector '.user-show__profile-pic'
  end
end
