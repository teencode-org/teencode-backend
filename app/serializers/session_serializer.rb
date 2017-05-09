class SessionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_one :project
  has_one :resource
  has_one :objective
end
