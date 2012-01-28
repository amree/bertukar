class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer   :user_id
      t.integer   :location_id
      t.string    :jenis
      t.string    :skim
      t.integer   :gred
      t.text      :nota
      t.string    :nama_organisasi
      t.datetime  :expired_at
      t.datetime  :closed_at

      t.timestamps
    end
    add_index :jobs, :user_id
    add_index :jobs, :location_id
  end
end
