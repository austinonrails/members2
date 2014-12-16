include Warden::Test::Helpers
Warden.test_mode!

# Feature: User index page
#   As a user
#   I want to see a list of users
#   So I can see who has registered
feature 'User index page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User listed on index page
  #   Given I am signed in
  #   When I visit the user index page
  #   Then I see my own email address
  scenario 'user sees own email address (encoded)' do
    user = FactoryGirl.create(:user, email_visible: true)
    login_as(user, scope: :user)
    visit users_path
    expect(page.html).to match(/<script id=\"mail_to\-.+\">/)
  end

end
