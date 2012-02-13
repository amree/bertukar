class UpdateJobs < ActiveRecord::Migration
  def up
    rename_column :jobs, :position_id, :title_id
    add_column    :jobs, :ministry_id, :integer, after: :title_id
    add_column    :jobs, :job_id, :integer, after: :id
    remove_column :jobs, :jenis
    add_column    :jobs, :is_exchange, :boolean, after: :closed_at
  end

  def down
    rename_column :jobs, :title_id, :position_id
    remove_column :jobs, :ministry_id
    remove_column :jobs, :job_id
    add_column    :jobs, :jenis, :string
    remove_column :jobs, :is_exchange
  end
end
