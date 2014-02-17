class CreateAdminGrampanchyats < ActiveRecord::Migration
  def change
    create_table :admin_grampanchyats do |t|
      t.string :gram_name
      t.integer :block_id

      t.timestamps
    end
  end
end
