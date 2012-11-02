class AddJawatanToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :jawatan, :string, after: :ministry_id
  end
end
