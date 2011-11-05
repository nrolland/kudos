class AddToAndFromToKudo < ActiveRecord::Migration
  def change
    change_table :kudos do |t|
      t.integer :from
      t.integer :to
    end
  end
end
