require 'factory_girl'
require 'pry'

namespace :dev do
  desc "Creates a bunch of fake users for development needs."
  task create_fake_users: :environment do
    # confirmed, valid users
    100.times do
      FactoryGirl.create(:user)
    end
    # a few unconfirmed users
    10.times do
      user = FactoryGirl.create(:user)
      user.update_attributes(confirmed_at: nil)
    end
  end

end
