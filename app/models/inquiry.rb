class Inquiry < ApplicationRecord
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :message, presence: true
end
