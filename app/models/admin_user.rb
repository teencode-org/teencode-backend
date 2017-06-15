class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stories, class_name: Blog, foreign_key: :author_id
  validates :first_name, :last_name, presence: true

  def to_s
    name
  end

  def name
    first_name + " " + last_name
  end
end
