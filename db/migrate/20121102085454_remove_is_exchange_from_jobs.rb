class RemoveIsExchangeFromJobs < ActiveRecord::Migration
  def up
    remove_column :jobs, :is_exchange
  end

  def down
    add_column :jobs, :is_exchange, :boolean
  end
end
