class AddCodeToAdminBlocks < ActiveRecord::Migration
  def change
    add_column :admin_blocks, :code, :string
    add_column :admin_blocks, :lab_name, :string
  end
end
