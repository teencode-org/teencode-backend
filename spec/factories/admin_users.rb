FactoryGirl.define do
  factory :admin_user, aliases: [:author] do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email { Faker::Internet.free_email }
    password 'password'
  end
end
