class SessionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :order
  has_one :project
  has_one :resource
  has_one :objective
  has_many :facilitator_guides
  has_many :lesson_notes
end
