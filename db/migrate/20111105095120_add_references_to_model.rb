class AddReferencesToModel < ActiveRecord::Migration
  def change
    change_table :groups do |t| 
      t.references :user
      t.references :season
    end
    change_table :seasons do |t| 
      t.references :kudos
      t.references :prize
    end
    
    
    change_table :users do |t| 
      t.references 
    end
    
    change_table :kudos do |t| 
      t.references :comment
    end    
  end
end
