class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.date :start_date
      t.date :end_date
      t.int :starting_kudos
      t.int :max_kudos_per_user

      t.timestamps
    end
  end
end
