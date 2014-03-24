class AddStatusToMobileDevices < ActiveRecord::Migration
  def change
    add_column :mobile_devices, :status, :integer, :default => 0
  end
end
