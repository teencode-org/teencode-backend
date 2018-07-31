class User < ApplicationRecord
  belongs_to :school

  validates :display_name, :name, presence: true
  validates :user_access_token, uniqueness: true, presence: true
  validates :user_slack_id, uniqueness: true, presence: true
  validates :user_team_id, uniqueness: true, presence: true

  def as_json(options={})
    super(
      only: [:name, :display_name, :user_access_token, :is_active, :school_id]
    )
  end
end
