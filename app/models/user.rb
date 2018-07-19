class User < ApplicationRecord
  self.inheritance_column = :_type_disabled
  validates :name, presence: true
  validates :school_id, presence: true
  validates :type, presence: true
  validates :center, presence: true
  validates :location, presence: true

  belongs_to :school
end
