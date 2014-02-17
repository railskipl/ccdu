class AddLabPresentToAdminDistricts < ActiveRecord::Migration
  def change
    add_column :admin_districts, :lab_present, :string
  end
end
