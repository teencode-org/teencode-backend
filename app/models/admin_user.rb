class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stories, class_name: Blog, foreign_key: :author_id
  has_and_belongs_to_many :facilitator_guides
  has_and_belongs_to_many :lesson_notes

  validates :first_name, :last_name, presence: true

  def to_s
    name
  end

  def name
    first_name + " " + last_name
  end
end
