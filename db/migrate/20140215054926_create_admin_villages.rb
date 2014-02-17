class CreateAdminVillages < ActiveRecord::Migration
  def change
    create_table :admin_villages do |t|
      t.string :village_name
      t.integer :grampanchyat_id

      t.timestamps
    end
  end
end
