class Session < ApplicationRecord
  has_one :project, inverse_of: :session, dependent: :destroy
  has_one :resource, inverse_of: :session, dependent: :destroy
  has_one :objective, inverse_of: :session, dependent: :destroy
  has_many :facilitator_guides, inverse_of: :session, dependent: :destroy

  accepts_nested_attributes_for :project
  accepts_nested_attributes_for :resource
  accepts_nested_attributes_for :objective
end
