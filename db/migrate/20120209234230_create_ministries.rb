class CreateMinistries < ActiveRecord::Migration
  def change
    create_table :ministries do |t|
      t.string :nama
      t.boolean :is_aktif, default: true

      t.timestamps
    end
  end
end
