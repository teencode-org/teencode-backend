class SessionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :projects
  has_many :resources
  has_many :objectives
end
