ActiveAdmin.register Blog do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
#
#
  permit_params do
    permitted = [:author_id, :title, :story]
    params[:blog][:author_id] = current_admin_user.id if params[:blog]
    permitted
  end

  index do
    selectable_column
    id_column
    column :author
    column :title
    column "Content", :story do |blog|
      blog.story.html_safe
    end
    column :created_at
    column "Last Update", :updated_at
    actions
  end

  show do
    attributes_table do
      row :author
      row :title
      row :story do |blog|
        blog.story.html_safe
      end
      row :created_at
      row "Last Update" do |blog|
        blog.updated_at
      end
    end
    # active_admin_comments
  end

end
