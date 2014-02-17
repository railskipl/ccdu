class CreateAdminZones < ActiveRecord::Migration
  def change
    create_table :admin_zones do |t|
      t.string :zone_name

      t.timestamps
    end
  end
end
