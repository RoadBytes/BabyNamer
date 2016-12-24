require 'rails_helper'

feature 'User Signs Up', type: 'feature' do
  scenario 'with valid data' do
    navigate_to_new_user_form

    fill_in_new_user_form

    verify_database
    verify_page_message
  end

  def navigate_to_new_user_form
    visit '/'
    click_link 'new_user'
  end

  def fill_in_new_user_form
    fill_in 'baby_name_name', with: 'Tallulah_1'
    fill_in 'baby_name_background', with: "Bc I'm awesome"

    click_button 'submit_new_baby_name'
  end

  def verify_database
    expect(User.all.size).to eq 1
    expect(User.first[:name]).to eq 'Michelle'
    expect(User.first[:email]).to eq 'mona@gmail.com'
  end

  def verify_page_message
    expect(page).to have_content 'Welcome Michelle'
  end
end
