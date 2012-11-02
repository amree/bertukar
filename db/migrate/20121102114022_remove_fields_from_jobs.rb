class RemoveFieldsFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :expired_at
    remove_column :jobs, :closed_at
  end

  def down
    add_column :jobs, :closed_at, :datetime
    add_column :jobs, :expired_at, :datetime
  end
end
