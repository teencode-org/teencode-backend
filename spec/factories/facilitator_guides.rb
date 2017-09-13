FactoryGirl.define do
  factory :facilitator_guide do
    title { Faker::Lorem.word }
    level { Faker::Lorem.word }
    session { Faker::Number.between(1, 10) }
    intro_video "MyString"
    body { Faker::Lorem.paragraph(2) }
  end
end
