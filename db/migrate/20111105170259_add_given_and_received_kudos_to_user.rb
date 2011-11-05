class AddGivenAndReceivedKudosToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :given_kudos
      t.integer :received_kudos
    end
  end
end
