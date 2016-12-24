require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }

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
end
