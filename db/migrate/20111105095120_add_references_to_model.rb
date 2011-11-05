class AddReferencesToModel < ActiveRecord::Migration
  def change
    
    change_table :users do |t| 
      t.references :group
    end    
    
    change_table :seasons do |t| 
      t.references :group
    end    

    change_table :prizes do |t|
      t.references :season
    end   
    
    change_table :comments do |t|
      t.references :kudo
    end

# TODO kudos relationship

  end
end
