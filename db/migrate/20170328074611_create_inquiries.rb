class CreateInquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :inquiries do |t|
      t.string :email
      t.string :phone_number
      t.text :message

      t.timestamps
    end
  end
end
