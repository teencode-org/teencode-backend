class AddFeaturedToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :featured_image_url, :string
    add_column :blogs, :featured, :boolean
  end
end
