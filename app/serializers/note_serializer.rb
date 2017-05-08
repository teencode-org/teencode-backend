class NoteSerializer < ActiveModel::Serializer
  attributes :id, :description, :link
end
