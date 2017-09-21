class LessonNote < ApplicationRecord
  has_and_belongs_to_many :authors, class_name: "AdminUser"

  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end
end
