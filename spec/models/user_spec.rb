require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should have_many(:baby_names) }

  describe 'has_secure_password method' do
    it 'validates password' do
      user = FactoryGirl.create(:user,
                                password: '1234',
                                password_confirmation: '1234')

      expect(user.authenticate('1234')).to eq user
    end

    it 'invalidates incorrect password' do
      user = FactoryGirl.create(:user,
                                password: '1234',
                                password_confirmation: '1234')

      expect(user.authenticate('wrong')).to eq false
    end
  end

  describe '#handle' do
    it 'returns @name where there is a name' do
      named = FactoryGirl.create(:user, name: 'Me')

      expect(named.handle).to eq 'Me'
    end

    it 'returns @email where there is no name' do
      unnamed = FactoryGirl.create(:user, name: '', email: 'asdf@asdf.com')

      expect(unnamed.handle).to eq 'asdf@asdf.com'
    end
  end
end
