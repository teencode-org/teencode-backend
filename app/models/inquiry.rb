class Inquiry < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\.]+[\w+]\.[a-z]+\z/i
  validates :phone_number,:message, :name,  presence: true
  validates(
    :email,
    presence: true,
    format: { with: VALID_EMAIL }
  )

end
