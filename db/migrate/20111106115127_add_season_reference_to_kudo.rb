class AddSeasonReferenceToKudo < ActiveRecord::Migration
  def change
    change_table :kudos do |t|
      t.references :season
    end
  end
end
