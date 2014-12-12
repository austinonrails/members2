module Features
  module SessionHelpers
    def sign_up_with(email, password, confirmation, first_name, last_name)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'First Name', with: first_name
      fill_in 'Last Name', with: last_name
      fill_in 'Password', with: password
      fill_in 'Password confirmation', :with => confirmation
      click_button 'Sign Up'
    end

    def signin(email, password)
      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign In'
    end
  end
end
