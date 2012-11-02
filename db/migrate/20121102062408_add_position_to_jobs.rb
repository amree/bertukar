class AddPositionToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :position, :string, after: :ministry_id
  end
end
