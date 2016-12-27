require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should belong_to(:creator) }
  it { should belong_to(:voteable) }

  it 'validates votes_limited_to_10_per_day' do
    user      = FactoryGirl.create(:user)
    baby_name = FactoryGirl.create(:baby_name)
    10.times do
      FactoryGirl.create(:vote,
                         vote: true,
                         voteable: baby_name,
                         user_id:  user.id)
    end

    vote = Vote.new(vote: true, voteable: baby_name, user_id: user.id)

    expect(vote).to be_invalid
    expect(vote.errors[:base]).to include('Only 10 votes per day')
  end

  describe '.user_vote_count_today(user)' do
    it 'starts with 0 votes' do
      user = FactoryGirl.create(:user)

      expect(Vote.vote_count_today(user)).to eq 0
    end

    it 'increments as votes are made' do
      user      = FactoryGirl.create(:user)
      baby_name = FactoryGirl.create(:baby_name)

      FactoryGirl.create(:vote,
                         voteable: baby_name,
                         user_id:  user.id)

      expect(Vote.vote_count_today(user)).to eq 1
    end

    it 'resets on new day' do
      user      = FactoryGirl.create(:user)
      baby_name = FactoryGirl.create(:baby_name)

      FactoryGirl.create(:vote,
                         voteable: baby_name,
                         user_id:  user.id)

      # go to tomorrow
      Timecop.freeze(Date.today + 1) do
        expect(Vote.vote_count_today(user)).to eq 0
      end
    end
  end

  describe '#vote_available?' do
    it 'returns true if there are less than 10 votes for the day' do
      user      = FactoryGirl.create(:user)
      baby_name = FactoryGirl.create(:baby_name)

      FactoryGirl.create(:vote,
                         voteable: baby_name,
                         user_id:  user.id)

      expect(Vote.vote_available?(user)).to eq true
    end

    it 'returns false if there are 10 or more votes for the day' do
      user      = FactoryGirl.create(:user)
      baby_name = FactoryGirl.create(:baby_name)

      10.times do
        FactoryGirl.create(:vote,
                           voteable: baby_name,
                           user_id:  user.id)
      end

      expect(Vote.vote_available?(user)).to eq false
    end
  end
end
