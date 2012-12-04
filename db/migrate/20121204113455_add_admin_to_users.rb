class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, after: :last_sign_in_ip
  end
end
