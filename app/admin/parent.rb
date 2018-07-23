ActiveAdmin.register Parent do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :name, :email, :phone_number, :center, :location, notes_attributes: %i(name level gebder)

  sidebar 'Metrics', only: %i(show edit) do
    ul do
      li "Parents Count: #{Parent.count}"
      li "Students Count: #{Student.count}"
      li "Mainland Students Count: #{Student.mainland_students.count}"
      li "Island Students Count: #{Student.island_students.count}"
    end
  end

  show do
    attributes_table do
      row :name
      row :email
      row :phone_number
      row :center
      row :location

      panel 'Ward(s)' do
        table_for resource.students do
          column :name
          column :level
          column :gender
        end
      end
    end
  end


  form do |f|
    f.inputs 'Parent Details' do
      f.input :name, label: 'Parent Name'
      f.input :email, label: 'Parent Email'
      f.input :phone_number, label: 'Phone Number'
      f.input :center, label: 'Center'
      f.input :location, label: 'Location'
      f.has_many :students, heading: 'Objective Notes', allow_destroy: true do |s|
        s.input :name
        s.input :level
        s.input :gender
      end
    end
    f.actions
  end
end
