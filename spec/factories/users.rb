FactoryGirl.define do
  factory :user do
    name 'MyString'
    is_active false
    center 'Lagos Island'
    location 'Nigeria'
    type 'student'
    level 'SS1'
  end
end
