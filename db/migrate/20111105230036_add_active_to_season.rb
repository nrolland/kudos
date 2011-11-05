class AddActiveToSeason < ActiveRecord::Migration
  def change
    add_column :seasons, :active, :boolean, :default => false
  end
end
