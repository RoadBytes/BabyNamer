require 'rails_helper'

RSpec.describe BabyNameUser, type: :model do
  it { should belong_to :user }
  it { should belong_to :favorite }
end
