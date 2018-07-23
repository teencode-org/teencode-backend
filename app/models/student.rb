class Student < ApplicationRecord
  belongs_to :parent
  belongs_to :school
end
