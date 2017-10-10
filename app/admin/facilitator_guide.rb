ActiveAdmin.register FacilitatorGuide do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  belongs_to :session
  permit_params :title, :level, :session, :intro_video, :body, author_ids: []

  form do |f|
    f.inputs "Authors" do
      f.input(
        :authors,
        as: :select,
        input_html: { multiple: true, class: "selectpicker" }
      )
    end

    f.inputs "Facilitator Guide" do
      f.input :title
      f.input :level
      f.input :intro_video
      f.input :body, input_html: { class: "tinyMCE" }
    end

    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :level
    column :intro_video
    column "Content", :body do |guide|
      (ActionView::Base.full_sanitizer.sanitize(guide.body[0...100]) + "...")
    end
    column :created_at
    column "Last Update", :updated_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :level
      row :session
      row :authors do |facilitator_guide|
        facilitator_guide.authors.join(", ")
      end
      row :intro_video
      row "Video" do |facilitator_guide|
        video_tag facilitator_guide.intro_video, controls: true
      end
      row :body do |facilitator_guide|
        simple_format facilitator_guide.body
      end
    end
  end
end
