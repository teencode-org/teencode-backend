class Student < ApplicationRecord
  belongs_to :parent
  belongs_to :school

  scope :mainland_students, -> { self.joins("INNER JOIN parents ON parents.id = students.parent_id AND parents.center = 'Lagos Mainland'")}
  scope :island_students, -> { self.joins("INNER JOIN parents ON parents.id = students.parent_id AND parents.center = 'Lagos Island'")}
end
