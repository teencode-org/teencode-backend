class CreateFacilitatorGuides < ActiveRecord::Migration[5.0]
  def change
    create_table :facilitator_guides do |t|
      t.string :title
      t.string :level
      t.integer :session
      t.string :intro_video
      t.text :body

      t.timestamps
    end
  end
end
