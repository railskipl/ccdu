class AddUserIdToBlockLaboratories < ActiveRecord::Migration
  def change
    add_column :block_laboratories, :user_id, :integer
  end
end
