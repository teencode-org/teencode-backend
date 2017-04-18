ActiveAdmin.register Session do

permit_params(
  :title,
  :description,
  projects_attributes: [:id, :title, :description, :_destroy],
  resources_attributes: [:id, :link, :description, :_destroy],
  objectives_attributes: [:id, :description]
)

show do
  attributes_table do
    row :title
    row :description

    panel "Session Projects" do
      table_for session.projects do
        column :title
        column :description
      end
    end

    panel "Session Resources" do
      table_for session.resources do
        column :link
        column :description
      end
    end

    panel "Session Objectives" do
      table_for session.objectives do
        column :description
      end
    end
  end
end

form do |f|
  f.inputs "Curriculum Session" do
    f.input :title, label: "Session Title"
    f.input :description, label: "Session Description"
  end

  f.inputs do
    f.has_many :projects, heading: "Session Projects", allow_destroy: true do |p|
      p.input :title
      p.input :description
    end
  end

  f.inputs do
    f.has_many :resources, heading: "Session Resources", allow_destroy: true do |p|
      p.input :link
      p.input :description
    end
  end

  f.inputs do
    f.has_many :objectives, heading: "Session Objectives", allow_destroy: true do |p|
      p.input :description
    end
  end

  f.actions
end

end
