class LessonNote < ApplicationRecord
  has_and_belongs_to_many :authors, class_name: 'AdminUser'
  belongs_to :session

  def next
    self.class.where('id > ?', id).first
  end

  def previous
    self.class.where('id < ?', id).last
  end
end
