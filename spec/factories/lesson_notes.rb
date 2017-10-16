FactoryGirl.define do
  factory :lesson_note do
    session
    title { Faker::Lorem.word }
    level { Faker::Lorem.word }
    intro_video "MyString"
    body { Faker::Lorem.paragraph(2) }
  end
end
