class CreateAdminDistricts < ActiveRecord::Migration
  def change
    create_table :admin_districts do |t|
      t.string :district_name
      t.integer :zone_id

      t.timestamps
    end
  end
end
