class FacilitatorGuideSerializer < ActiveModel::Serializer
  attributes :id, :title, :level, :session, :authors,
             :intro_video, :body, :next, :previous
  has_many :authors, serializer: AuthorSerializer

  [:next, :previous].each do |record|
    define_method record do
      post = object.send(record)
      if post
        { id: post.id, title: post.title }
      end
    end
  end

end
