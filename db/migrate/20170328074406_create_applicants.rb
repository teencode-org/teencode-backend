class CreateApplicants < ActiveRecord::Migration[5.0]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :profession
      t.text :reason_for_applying
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
