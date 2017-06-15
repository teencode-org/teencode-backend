class Blog < ApplicationRecord
  belongs_to :author, class_name: AdminUser

  validates :author, :title, :story, presence: true
end
