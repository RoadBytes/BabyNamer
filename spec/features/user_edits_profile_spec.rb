require 'rails_helper'

feature 'User Edits Profile', type: 'feature' do
  context 'with valid data' do
    scenario 'accepts new profile pic' do
      jomari = FactoryGirl.create(:user, name: 'Jomari')
      sign_in_user jomari
      click_link 'edit_user'

      attach_file 'user_profile_pic', 'spec/support/uploads/user.jpg'
      click_button 'submit_user'

      expect(page).to have_content 'Profile Updated'
      expect(jomari.reload.profile_pic_file_name).to eq 'user.jpg'
    end

    scenario 'changing profile pic' do
      jomari = FactoryGirl.create(:user, name: 'Jomari')
      sign_in_user jomari
      click_link 'edit_user'

      attach_file 'user_profile_pic', 'spec/support/uploads/user.jpg'
      click_button 'submit_user'

      attach_file 'user_profile_pic', 'spec/support/uploads/other_user.jpg'
      click_button 'submit_user'

      expect(page).to have_content 'Profile Updated'
      expect(jomari.reload.profile_pic_file_name).to eq 'other_user.jpg'
    end
  end
end
