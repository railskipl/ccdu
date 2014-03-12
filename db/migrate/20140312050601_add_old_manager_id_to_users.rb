class AddOldManagerIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :old_manager_id, :integer
    add_column :users, :is_transfer, :boolean,:default => false
  end
end
