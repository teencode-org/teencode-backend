class Parent < ApplicationRecord
  has_many :students

  accepts_nested_attributes_for :students, allow_destroy: true
end

# mainland = FactoryGirl.create(:school, center: 'Lagos Mainland')
# island = FactoryGirl.create(:school, center: 'Lagos Island')

# [mainland, island].each do |school|
#   10.times do |n|
#     parent = FactoryGirl.create(:parent)
#     2.times do |s|
#       FactoryGirl.create(:student, parent: parent, school: school)
#     end
#   end
# end