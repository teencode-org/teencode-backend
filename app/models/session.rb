class Session < ApplicationRecord
  has_one :project, inverse_of: :session
  has_one :resource, inverse_of: :session
  has_one :objective, inverse_of: :session
  before_save :tets

  accepts_nested_attributes_for :project
  accepts_nested_attributes_for :resource
  accepts_nested_attributes_for :objective

  def tets
    # binding.pry
  end
end
