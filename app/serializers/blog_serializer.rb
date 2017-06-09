class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :story

  has_one :author, serializer: AuthorSerializer
end
