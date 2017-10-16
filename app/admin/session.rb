ActiveAdmin.register Session do
  menu if: proc { current_admin_user.super_user }

  permit_params(
    :title,
    :description,
    :order,
    objective_attributes: [
      :id,
      :title,
      :description,
      notes_attributes: [:id, :description]],
    resource_attributes: [
      :id,
      :title,
      :description,
      notes_attributes: [:id, :description, :link]],
    project_attributes: [
      :id,
      :title,
      :description,
      notes_attributes: [:id, :description, :link]]
  )

  sidebar "Guides and notes", only: [:show, :edit] do
    ul do
      li link_to "Facilitator Guides",    admin_session_facilitator_guides_path(resource)
      li link_to "Lesson Notes",    admin_session_lesson_notes_path(resource)
    end
  end

  show do
    attributes_table do
      row :title
      row :description
      row :order

      panel "Session Objective" do
        attributes_table_for session.objective do
          row :title
          row "Notes" do
            table_for session.objective.notes do
              column :description
            end
          end
        end
      end

      panel "Session Resource" do
        attributes_table_for session.resource do
          row :title
          row "Notes" do
            table_for session.resource.notes do
              column :description
              column :link
            end
          end
        end
      end

      panel "Session Project" do
        attributes_table_for session.project do
          row :title
          row "Notes" do
            table_for session.project.notes do
              column :description
              column :link
            end
          end
        end
      end
    end
  end

  form do |f|
    f.inputs "Curriculum Session" do
      f.input :title, label: "Session Title"
      f.input :description, label: "Session Description"
      f.input :order, label: "Session Order"
    end

    f.inputs do
      f.inputs "Session Objective", for: [:objective, f.object.objective || Objective.new] do |p|
        p.input :title
        p.has_many :notes, heading: "Objective Notes", allow_destroy: true do |n|
          n.input :description
        end
      end
    end

    f.inputs do
      f.inputs "Session Resource", for: [:resource, f.object.resource || Resource.new] do |p|
        p.input :title
        p.has_many :notes, heading: "Resource Notes", allow_destroy: true do |n|
          n.input :description
          n.input :link
        end
      end
    end

    f.inputs do
      f.inputs "Session Project", for: [:project, f.object.project || Project.new] do |p|
        p.input :title
        p.has_many :notes, heading: "Project Notes", allow_destroy: true do |n|
          n.input :description
          n.input :link
        end
      end
    end

    f.actions
  end

end
