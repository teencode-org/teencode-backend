class Project < ApplicationRecord
  belongs_to :session, inverse_of: :project
  has_many :notes, as: :notable, dependent: :destroy

  accepts_nested_attributes_for :notes
end
