FactoryGirl.define do
  factory :blog, aliases: [:story] do
    author
    title Faker::Lorem.sentence
    story Faker::Lorem.paragraph(2)
  end
end
