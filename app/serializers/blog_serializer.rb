class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :story, :featured_image_url

  has_one :author, serializer: AuthorSerializer
end
