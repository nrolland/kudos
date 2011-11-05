class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.references :event, :polymorphic => true
      t.timestamps
    end
  end
end
