FactoryGirl.define do
  factory :inquiry do
    email "MyString"
    phone_number "MyString"
    message "MyText"
    sequence :name do |n|
      "user#{n}"
    end
  end
end
