class Parent < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :center, presence: true
  validates :location, presence: true
end
