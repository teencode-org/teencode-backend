FactoryGirl.define do
  factory :project do
    session nil
    description 'MyText'
    title 'MyString'

    after(:create) do |project, _evaluator|
      create_list(:note, 3, notable: project)
    end
  end
end
