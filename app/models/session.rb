class Session < ApplicationRecord
  has_many :projects, inverse_of: :session
  has_many :resources, inverse_of: :session
  has_many :objectives, inverse_of: :session
  before_save :tets

  accepts_nested_attributes_for :projects
  accepts_nested_attributes_for :resources
  accepts_nested_attributes_for :objectives

  def tets
    # binding.pry
  end
end
