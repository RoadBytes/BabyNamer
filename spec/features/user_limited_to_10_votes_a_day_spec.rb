require 'rails_helper'

feature 'User Limited on Votes to 10 per day', type: 'feature' do
  scenario 'vote limit times' do
    user      = FactoryGirl.create(:user)
    baby_name = FactoryGirl.create(:baby_name)

    sign_in_user user
    vote_ten_times baby_name

    expect(page).to have_content '10'
  end

  scenario 'vote limit plus 1 times' do
    user      = FactoryGirl.create(:user)
    baby_name = FactoryGirl.create(:baby_name)

    sign_in_user user
    vote_ten_times baby_name

    # vote eleventh time
    vote_for baby_name

    # no change in votes
    expect(user.votes.count).to eq 10
    # check error message for page
    expect(page).to have_content 'Only 10 votes per day'
  end

  def vote_ten_times(baby_name)
    10.times { vote_for baby_name }
  end

  def vote_for(baby_name)
    click_link "baby_name_up_vote_#{baby_name.id}"
  end
end
