class CreateAdminTitles < ActiveRecord::Migration
  def change
    create_table :admin_titles do |t|
      t.string :nama

      t.timestamps
    end
  end
end
