class RenameJobIdInJobs < ActiveRecord::Migration
  def change
    rename_column :jobs, :job_id, :current_job_id
  end
end
