class CreateAdminBlocks < ActiveRecord::Migration
  def change
    create_table :admin_blocks do |t|
      t.string :block_name
      t.integer :district_id

      t.timestamps
    end
  end
end
