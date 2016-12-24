require 'rails_helper'

feature 'User Sign In', type: 'feature' do
  scenario 'with valid data' do
    @user = FactoryGirl.create(:user, password: 'password')

    navigate_to_new_session
    fill_in_new_session_form_valid
    verify_valid_data
  end

  scenario 'with invalid data' do
    @user = FactoryGirl.create(:user, password: 'password')

    navigate_to_new_session
    fill_in_new_session_form_invalid
    verify_invalid_data
  end

  def navigate_to_new_session
    visit      root_path
    click_link 'new_session'
  end

  def fill_in_new_session_form_valid
    fill_in  'session_email',    with: @user.email
    fill_in  'session_password', with: @user.password
    click_on 'submit_session'
  end

  def verify_valid_data
    expect(page).to have_content 'Welcome'
    # expect(page).to have_content 'Sign Out'
  end

  def fill_in_new_session_form_invalid
    fill_in  'session_email',    with: @user.email
    fill_in  'session_password', with: 'wrong password'
    click_on 'submit_session'
  end

  def verify_invalid_data
    expect(page).to have_content 'Error please try again'
    # expect(page).to have_content 'Sign Out'
  end
end
