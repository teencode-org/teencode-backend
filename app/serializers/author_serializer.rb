class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name

  def name
    object.first_name + " " + object.last_name
  end
end
