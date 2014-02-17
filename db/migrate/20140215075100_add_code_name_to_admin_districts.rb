class AddCodeNameToAdminDistricts < ActiveRecord::Migration
  def change
    add_column :admin_districts, :code, :string
    add_column :admin_districts, :lab_name, :string
  end
end
