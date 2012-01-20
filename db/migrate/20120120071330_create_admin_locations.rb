class CreateAdminLocations < ActiveRecord::Migration
  def change
    create_table :admin_locations do |t|
      t.integer :state_id
      t.string :nama

      t.timestamps
    end
  end
end
