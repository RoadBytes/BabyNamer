require 'rails_helper'

RSpec.describe BabyName, type: :model do
  it { should validate_presence_of(:name) }
end