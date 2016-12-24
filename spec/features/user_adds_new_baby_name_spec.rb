require 'rails_helper'

feature 'User adds new BabyName', type: 'feature' do
  it 'Stores BabyName attributes' do
    visit '/'
    # sign in
    click_link 'new_baby_name'
    fill_in 'baby_name_name', with: 'Tallulah_1'
    fill_in 'baby_name_background', with: "Bc I'm awesome"

    click_button 'submit_new_baby_name'

    expect(BabyName.all.size).to eq 1
    expect(BabyName.first[:name]).to eq 'Tallulah_1'
    expect(BabyName.first[:background]).to eq "Bc I'm awesome"
  end
end
