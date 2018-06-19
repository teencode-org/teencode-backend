class User < ApplicationRecord
  belongs_to :school

  def as_json(options={})
    super(
      only: [:name, :display_name, :user_access_token, :is_active, :school_id]
    )
  end
end
