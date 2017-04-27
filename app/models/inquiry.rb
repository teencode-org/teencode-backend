class Inquiry < ApplicationRecord
  validates :phone_number, :email,:message, :name,  presence: true

end
