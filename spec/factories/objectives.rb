FactoryGirl.define do
  factory :objective do
    session nil
    description 'MyText'
    after(:create) do |objective, _evaluator|
      create_list(:note, 3, notable: objective)
    end
  end
end
