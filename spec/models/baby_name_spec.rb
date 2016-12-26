require 'rails_helper'

RSpec.describe BabyName, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should belong_to(:user) }

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
