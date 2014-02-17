class CreateAdminHabitations < ActiveRecord::Migration
  def change
    create_table :admin_habitations do |t|
      t.string :habitation_name
      t.integer :village_id

      t.timestamps
    end
  end
end
