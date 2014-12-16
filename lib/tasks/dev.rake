require 'factory_girl'
require 'pry'

namespace :dev do
  desc "Creates a bunch of fake users for development needs."
  task create_fake_users: :environment do
    # confirmed, valid users
    puts '  Creating fake users...'
    30.times do
      u = FactoryGirl.create(:user)
      puts u.name
    end
    # a few unconfirmed users
    puts '  Creating some UNCONFIRMED users...'
    10.times do
      puts '.'
      user = FactoryGirl.create(:user)
      user.update_attributes(confirmed_at: nil)
      puts user.name
    end
    puts 'Done.'
  end

end
