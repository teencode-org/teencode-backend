FactoryGirl.define do
  factory :project do
    session nil
    description "MyText"
    title "MyString"
    notes [FactoryGirl.create(:note)]
  end
end
