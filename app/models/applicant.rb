class Applicant < ApplicationRecord
  validates :name, presence: true
  validates :profession, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
end
