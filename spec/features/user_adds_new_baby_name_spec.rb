require 'rails_helper'

feature 'User adds new BabyName', type: 'feature' do
  scenario 'with valid data' do
    navigate_to_new_baby_name_form

    fill_in_new_baby_name_form_incorrectly

    verify_database_empty
    verify_redirected_page
  end

  scenario 'with valid data' do
    navigate_to_new_baby_name_form

    fill_in_new_baby_name_form

    verify_database
    verify_index_page
  end

  def navigate_to_new_baby_name_form
    visit '/'
    # sign in
    click_link 'new_baby_name'
  end

  def fill_in_new_baby_name_form
    fill_in 'baby_name_name', with: 'Tallulah_1'
    fill_in 'baby_name_background', with: "Bc I'm awesome"

    click_button 'submit_new_baby_name'
  end

  def fill_in_new_baby_name_form_incorrectly
    fill_in 'baby_name_name', with: ''
    fill_in 'baby_name_background', with: "Bc I'm awesome"

    click_button 'submit_new_baby_name'
  end

  def verify_database
    expect(BabyName.all.size).to eq 1
    expect(BabyName.first[:name]).to eq 'Tallulah_1'
    expect(BabyName.first[:background]).to eq "Bc I'm awesome"
  end

  def verify_database_empty
    expect(BabyName.all.size).to eq 0
  end

  def verify_index_page
    expect(page).to have_content 'Tallulah_1'
  end

  def verify_redirected_page
    expect(page).to have_content "Name can't be blank"
  end
end
