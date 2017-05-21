FactoryGirl.define do
  factory :objective do
    session nil
    description "MyText"
    notes [FactoryGirl.create(:note)]
  end
end
