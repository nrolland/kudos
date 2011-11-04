class CreateKudos < ActiveRecord::Migration
  def change
    create_table :kudos do |t|
      t.string :message

      t.timestamps
    end
  end
end
