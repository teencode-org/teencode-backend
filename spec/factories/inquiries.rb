FactoryGirl.define do
  factory :inquiry do
    email 'test@xample.com'
    phone_number 'MyString'
    message 'MyText'
    sequence :name do |n|
      "user#{n}"
    end
  end
end
