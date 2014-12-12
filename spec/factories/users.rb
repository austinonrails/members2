FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    first_name                  { Faker::Name.first_name }
    last_name                   { Faker::Name.last_name }
    email                       { Faker::Internet.email }
    email_visible               { rand(2) == 1 }
    password                    "please123"
    remote_avatar_url           { "http://images.techtimes.com/data/images/full/4061/bill-gates-wealthiest-person.jpg?w=600" }
    website_url                 { Faker::Internet.url }
    github_url                  { "https://github.com/#{Faker::Internet.user_name}" }
    linkedin_url                { "https://www.linkedin.com/in/#{Faker::Internet.user_name}" }
    twitter_handle              { Faker::Internet.user_name }
    bio                         { Faker::Lorem.paragraph }
    current_job                 { "#{Faker::Name.title} at #{Faker::Company.name}" }
  end
end



