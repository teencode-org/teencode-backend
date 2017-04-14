ActiveAdmin.register Session do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, project_attributes: [:id, :title, :description, :_destroy => true]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

# index do
#   selectable_column
#   id_column
#   column :title
#   column :description
#   # column :sign_in_count
#   # column :created_at
#   actions
# end

show do
   tabs do
     tab 'Overview' do
       attributes_table do
         row(:title)
         row(:description)
       end
     end

     tab 'Payments' do
       table_for session.projects do
         row('Payment Type') { |p| p.title.titleize }
        #  column('Received On', :created_at)
        #  column('Payment Details & Notes', :notes)
        #  column('Amount') { |p| number_to_currency(p.amount_in_dollars) }
       end
     end
   end
 end

form do |f|
  f.inputs "Curriculum Session" do
    f.input :title, label: "Session Title"
    f.input :description, label: "Session Description"

    f.fields_for :project do |f|
      f.input :title, label: 'Project Title'
      f.input :description, label: 'Project Description'
    end

    f.fields_for :resource do |f|
      f.input :link, label: "Resource Link"
      f.text_area :description, label: 'Resource Description'
    end

    f.fields_for :objective do |f|
      f.input :description, label: 'Objective Description'
    end
  end
  f.actions
end

end
