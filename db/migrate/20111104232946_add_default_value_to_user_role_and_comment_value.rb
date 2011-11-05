class AddDefaultValueToUserRoleAndCommentValue < ActiveRecord::Migration
  def change
    change_column :users, :role, :string, :default => :user
    change_column :comments, :value, :integer, :default => 0
  end
end