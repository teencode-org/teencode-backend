FactoryGirl.define do
  factory :resource do
    session nil
    description "MyText"
    title "MyString"
    notes [FactoryGirl.create(:note)]
  end
end
