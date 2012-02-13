class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer   :user_id
      t.integer   :location_id
      t.integer   :position_id
      t.string    :jenis
      t.integer   :gred
      t.text      :nota
      t.string    :nama_organisasi
      t.datetime  :expired_at
      t.datetime  :closed_at

      t.timestamps
    end
  end
end
