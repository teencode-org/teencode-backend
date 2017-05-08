class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :notes
end
