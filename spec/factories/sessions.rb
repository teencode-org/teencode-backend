FactoryGirl.define do
  factory :session do
    title "MyString"
    description "MyText"

    factory :session_with_resources do
      after(:create) do |session|
        create_list(:resource, 2, session: session)
      end
    end

    # session with resource, project, and objective
    factory :session_with_rpo do
      after(:create) do |session|
        create_list(:resource, 2, session: session)
        create_list(:objective, 2, session: session)
        create_list(:project, 2, session: session)
      end
    end
  end
end
