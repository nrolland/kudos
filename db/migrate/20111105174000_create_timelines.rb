class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.integer :event_id
      t.string :event_type

      t.timestamps
    end
  end
end
