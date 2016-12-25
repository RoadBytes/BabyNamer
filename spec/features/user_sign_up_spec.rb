require 'rails_helper'

feature 'User Signs Up', type: 'feature' do
  scenario 'with valid data' do
    navigate_to_new_user_form

    fill_in_new_user_form

    verify_database
    verify_page_message
    verify_signed_in
  end

  def navigate_to_new_user_form
    visit '/'
    click_link 'new_user'
  end

  def fill_in_new_user_form
    fill_in 'user_name', with: 'Michelle'
    fill_in 'user_email', with: 'mona@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'

    click_button 'submit_user'
  end

  def verify_database
    expect(User.all.size).to eq 1
    expect(User.first[:name]).to eq 'Michelle'
    expect(User.first[:email]).to eq 'mona@gmail.com'
  end

  def verify_page_message
    expect(page).to have_content 'Welcome Michelle'
  end

  def verify_signed_in
    expect(page).to have_content 'Sign Out'
  end
end
