class AddSkimToTitles < ActiveRecord::Migration
  def change
    add_column :titles, :skim, :string, after: :nama
  end
end
