class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string, after: :email
    add_column :users, :phone, :string, after: :full_name
  end
end
