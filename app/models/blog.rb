class Blog < ApplicationRecord
  belongs_to :author, class_name: AdminUser

  validates :author, presence: true
end
