class AddNameToInquiries < ActiveRecord::Migration[5.0]
  def change
    add_column :inquiries, :name, :string
  end
end
