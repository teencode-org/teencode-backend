require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to belong_to(:school) }

  describe 'model validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :display_name }
    it { should validate_presence_of :user_access_token }
    it { should validate_presence_of :user_slack_id }
    it { should validate_presence_of :user_team_id }

    it { should validate_uniqueness_of :user_access_token }
    it { should validate_uniqueness_of :user_slack_id }
    it { should validate_uniqueness_of :user_team_id }
  end
end
