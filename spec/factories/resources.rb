FactoryGirl.define do
  factory :resource do
    session nil
    description 'MyText'
    title 'MyString'
    after(:create) do |resource, _evaluator|
      create_list(:note, 3, notable: resource)
    end
  end
end
