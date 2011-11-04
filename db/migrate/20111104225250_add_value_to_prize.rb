class AddValueToPrize < ActiveRecord::Migration
  def change
    add_column :prizes, :value, :integer
  end
end
