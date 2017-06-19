class Objective < ApplicationRecord
  belongs_to :session, inverse_of: :objective
  has_many :notes, as: :notable, dependent: :destroy

  accepts_nested_attributes_for :notes
end
