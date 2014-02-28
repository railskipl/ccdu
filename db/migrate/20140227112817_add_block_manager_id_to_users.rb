class AddBlockManagerIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :block_manager_id, :integer
  end
end
