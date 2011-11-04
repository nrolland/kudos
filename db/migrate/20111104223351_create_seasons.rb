class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.date :start_date
      t.date :end_date
      t.integer :starting_kudos
      t.integer :max_kudos_per_user

      t.timestamps
    end
  end
end
