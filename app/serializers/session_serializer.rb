class SessionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :order
  has_one :project
  has_one :resource
  has_one :objective
end
