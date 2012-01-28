class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :nama

      t.timestamps
    end

    add_index :titles, :nama, unique: true
  end
end
