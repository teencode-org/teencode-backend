class Session < ApplicationRecord
  has_many :projects
  has_many :resources
  has_many :objectives

  accepts_nested_attributes_for :projects, :resources, :objectives
end
