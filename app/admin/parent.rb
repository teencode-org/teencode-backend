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
  permit_params :name, :email, :phone_number, :center, :location, students_attributes: [:name, :level, :gender, :_destroy, :id]

  sidebar 'Metrics', only: %i(show edit, index) do
    ul do
      li "Parents Count: #{Parent.count}"
      li "Students Count: #{Student.count}"
      li "Mainland Students Count: #{Student.mainland_students.count}"
      li "Island Students Count: #{Student.island_students.count}"
      li "Mainland Students Approved Count: #{Student.mainland_students.where.not(approved_at: nil).count}"
      li "Island Students Approved Count: #{Student.island_students.where.not(approved_at: nil).count}"
    end
  end

  member_action :approve, :method => :put do
    student = Student.find(params[:id])
    student.update(approved_at: Time.now, approved_by: current_admin_user.id)
    flash[:notice] = "Student approved!"
    redirect_to :action => :index
  end

  member_action :cancel, :method => :put do
    student = Student.find(params[:id])
    student.update(approved_at: nil, approved_by: nil)
    flash[:notice] = "Student cancel!"
    redirect_to :action => :index
  end

  index do
    id_column
    column :name
    column :email
    column :phone_number
    column :center
    column 'Student One Name' do |parent|
      parent.students[0].try!(:name)
    end

    column 'Student One Level' do |parent|
      parent.students[0].try(:level)
    end

    column 'Student One Status' do |parent|
      student = parent.students[0]
      if student
        if student.try(:approved_at)
          link_to "Cancel", url_for(:action => :cancel, :id => student.try(:id)), :method => :put
        else
          link_to "Approve", url_for(:action => :approve, :id => student.try(:id)), :method => :put
        end
      else
        nil
      end
    end

    column 'Student Two Name' do |parent|
      parent.students[1].try(:name)
    end

    column 'Student Two Level' do |parent|
      parent.students[1].try(:level)
    end

    column 'Student Two Status' do |parent|
      student = parent.students[1]
      if student
        if student.try(:approved_at)
          link_to "Cancel", url_for(:action => :cancel, :id => student.try(:id)), :method => :put
        else
          link_to "Approve", url_for(:action => :approve, :id => student.try(:id)), :method => :put
        end
      else
        nil
      end
    end

    actions
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
      f.inputs do
        f.has_many :students, heading: 'Wards', allow_destroy: true do |s|
          s.input :name
          s.input :level
          s.input :gender
        end
      end
    end
    f.actions
  end
end
