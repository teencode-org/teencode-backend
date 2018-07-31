FactoryGirl.define do
  factory :user do
    name 'MyString'
    is_active true
    display_name '@mystring'
    user_access_token 'xcxcxcwer'
    user_slack_id 'xo-123'
    user_team_id 'xo_234'
  end
end
