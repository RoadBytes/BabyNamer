require 'rails_helper'

RSpec.describe BabyName, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should belong_to(:user) }
  it { should have_many(:comments) }

  describe '.alphabetic' do
    it 'returns an empty array when there are no names' do
      names = BabyName.alphabetic

      expect(names).to eq []
    end

    it 'returns case insensitive names ASC' do
      first  = FactoryGirl.create(:baby_name, name: 'First')
      second = FactoryGirl.create(:baby_name, name: 'Second')
      third  = FactoryGirl.create(:baby_name, name: 'Third')
      fourth = FactoryGirl.create(:baby_name, name: 'Fourth')

      3.times do
        FactoryGirl.create(:vote,
                           voteable: second, vote: true)
      end
      9.times do
        FactoryGirl.create(:vote,
                           voteable: first,
                           user_id: 2, vote: true)
      end

      names = BabyName.alphabetic

      expect(names).to eq [first, fourth, second, third]
    end

    it 'returns all names' do
      60.times { FactoryGirl.create(:baby_name) }

      names = BabyName.alphabetic

      expect(names.size).to eq 60
    end
  end

  describe '.latest' do
    it 'returns an empty array when there are no names' do
      names = BabyName.latest

      expect(names).to eq []
    end

    it 'returns the most recent names ordered by created_at DESC' do
      first  = FactoryGirl.create(:baby_name, name: 'First')
      second = FactoryGirl.create(:baby_name, name: 'Second')
      third  = FactoryGirl.create(:baby_name, name: 'Third')
      fourth = FactoryGirl.create(:baby_name, name: 'Fourth')

      3.times do
        FactoryGirl.create(:vote,
                           voteable: second, vote: true)
      end
      9.times do
        FactoryGirl.create(:vote,
                           voteable: first,
                           user_id: 2, vote: true)
      end

      names = BabyName.latest

      expect(names).to eq [fourth, third, second, first]
    end

    it 'only returns 50 names' do
      60.times { FactoryGirl.create(:baby_name) }

      names = BabyName.latest

      expect(names.size).to eq 50
    end
  end

  describe '.most_popular' do
    it 'returns an empty array when there are no names' do
      names = BabyName.most_popular

      expect(names).to eq []
    end

    it 'returns the most popular names ordered by votes' do
      FactoryGirl.create(:baby_name, name: 'Least')
      second_popular_name = FactoryGirl.create(:baby_name, name: 'Second')
      3.times do
        FactoryGirl.create(:vote,
                           voteable: second_popular_name, vote: true)
      end
      FactoryGirl.create(:baby_name, name: 'Jack')
      popular_name = FactoryGirl.create(:baby_name, name: 'Popular')
      9.times do
        FactoryGirl.create(:vote,
                           voteable: popular_name,
                           user_id: 2, vote: true)
      end

      names = BabyName.most_popular

      expect(names.first).to eq popular_name
      expect(names.second).to eq second_popular_name
    end

    it 'only returns 50 names' do
      60.times { FactoryGirl.create(:baby_name) }

      names = BabyName.most_popular

      expect(names.size).to eq 50
    end
  end

  describe '#user_handle' do
    it 'returns a user name when available' do
      user = FactoryGirl.create(:user, name: 'Joe Joe')
      baby_name = FactoryGirl.create(:baby_name,
                                     name: 'Bangbang', user_id: user.id)

      expect(baby_name.user_handle).to eq user.name
    end

    it 'returns a user email when name not available' do
      user = FactoryGirl.create(:user, name: nil, email: 'j@j.com')
      baby_name = FactoryGirl.create(:baby_name,
                                     name: 'Bangbang', user_id: user.id)

      expect(baby_name.user_handle).to eq user.email
    end

    it "returns 'Suggested by no one' if no association" do
      baby_name = FactoryGirl.create(:baby_name, name: 'Bangbang', user_id: nil)

      expect(baby_name.user_handle).to eq 'Suggested by no one'
    end
  end
end
