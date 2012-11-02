class RemoveTitleIdFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :title_id
  end

  def down
    add_column :jobs, :title_id, :string
  end
end
